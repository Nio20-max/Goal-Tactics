from __future__ import annotations

import argparse
import struct
from dataclasses import dataclass
from pathlib import Path

import dnfile
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


def decompress_image(image: bytes) -> tuple[bytes, bool, int]:
    if len(image) < 12:
        return image, False, 0

    magic, descriptor_index, uncompressed_length = struct.unpack_from("<III", image, 0)
    if magic != XALZ_MAGIC:
        return image, False, 0

    payload = image[12:]
    raw = lz4.block.decompress(payload, uncompressed_size=uncompressed_length)
    return raw, True, descriptor_index


def compress_image(raw: bytes, descriptor_index: int) -> bytes:
    compressed = lz4.block.compress(raw, mode="high_compression", compression=9, store_size=False)
    return struct.pack("<III", XALZ_MAGIC, descriptor_index, len(raw)) + compressed


def detect_assembly_name(payload: bytes) -> str | None:
    try:
        pe = dnfile.dnPE(data=payload)
    except Exception:
        return None

    try:
        if not pe.net or not hasattr(pe.net, "mdtables") or not pe.net.mdtables.Assembly:
            return None
        return pe.net.mdtables.Assembly.rows[0].Name.value
    except Exception:
        return None


def patch_fixed_width(haystack: bytes, old: bytes, new: bytes, pad_byte: bytes = b"\x00") -> tuple[bytes, int]:
    if len(new) > len(old):
        raise ValueError(f"Replacement longer than source: {old!r} -> {new!r}")
    if len(pad_byte) != 1:
        raise ValueError("pad_byte must be a single byte")

    padded = new + pad_byte * (len(old) - len(new))
    count = haystack.count(old)
    if count == 0:
        return haystack, 0
    return haystack.replace(old, padded), count


def patch_fixed_width_utf16le(haystack: bytes, old_text: str, new_text: str, pad_char: str = "\x00") -> tuple[bytes, int]:
    old = old_text.encode("utf-16le")
    new = new_text.encode("utf-16le")
    if len(new) > len(old):
        raise ValueError(f"UTF-16 replacement longer than source: {old_text!r} -> {new_text!r}")
    if len(pad_char) != 1:
        raise ValueError("pad_char must be one character")

    pad_pair = pad_char.encode("utf-16le")

    padded = new + pad_pair * ((len(old) - len(new)) // 2)
    count = haystack.count(old)
    if count == 0:
        return haystack, 0
    return haystack.replace(old, padded), count


def patch_gt_core_payload(payload: bytes, host: str, force_http: bool = False) -> tuple[bytes, dict[str, int]]:
    host = host.strip().rstrip("/")

    https_base = f"https://{host}/"
    http_base = f"http://{host}/"
    new_https_base = http_base if force_http else https_base

    game_https = f"https://{host}/api/"
    game_http = f"http://{host}/api/"
    new_game_https = game_http if force_http else game_https

    replacements = {
        b"https://gtwebapp2.azurewebsites.net/": new_https_base.encode("utf-8"),
        b"http://gtwebapp2-gtwebapp2staging.azurewebsites.net/": f"http://{host}/".encode("utf-8"),
        b"https://engine.goaltactics.de/GameEngine/": new_game_https.encode("utf-8"),
        b"http://goaltacticswebapp-goaltacticswebappstaging.azurewebsites.net/GameEngine/": f"http://{host}/api/".encode("utf-8"),
        b"https://xyrality.com/home/privacy-policy/": new_https_base.encode("utf-8"),
        b"https://play.google.com/store/apps/details?id=com.xyrality.goaltactics": new_https_base.encode("utf-8"),
        b"https://apps.apple.com/us/developer/xyrality-gmbh/id421864157?see-all=i-phonei-pad-apps": new_https_base.encode("utf-8"),
    }

    replacements_utf16 = {
        "https://gtwebapp2.azurewebsites.net/": new_https_base,
        "http://gtwebapp2-gtwebapp2staging.azurewebsites.net/": f"http://{host}/",
        "https://engine.goaltactics.de/GameEngine/": new_game_https,
        "http://goaltacticswebapp-goaltacticswebappstaging.azurewebsites.net/GameEngine/": f"http://{host}/api/",
        "https://xyrality.com/home/privacy-policy/": new_https_base,
        "https://play.google.com/store/apps/details?id=com.xyrality.goaltactics": new_https_base,
        "https://apps.apple.com/us/developer/xyrality-gmbh/id421864157?see-all=i-phonei-pad-apps": new_https_base,
    }

    stats: dict[str, int] = {}
    patched = payload
    for old, new in replacements.items():
        # Avoid NUL bytes in URL literals; slash padding keeps paths parseable.
        patched, count = patch_fixed_width(patched, old, new, pad_byte=b"/")
        stats[old.decode("utf-8")] = count

    for old_text, new_text in replacements_utf16.items():
        patched, count = patch_fixed_width_utf16le(patched, old_text, new_text, pad_char="/")
        stats[f"UTF16:{old_text}"] = count

    return patched, stats


def patch_gt_droid_payload(payload: bytes, host: str) -> tuple[bytes, dict[str, int]]:
    host = host.strip().rstrip("/")

    def fit(text: str, max_len: int) -> str:
        return text[:max_len]

    # Keep Helpshift credentials unchanged: invalidating these causes install-time
    # validation failures during MainActivity startup.

    # Use explicitly invalid values for analytics credentials/hosts so SDK init
    # paths short-circuit instead of attempting network with placeholder tokens.
    replacements_utf8 = {
        b"xyrality.helpshift.com": fit(host, len("xyrality.helpshift.com")).encode("utf-8"),
        b"3tXpUpaBpbZpWF2KPEWQv3": b"invalid-appsflyer-key",
        b"98d71a5a-41a9-4c5a-bf9f-70014a1d0a5f": b"appcenter-disabled-secret-0000000000",
        b"appsflyer.com": b"invalid.local",
        b"launches.appsflyer.com": b"invalid.local",
        b"in.appcenter.ms": b"invalid.local",
        b"ingest.appcenter.ms": b"invalid.local",
    }

    replacements_utf16 = {
        "xyrality.helpshift.com": fit(host, len("xyrality.helpshift.com")),
        "3tXpUpaBpbZpWF2KPEWQv3": "invalid-appsflyer-key",
        "98d71a5a-41a9-4c5a-bf9f-70014a1d0a5f": "appcenter-disabled-secret-0000000000",
        "appsflyer.com": "invalid.local",
        "launches.appsflyer.com": "invalid.local",
        "in.appcenter.ms": "invalid.local",
        "ingest.appcenter.ms": "invalid.local",
    }

    stats: dict[str, int] = {}
    patched = payload

    for old, new in replacements_utf8.items():
        patched, count = patch_fixed_width(patched, old, new, pad_byte=b"/")
        stats[old.decode("utf-8")] = count

    for old_text, new_text in replacements_utf16.items():
        patched, count = patch_fixed_width_utf16le(patched, old_text, new_text, pad_char="/")
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
    parser.add_argument("--patched-gt-core", type=Path)
    parser.add_argument("--patched-gt-droid", type=Path)
    parser.add_argument(
        "--force-http",
        action="store_true",
        help="Rewrite even original https literals to http for compatibility testing on plain-http gateways.",
    )
    parser.add_argument(
        "--allow-unsafe-gt-droid-payload",
        action="store_true",
        help="Allow reinjecting a rewritten GT.Droid payload. This is unsafe for the legacy Xamarin assembly-store startup path and is blocked by default.",
    )
    parser.add_argument(
        "--strip-third-party",
        action="store_true",
        help="Neutralize known third-party SDK literals in GT.Droid (Helpshift/AppCenter/AppsFlyer/IronSource) and legal/share URLs in GT.Core.",
    )
    parser.add_argument("--out", type=Path, required=True)
    args = parser.parse_args()

    if (args.patched_gt_droid is not None or args.strip_third_party) and not args.allow_unsafe_gt_droid_payload:
        raise SystemExit(
            "Refusing to inject a patched GT.Droid payload without --allow-unsafe-gt-droid-payload. "
            "The startup-bypass experiment produced crash-prone compatibility builds; prefer GT.Core-only URL patching."
        )

    blob = args.blob.read_bytes()
    manifest = parse_manifest(args.manifest)
    version, store_id, global_count, locals_, index32, index64, _ = parse_blob(blob)

    gt_core_index: int | None = None
    gt_droid_index: int | None = None
    for i, entry in enumerate(locals_):
        assembly_name: str | None = None
        if entry.data_offset and entry.data_size:
            image = blob[entry.data_offset : entry.data_offset + entry.data_size]
            raw, _was_compressed, _descriptor_index = decompress_image(image)
            assembly_name = detect_assembly_name(raw)

        if assembly_name is None:
            m = manifest.get((store_id, i))
            if m:
                assembly_name = m.name

        if assembly_name == "GT.Core":
            gt_core_index = i
        elif assembly_name == "GT.Droid":
            gt_droid_index = i

    if gt_core_index is None:
        raise RuntimeError("Could not find GT.Core in manifest for this store id")

    if (args.patched_gt_droid is not None or args.strip_third_party) and gt_droid_index is None:
        raise RuntimeError("Could not find GT.Droid in manifest for this store id")

    patched_stats: dict[str, int] = {}
    chunks: list[tuple[bytes, bytes, bytes]] = []

    for i, e in enumerate(locals_):
        data_payload = b""
        debug_payload = b""
        config_payload = b""

        if e.data_offset and e.data_size:
            image = blob[e.data_offset : e.data_offset + e.data_size]
            raw, was_compressed, descriptor_index = decompress_image(image)
            entry_modified = False

            if i == gt_core_index:
                if args.patched_gt_core is not None:
                    raw = args.patched_gt_core.read_bytes()
                    patched_stats = {"patched_gt_core_payload": 1}
                    entry_modified = True
                else:
                    original_raw = raw
                    raw, patched_stats = patch_gt_core_payload(raw, args.host, force_http=args.force_http)
                    entry_modified = raw != original_raw
            elif i == gt_droid_index:
                if args.patched_gt_droid is not None:
                    raw = args.patched_gt_droid.read_bytes()
                    patched_stats["patched_gt_droid_payload"] = 1
                    entry_modified = True
                elif args.strip_third_party:
                    original_raw = raw
                    raw, droid_stats = patch_gt_droid_payload(raw, args.host)
                    entry_modified = raw != original_raw
                    for key, value in droid_stats.items():
                        patched_stats[f"GT.Droid:{key}"] = value

            if entry_modified:
                if was_compressed:
                    data_payload = compress_image(raw, descriptor_index)
                    if len(data_payload) > len(image):
                        raise RuntimeError(
                            "Patched payload exceeds original compressed entry size for "
                            f"store index {i}: original={len(image)} rebuilt={len(data_payload)}. "
                            "This would produce a crash-prone Xamarin assembly store."
                        )
                else:
                    if len(raw) > len(image):
                        raise RuntimeError(
                            "Patched payload exceeds original uncompressed entry size for "
                            f"store index {i}: original={len(image)} rebuilt={len(raw)}."
                        )
                    data_payload = raw
            else:
                data_payload = image

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
