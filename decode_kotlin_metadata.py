#!/usr/bin/env python3
"""
Heuristic decoder for .kotlin_metadata protobuf blobs.

Usage:
  python3 decode_kotlin_metadata.py [path]

If [path] is a file, it decodes that file. If it's a directory (default '.'),
it recursively finds all `.kotlin_metadata` files and creates a `.decoded.txt`
sidecar file with a readable representation.

This is not a full Kotlin metadata parser, but a generic protobuf wire-format
inspector that prints field numbers, wire types and attempts to decode
length-delimited fields as UTF-8 strings and nested messages.
"""
import sys
import os
import argparse
import textwrap


def read_varint(data, pos):
    result = 0
    shift = 0
    while True:
        if pos >= len(data):
            raise EOFError('Unexpected EOF while reading varint')
        b = data[pos]
        pos += 1
        result |= (b & 0x7F) << shift
        if not (b & 0x80):
            break
        shift += 7
        if shift >= 64:
            raise ValueError('Varint too long')
    return result, pos


def is_printable_utf8(bs):
    try:
        s = bs.decode('utf-8')
    except Exception:
        return False, None
    # check ratio of printable characters
    printable = sum(1 for ch in s if ch.isprintable() or ch in '\t\r\n')
    if len(s) == 0:
        return False, s
    return (printable / len(s)) > 0.6, s


def parse_message(data, start=0, end=None, depth=0, max_depth=10):
    if end is None:
        end = len(data)
    pos = start
    out = []
    indent = '  ' * depth
    while pos < end:
        try:
            key, pos = read_varint(data, pos)
        except EOFError:
            break
        field_number = key >> 3
        wire_type = key & 0x7
        entry = {'field': field_number, 'wire_type': wire_type}
        if wire_type == 0:  # varint
            try:
                val, pos = read_varint(data, pos)
                entry['value'] = val
            except Exception:
                entry['value'] = '<truncated-varint>'
                pos = end
        elif wire_type == 1:  # 64-bit
            if pos + 8 > end:
                entry['value'] = '<truncated 64-bit>'
                pos = end
            else:
                entry['value'] = data[pos:pos+8].hex()
                pos += 8
        elif wire_type == 2:  # length-delimited
            try:
                length, pos = read_varint(data, pos)
            except Exception:
                entry['value'] = {'bytes_hex': b'' .hex()}
                pos = end
                out.append(entry)
                break
            if pos + length > end:
                length = max(0, end - pos)
            chunk = data[pos:pos+length]
            pos += length
            printable, text = is_printable_utf8(chunk)
            if printable:
                entry['value'] = {'text': text}
            else:
                # try to parse nested message heuristically; if it fails, fall back
                if depth < max_depth and len(chunk) > 0:
                    try:
                        nested = parse_message(chunk, 0, len(chunk), depth+1, max_depth)
                    except Exception:
                        nested = None
                    if nested:
                        entry['value'] = {'nested': nested}
                    else:
                        entry['value'] = {'bytes_hex': chunk.hex()}
                else:
                    entry['value'] = {'bytes_hex': chunk.hex()}
        elif wire_type == 5:  # 32-bit
            if pos + 4 > end:
                entry['value'] = '<truncated 32-bit>'
                pos = end
            else:
                entry['value'] = data[pos:pos+4].hex()
                pos += 4
        else:
            entry['value'] = '<unknown wire type %d>' % wire_type
            break
        out.append(entry)
    return out


def pretty_print(parsed, indent=''):
    lines = []
    for e in parsed:
        field = e['field']
        wt = e['wire_type']
        val = e.get('value')
        if isinstance(val, dict) and 'text' in val:
            txt = val['text']
            txt = txt.replace('\r', '\\r').replace('\n', '\\n')
            lines.append(f"{indent}field {field} (wire {wt}): text: {txt}")
        elif isinstance(val, dict) and 'nested' in val:
            lines.append(f"{indent}field {field} (wire {wt}): nested message {{")
            lines.extend(pretty_print(val['nested'], indent + '  '))
            lines.append(f"{indent}}}")
        elif isinstance(val, dict) and 'bytes_hex' in val:
            h = val['bytes_hex']
            # show short hex if long
            short = h if len(h) < 120 else h[:120] + '...'
            lines.append(f"{indent}field {field} (wire {wt}): bytes(hex) {short}")
        else:
            lines.append(f"{indent}field {field} (wire {wt}): {val}")
    return lines


def process_file(path, outpath=None):
    with open(path, 'rb') as f:
        data = f.read()
    parsed = parse_message(data, 0, len(data))
    pretty = pretty_print(parsed)
    if outpath is None:
        outpath = path + '.decoded.txt'
    with open(outpath, 'w', encoding='utf-8') as f:
        f.write('# Decoded: ' + path + '\n')
        f.write('\n'.join(pretty))
    return outpath


def find_and_process(root):
    processed = []
    for dirpath, dirs, files in os.walk(root):
        for fn in files:
            if fn.endswith('.kotlin_metadata'):
                path = os.path.join(dirpath, fn)
                try:
                    out = process_file(path)
                    processed.append((path, out))
                except Exception as e:
                    print('Failed to process', path, e, file=sys.stderr)
    return processed


def main():
    p = argparse.ArgumentParser(description='Decode .kotlin_metadata protobuf blobs heuristically')
    p.add_argument('path', nargs='?', default='.', help='file or directory to process')
    args = p.parse_args()
    path = args.path
    if os.path.isfile(path):
        out = process_file(path)
        print('Wrote', out)
    elif os.path.isdir(path):
        results = find_and_process(path)
        for src, out in results:
            print('Wrote', out)
        print('Processed', len(results), 'files')
    else:
        print('Path not found:', path, file=sys.stderr)
        sys.exit(2)


if __name__ == '__main__':
    main()
