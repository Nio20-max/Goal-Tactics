#!/usr/bin/env python3
"""
traffic/capture.py — Capture an HTTP request/response pair and save it as a
                     Markdown file in this directory.

Usage:
    python3 traffic/capture.py
"""

import re
import sys
from pathlib import Path

TRAFFIC_DIR = Path(__file__).parent


def read_multiline(prompt: str) -> str:
    """Read lines until the user enters '---' alone on a line."""
    print(prompt)
    print("  (paste content, enter  ---  on its own line when done)")
    lines: list[str] = []
    while True:
        try:
            line = input()
        except EOFError:
            break
        if line.strip() == "---":
            break
        lines.append(line)
    return "\n".join(lines)


def sanitize_filename(url: str) -> str:
    """Turn a URL into a safe filename (no extension)."""
    name = re.sub(r"^https?://", "", url)   # strip protocol
    name = re.sub(r"[^\w\-.]", "_", name)   # replace unsafe chars
    name = re.sub(r"_+", "_", name)          # collapse runs of _
    return name.strip("_.") or "capture"


def main() -> None:
    print("=== Traffic Capture ===\n")

    url = input("URL: ").strip()
    if not url:
        print("Error: URL cannot be empty.", file=sys.stderr)
        sys.exit(1)

    request = read_multiline("\nRequest:")
    response = read_multiline("\nResponse:")

    filename = sanitize_filename(url) + ".md"
    out_path = TRAFFIC_DIR / filename

    md = (
        f"# {url}\n\n"
        f"## Request\n\n"
        f"```\n{request}\n```\n\n"
        f"## Response\n\n"
        f"```\n{response}\n```\n"
    )

    out_path.write_text(md, encoding="utf-8")
    print(f"\nSaved → {out_path}")


if __name__ == "__main__":
    while True: 
        main()
