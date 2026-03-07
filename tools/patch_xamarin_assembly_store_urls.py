from __future__ import annotations

import argparse
import struct
from dataclasses import dataclass
from pathlib import Path

import lz4.block


XABA_MAGIC = 0x41424158
XALZ_MAGIC = 0x5A4C4158


@dataclass
class LocalEntry:
    data_offset: int
    data_size: int
    debug_data_offset: int
    debug_data_size: int
    config_data_offset: int
    config_data_size: int


@dataclass
class ManifestEntry:
    store_id: int
    store_index: int
    name: str


def parse_manifest(path: Path) -> dict[tuple[int, int], ManifestEntry]:
    entries: dict[tuple[int, int], ManifestEntry] = {}
    lines = path.read_text(encoding="utf-8").splitlines()
    for line in lines[1:]:
        parts = line.split()
        if len(parts) != 5:
            continue
        store_id = int(parts[2], 16)
        store_index = int(parts[3], 16)
        entries[(store_id, store_index)] = ManifestEntry(store_id=store_id, store_index=store_index, name=parts[4].strip())
    return entries


def parse_blob(blob: bytes) -> tuple[int, int, int, list[LocalEntry], bytes, bytes, int]:
    magic, version, local_count, global_count, store_id = struct.unpack_from("<IIIII", blob, 0)
    if magic != XABA_MAGIC:
        raise ValueError(f"Invalid blob magic: 0x{magic:08x}")

    off = 20
    locals_: list[LocalEntry] = []
    for _ in range(local_count):
        locals_.append(LocalEntry(*struct.unpack_from("<IIIIII", blob, off)))
        off += 24

    index32 = blob[off : off + (global_count * 20)]
    off += global_count * 20
    index64 = blob[off : off + (global_count * 20)]
    off += global_count * 20

    return version, store_id, global_count, locals_, index32, index64, off


def decompress_image(image: bytes) -> tuple[bytes, bool]:
    if len(image) < 12:
        return image, False

    magic, _descriptor_index, uncompressed_length = struct.unpack_from("<III", image, 0)
    if magic != XALZ_MAGIC:
        return image, False

    payload = image[12:]
    raw = lz4.block.decompress(payload, uncompressed_size=uncompressed_length)
    return raw, True


def compress_image(raw: bytes) -> bytes:
    compressed = lz4.block.compress(raw, mode="high_compression", compression=9, store_size=False)
    return struct.pack("<III", XALZ_MAGIC, 0, len(raw)) + compressed


def patch_fixed_width(haystack: bytes, old: bytes, new: bytes) -> tuple[bytes, int]:
    if len(new) > len(old):
        raise ValueError(f"Replacement longer than source: {old!r} -> {new!r}")

    padded = new + b"\x00" * (len(old) - len(new))
    count = haystack.count(old)
    if count == 0:
        return haystack, 0
    return haystack.replace(old, padded), count


def patch_fixed_width_utf16le(haystack: bytes, old_text: str, new_text: str) -> tuple[bytes, int]:
    old = old_text.encode("utf-16le")
    new = new_text.encode("utf-16le")
    if len(new) > len(old):
        raise ValueError(f"UTF-16 replacement longer than source: {old_text!r} -> {new_text!r}")

    padded = new + b"\x00" * (len(old) - len(new))
    count = haystack.count(old)
    if count == 0:
        return haystack, 0
    return haystack.replace(old, padded), count


def patch_gt_core_payload(payload: bytes, host: str) -> tuple[bytes, dict[str, int]]:
    host = host.strip().rstrip("/")

    replacements = {
        b"https://gtwebapp2.azurewebsites.net/": f"https://{host}/".encode("utf-8"),
        b"http://gtwebapp2-gtwebapp2staging.azurewebsites.net/": f"http://{host}/".encode("utf-8"),
        b"https://engine.goaltactics.de/GameEngine/": f"https://{host}/api/".encode("utf-8"),
        b"http://goaltacticswebapp-goaltacticswebappstaging.azurewebsites.net/GameEngine/": f"http://{host}/api/".encode("utf-8"),
    }

    replacements_utf16 = {
        "https://gtwebapp2.azurewebsites.net/": f"https://{host}/",
        "http://gtwebapp2-gtwebapp2staging.azurewebsites.net/": f"http://{host}/",
        "https://engine.goaltactics.de/GameEngine/": f"https://{host}/api/",
        "http://goaltacticswebapp-goaltacticswebappstaging.azurewebsites.net/GameEngine/": f"http://{host}/api/",
    }

    stats: dict[str, int] = {}
    patched = payload
    for old, new in replacements.items():
        patched, count = patch_fixed_width(patched, old, new)
        stats[old.decode("utf-8")] = count

    for old_text, new_text in replacements_utf16.items():
        patched, count = patch_fixed_width_utf16le(patched, old_text, new_text)
        stats[f"UTF16:{old_text}"] = count

    return patched, stats


def rebuild_blob(
    version: int,
    store_id: int,
    global_count: int,
    locals_: list[LocalEntry],
    index32: bytes,
    index64: bytes,
    data_chunks: list[tuple[bytes, bytes, bytes]],
) -> bytes:
    local_count = len(locals_)
    header = struct.pack("<IIIII", XABA_MAGIC, version, local_count, global_count, store_id)

    local_table_size = local_count * 24
    first_data_offset = 20 + local_table_size + len(index32) + len(index64)

    out_locals: list[LocalEntry] = []
    cursor = first_data_offset

    blob_parts: list[bytes] = []
    for data_payload, debug_payload, config_payload in data_chunks:
        if data_payload:
            data_offset = cursor
            data_size = len(data_payload)
            cursor += data_size
            blob_parts.append(data_payload)
        else:
            data_offset = 0
            data_size = 0

        if debug_payload:
            debug_offset = cursor
            debug_size = len(debug_payload)
            cursor += debug_size
            blob_parts.append(debug_payload)
        else:
            debug_offset = 0
            debug_size = 0

        if config_payload:
            config_offset = cursor
            config_size = len(config_payload)
            cursor += config_size
            blob_parts.append(config_payload)
        else:
            config_offset = 0
            config_size = 0

        out_locals.append(
            LocalEntry(
                data_offset=data_offset,
                data_size=data_size,
                debug_data_offset=debug_offset,
                debug_data_size=debug_size,
                config_data_offset=config_offset,
                config_data_size=config_size,
            )
        )

    local_table = bytearray()
    for e in out_locals:
        local_table.extend(
            struct.pack(
                "<IIIIII",
                e.data_offset,
                e.data_size,
                e.debug_data_offset,
                e.debug_data_size,
                e.config_data_offset,
                e.config_data_size,
            )
        )

    rebuilt = bytearray()
    rebuilt.extend(header)
    rebuilt.extend(local_table)
    rebuilt.extend(index32)
    rebuilt.extend(index64)
    for p in blob_parts:
        rebuilt.extend(p)
    return bytes(rebuilt)


def main() -> None:
    parser = argparse.ArgumentParser(description="Patch Xamarin assemblies.blob URL constants in GT.Core and rebuild blob.")
    parser.add_argument("--blob", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--host", type=str, required=True)
    parser.add_argument("--out", type=Path, required=True)
    args = parser.parse_args()

    blob = args.blob.read_bytes()
    manifest = parse_manifest(args.manifest)
    version, store_id, global_count, locals_, index32, index64, _ = parse_blob(blob)

    gt_core_index: int | None = None
    for i, _entry in enumerate(locals_):
        m = manifest.get((store_id, i))
        if m and m.name == "GT.Core":
            gt_core_index = i
            break

    if gt_core_index is None:
        raise RuntimeError("Could not find GT.Core in manifest for this store id")

    patched_stats: dict[str, int] = {}
    chunks: list[tuple[bytes, bytes, bytes]] = []

    for i, e in enumerate(locals_):
        data_payload = b""
        debug_payload = b""
        config_payload = b""

        if e.data_offset and e.data_size:
            image = blob[e.data_offset : e.data_offset + e.data_size]
            raw, was_compressed = decompress_image(image)

            if i == gt_core_index:
                raw, patched_stats = patch_gt_core_payload(raw, args.host)

            data_payload = compress_image(raw) if was_compressed else raw

        if e.debug_data_offset and e.debug_data_size:
            debug_payload = blob[e.debug_data_offset : e.debug_data_offset + e.debug_data_size]

        if e.config_data_offset and e.config_data_size:
            config_payload = blob[e.config_data_offset : e.config_data_offset + e.config_data_size]

        chunks.append((data_payload, debug_payload, config_payload))

    rebuilt = rebuild_blob(version, store_id, global_count, locals_, index32, index64, chunks)
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_bytes(rebuilt)

    print(f"Patched GT.Core store index: {gt_core_index}")
    for k, v in patched_stats.items():
        print(f"{k} -> replacements: {v}")
    print(f"Wrote: {args.out}")


if __name__ == "__main__":
    main()
