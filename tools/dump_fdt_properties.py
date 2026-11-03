#!/usr/bin/env python3
"""Write an exploratory node/property inventory from a flattened device tree."""
import argparse
import struct
from pathlib import Path

BEGIN_NODE, END_NODE, PROP, NOP, END = 1, 2, 3, 4, 9


def u32(buf, offset):
    return struct.unpack_from(">I", buf, offset)[0]


def align4(n):
    return (n + 3) & ~3


def render_value(value):
    if value and value.endswith(b"\0"):
        parts = value[:-1].split(b"\0")
        try:
            strings = [p.decode("utf-8") for p in parts]
            if all(s and all(ch.isprintable() for ch in s) for s in strings):
                return "strings " + " | ".join(repr(s) for s in strings)
        except UnicodeDecodeError:
            pass
    if len(value) and len(value) % 4 == 0:
        cells = struct.unpack(">" + "I" * (len(value) // 4), value)
        if len(cells) <= 32:
            return "cells " + " ".join(f"0x{x:08x}" for x in cells)
        return f"{len(value)} bytes; first cells " + " ".join(f"0x{x:08x}" for x in cells[:32])
    preview = value[:64].hex(" ")
    suffix = " …" if len(value) > 64 else ""
    return f"{len(value)} bytes; hex {preview}{suffix}"


def dump(path):
    data = Path(path).read_bytes()
    if len(data) < 40 or u32(data, 0) != 0xD00DFEED:
        raise ValueError(f"{path}: not an FDT blob")
    total, struct_off, strings_off, reserve_off, version, last_version, boot_cpu, strings_size, struct_size = struct.unpack_from(">9I", data, 4)
    if total > len(data):
        raise ValueError(f"{path}: header size {total} exceeds file size {len(data)}")
    structure = data[struct_off:struct_off + struct_size]
    strings = data[strings_off:strings_off + strings_size]
    pos = 0
    stack = []
    lines = [f"# Exploratory FDT property inventory: {path}",
             f"# size={total} version={version} compatible_version={last_version} boot_cpu={boot_cpu}"]
    while pos + 4 <= len(structure):
        token = u32(structure, pos)
        pos += 4
        if token == BEGIN_NODE:
            end = structure.find(b"\0", pos)
            if end < 0:
                raise ValueError("unterminated node name")
            name = structure[pos:end].decode("utf-8", "replace")
            pos = align4(end + 1)
            stack.append(name)
            if len(stack) == 1:
                nodepath = "/"
            else:
                nodepath = "/" + "/".join(x for x in stack[1:] if x)
            lines.append(f"\n[{nodepath}]")
        elif token == END_NODE:
            if stack:
                stack.pop()
        elif token == PROP:
            if pos + 8 > len(structure):
                raise ValueError("truncated property header")
            length, nameoff = struct.unpack_from(">II", structure, pos)
            pos += 8
            end = pos + length
            if end > len(structure) or nameoff >= len(strings):
                raise ValueError("property outside FDT sections")
            name_end = strings.find(b"\0", nameoff)
            if name_end < 0:
                raise ValueError("unterminated property name")
            prop = strings[nameoff:name_end].decode("utf-8", "replace")
            value = structure[pos:end]
            pos = align4(end)
            lines.append(f"  {prop}: {render_value(value)}")
        elif token == NOP:
            continue
        elif token == END:
            break
        else:
            raise ValueError(f"unknown FDT structure token {token} at {pos - 4}")
    return "\n".join(lines) + "\n"


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("input", help="FDT .dtb file")
    ap.add_argument("output", help="output text inventory")
    args = ap.parse_args()
    Path(args.output).write_text(dump(args.input), encoding="utf-8")
    print(f"Wrote {args.output}")


if __name__ == "__main__":
    main()
