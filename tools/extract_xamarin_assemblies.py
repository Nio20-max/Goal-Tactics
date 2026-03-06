from __future__ import annotations

import argparse
import struct
from dataclasses import dataclass
from pathlib import Path

import dnfile
import lz4.block


@dataclass
class ManifestEntry:
    hash32: int
    hash64: int
    store_id: int
    store_index: int
    name: str


@dataclass
class LocalEntry:
    data_offset: int
    data_size: int
    debug_data_offset: int
    debug_data_size: int
    config_data_offset: int
    config_data_size: int


@dataclass
class GlobalIndexEntry:
    hash_value: int
    mapping_index: int
    local_store_index: int
    store_id: int


XABA_MAGIC = 0x41424158
XALZ_MAGIC = 0x5A4C4158


def parse_manifest(path: Path) -> dict[tuple[int, int], ManifestEntry]:
    entries: dict[tuple[int, int], ManifestEntry] = {}
    lines = path.read_text(encoding="utf-8").splitlines()
    for line in lines[1:]:
        parts = line.split()
        if len(parts) != 5:
            continue
        entry = ManifestEntry(
            hash32=int(parts[0], 16),
            hash64=int(parts[1], 16),
            store_id=int(parts[2], 16),
            store_index=int(parts[3], 16),
            name=parts[4].strip(),
        )
        entries[(entry.store_id, entry.store_index)] = entry
    return entries


def parse_blob(path: Path) -> tuple[int, int, int, list[LocalEntry], list[GlobalIndexEntry], list[GlobalIndexEntry], int]:
    data = path.read_bytes()
    magic, version, local_count, global_count, store_id = struct.unpack_from("<IIIII", data, 0)
    if magic != XABA_MAGIC:
        raise ValueError(f"Invalid blob magic: 0x{magic:08x}")

    offset = 20
    locals_: list[LocalEntry] = []
    for _ in range(local_count):
        entry = LocalEntry(*struct.unpack_from("<IIIIII", data, offset))
        locals_.append(entry)
        offset += 24

    index32: list[GlobalIndexEntry] = []
    for _ in range(global_count):
        hash_value, mapping_index, local_store_index, entry_store_id = struct.unpack_from("<QIII", data, offset)
        index32.append(GlobalIndexEntry(hash_value, mapping_index, local_store_index, entry_store_id))
        offset += 20

    index64: list[GlobalIndexEntry] = []
    for _ in range(global_count):
        hash_value, mapping_index, local_store_index, entry_store_id = struct.unpack_from("<QIII", data, offset)
        index64.append(GlobalIndexEntry(hash_value, mapping_index, local_store_index, entry_store_id))
        offset += 20

    return version, global_count, store_id, locals_, index32, index64, offset


def ensure_suffix(name: str, suffix: str) -> str:
    return name if name.lower().endswith(suffix.lower()) else f"{name}{suffix}"


def maybe_decompress(image: bytes) -> bytes:
    if len(image) < 12:
        return image

    magic, _descriptor_index, uncompressed_length = struct.unpack_from("<III", image, 0)
    if magic != XALZ_MAGIC:
        return image

    payload = image[12:]
    return lz4.block.decompress(payload, uncompressed_size=uncompressed_length)


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


def write_if_present(blob: bytes, offset: int, size: int, output_path: Path, strip_nul: bool = False) -> None:
    if offset == 0 or size == 0:
        return
    output_path.parent.mkdir(parents=True, exist_ok=True)
    payload = blob[offset:offset + size]
    if strip_nul:
        payload = payload.rstrip(b"\x00")
    output_path.write_bytes(payload)


def extract(blob_path: Path, manifest_path: Path, output_dir: Path) -> None:
    blob = blob_path.read_bytes()
    manifest = parse_manifest(manifest_path)
    version, global_count, store_id, local_entries, index32, index64, first_data_offset = parse_blob(blob_path)

    names_by_local_index: dict[int, str] = {}
    for entry in index32 + index64:
        if entry.store_id != store_id:
            continue
        manifest_entry = manifest.get((entry.store_id, entry.local_store_index))
        if manifest_entry is not None:
            names_by_local_index.setdefault(entry.local_store_index, manifest_entry.name)

    output_dir.mkdir(parents=True, exist_ok=True)

    print(f"Assembly store version: {version}")
    print(f"Local entries: {len(local_entries)}")
    print(f"Global index entries: {global_count}")
    print(f"Store ID: {store_id}")
    print(f"First data offset: {first_data_offset}")

    for index, entry in enumerate(local_entries):
        if entry.data_offset == 0 or entry.data_size == 0:
            print(f"Skipped store{store_id}_idx{index} (no image payload)")
            continue

        image = blob[entry.data_offset:entry.data_offset + entry.data_size]
        payload = maybe_decompress(image)
        actual_name = detect_assembly_name(payload)
        name = actual_name or names_by_local_index.get(index, f"store{store_id}_idx{index}")

        dll_path = output_dir / ensure_suffix(name, ".dll")
        dll_path.parent.mkdir(parents=True, exist_ok=True)
        dll_path.write_bytes(payload)

        write_if_present(blob, entry.debug_data_offset, entry.debug_data_size, output_dir / ensure_suffix(name, ".pdb"))
        write_if_present(
            blob,
            entry.config_data_offset,
            entry.config_data_size,
            output_dir / ensure_suffix(name, ".dll.config"),
            strip_nul=True,
        )

        print(f"Extracted {name}")


def main() -> None:
    parser = argparse.ArgumentParser(description="Extract Xamarin managed assemblies from an assembly-store v1 blob.")
    parser.add_argument("--blob", type=Path, default=Path("output_dir/resources/assemblies/assemblies.blob"))
    parser.add_argument("--manifest", type=Path, default=Path("output_dir/resources/assemblies/assemblies.manifest"))
    parser.add_argument("--out", type=Path, default=Path("extracted_managed"))
    args = parser.parse_args()

    extract(args.blob, args.manifest, args.out)


if __name__ == "__main__":
    main()