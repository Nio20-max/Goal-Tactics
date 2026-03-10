#!/usr/bin/env python3
"""
UI Capture Pipeline for Goal Tactics app reverse engineering.

Captures a screenshot + UI hierarchy dump via ADB, runs background image
comparison against app resources, and calls GPT-5 mini via GitHub Models
API to describe the UI.

Usage:
    python tools/capture_ui.py <category> [subcategory]
    python tools/capture_ui.py main_menu
    python tools/capture_ui.py squad players_list
    python tools/capture_ui.py transfer search_results

Outputs are saved to:
    analysis/ui_captures/<category>/[<subcategory>/]
        screenshot.png
        ui_dump.xml
        image_matches.json
        analysis.md
        metadata.json
"""

import argparse
import base64
import json
import os
import subprocess
import sys
import time
from datetime import datetime, timezone
from io import BytesIO
from pathlib import Path

# ── Constants ────────────────────────────────────────────────────────────

REPO_ROOT = Path(__file__).resolve().parent.parent
_ADB_DEVICE = os.environ.get("ADB_DEVICE", "10.8.0.2:34343")
GITHUB_MODELS_API = "https://models.github.ai/inference/chat/completions"
MODEL = "openai/gpt-5-mini"
MAX_COMPLETION_TOKENS = 4000
MAX_RETRIES = 3
RETRY_BACKOFF = 10  # seconds

SYSTEM_PROMPT = """\
You are a UI analyst reverse-engineering a mobile football manager game "Goal Tactics".
Describe the screenshot for a developer recreating the UI.
Cover: layout, elements (buttons/labels/icons/lists), all visible text, colors, navigation, game elements (currencies/stats), and spatial positioning.
Be systematic: top-to-bottom, left-to-right. Use bullet points."""

# If image matches are available, they'll be appended to the user message.

# ── Helpers ──────────────────────────────────────────────────────────────

def run_adb(args: list[str], capture_output=True) -> subprocess.CompletedProcess:
    cmd = ["adb", "-s", _ADB_DEVICE] + args
    return subprocess.run(cmd, capture_output=capture_output, timeout=30)


def get_gh_token() -> str:
    result = subprocess.run(["gh", "auth", "token"], capture_output=True, text=True, timeout=10)
    if result.returncode != 0:
        print("ERROR: Could not get GitHub token. Run 'gh auth login' first.", file=sys.stderr)
        sys.exit(1)
    return result.stdout.strip()


def capture_screenshot(output_path: Path) -> None:
    """Capture screenshot via ADB and save as PNG."""
    print("  Capturing screenshot...")
    result = run_adb(["exec-out", "screencap", "-p"])
    if result.returncode != 0:
        raise RuntimeError(f"ADB screencap failed: {result.stderr.decode()}")
    output_path.write_bytes(result.stdout)
    size_kb = len(result.stdout) / 1024
    print(f"  Screenshot saved: {output_path} ({size_kb:.0f} KB)")


def capture_ui_dump(output_path: Path) -> None:
    """Capture UI hierarchy XML via ADB."""
    print("  Capturing UI dump...")
    run_adb(["shell", "uiautomator", "dump", "/sdcard/window_dump.xml"])
    result = run_adb(["exec-out", "cat", "/sdcard/window_dump.xml"])
    if result.returncode != 0:
        raise RuntimeError(f"ADB UI dump failed: {result.stderr.decode()}")
    output_path.write_bytes(result.stdout)
    size_kb = len(result.stdout) / 1024
    print(f"  UI dump saved: {output_path} ({size_kb:.0f} KB)")


def screenshot_to_base64_jpeg(png_path: Path, max_dim: int = 800, quality: int = 60) -> str:
    """Convert screenshot PNG to base64-encoded JPEG for API transmission."""
    from PIL import Image
    img = Image.open(png_path).convert("RGB")

    # Resize if too large
    w, h = img.size
    if max(w, h) > max_dim:
        scale = max_dim / max(w, h)
        img = img.resize((int(w * scale), int(h * scale)), Image.LANCZOS)

    buf = BytesIO()
    img.save(buf, format="JPEG", quality=quality)
    return base64.b64encode(buf.getvalue()).decode("ascii")


def start_image_comparison(screenshot_path: Path, output_path: Path) -> subprocess.Popen:
    """Launch image comparison script as background process."""
    compare_script = REPO_ROOT / "tools" / "compare_images.py"
    python = sys.executable

    print("  Starting background image comparison...")
    proc = subprocess.Popen(
        [python, str(compare_script), str(screenshot_path), "--output", str(output_path)],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )
    return proc


def call_gpt5_mini(token: str, screenshot_b64: str, image_matches: list[dict] | None = None) -> str:
    """Call GPT-5 mini via GitHub Models API with the screenshot."""
    import urllib.request
    import urllib.error

    user_parts = []
    user_parts.append({
        "type": "text",
        "text": "Analyze this Goal Tactics app screenshot. Describe every UI element."
    })
    user_parts.append({
        "type": "image_url",
        "image_url": {
            "url": f"data:image/jpeg;base64,{screenshot_b64}",
            "detail": "low"
        }
    })

    # Add compact image match summary if available (just names, no coordinates)
    if image_matches:
        unique_names = sorted(set(m["image"] for m in image_matches))[:20]
        names_str = ", ".join(n.replace(".png", "") for n in unique_names)
        user_parts.append({
            "type": "text",
            "text": f"Matched app resources: {names_str}"
        })

    payload = {
        "model": MODEL,
        "messages": [
            {"role": "system", "content": SYSTEM_PROMPT},
            {"role": "user", "content": user_parts},
        ],
        "max_completion_tokens": MAX_COMPLETION_TOKENS,
    }

    headers = {
        "Authorization": f"Bearer {token}",
        "Content-Type": "application/json",
    }

    data = json.dumps(payload).encode("utf-8")
    req = urllib.request.Request(GITHUB_MODELS_API, data=data, headers=headers, method="POST")

    for attempt in range(1, MAX_RETRIES + 1):
        try:
            print(f"  Calling GPT-5 mini (attempt {attempt}/{MAX_RETRIES})...")
            with urllib.request.urlopen(req, timeout=120) as resp:
                body = json.loads(resp.read().decode("utf-8"))
                content = body["choices"][0]["message"].get("content", "")
                usage = body.get("usage", {})
                print(f"  API response: {usage.get('completion_tokens', '?')} completion tokens "
                      f"({usage.get('completion_tokens_details', {}).get('reasoning_tokens', '?')} reasoning)")

                if not content and attempt < MAX_RETRIES:
                    print("  Empty response (all tokens went to reasoning), retrying with more tokens...", file=sys.stderr)
                    payload["max_completion_tokens"] = MAX_COMPLETION_TOKENS * 2
                    data = json.dumps(payload).encode("utf-8")
                    req = urllib.request.Request(GITHUB_MODELS_API, data=data, headers=headers, method="POST")
                    continue
                return content

        except urllib.error.HTTPError as e:
            if e.code == 429 and attempt < MAX_RETRIES:
                wait = RETRY_BACKOFF * attempt
                print(f"  Rate limited (429), waiting {wait}s...", file=sys.stderr)
                time.sleep(wait)
                continue
            raise RuntimeError(f"API error {e.code}: {e.read().decode()}")
        except urllib.error.URLError as e:
            if attempt < MAX_RETRIES:
                print(f"  Network error: {e}, retrying...", file=sys.stderr)
                time.sleep(5)
                continue
            raise

    return ""


# ── Main ─────────────────────────────────────────────────────────────────

def main():
    global _ADB_DEVICE

    parser = argparse.ArgumentParser(
        description="Capture UI screenshot, dump, and analysis for Goal Tactics app",
        epilog="Examples:\n  capture_ui.py main_menu\n  capture_ui.py squad players_list",
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument("category", nargs='?', help="Main category (e.g., main_menu, squad, transfer)")
    parser.add_argument("subcategory", nargs="?", default=None,
                        help="Optional subcategory (e.g., players_list, search_results)")
    parser.add_argument("--skip-ai", action="store_true", help="Skip GPT-5 mini analysis")
    parser.add_argument("--skip-compare", action="store_true", help="Skip image comparison")
    parser.add_argument("--device", default=None, help=f"ADB device (default: {_ADB_DEVICE})")
    args = parser.parse_args()

    if args.device:
        _ADB_DEVICE = args.device

    # For offline/manual runs: do not run image comparison or call the GPT-5 mini by default.
    # These can still be enabled by editing the script if needed.
    args.skip_compare = True
    args.skip_ai = True

    def do_capture(category, subcategory, args):
        # Build output directory
        out_dir = REPO_ROOT / "analysis" / "ui_captures" / category
        if subcategory:
            out_dir = out_dir / subcategory
        out_dir.mkdir(parents=True, exist_ok=True)

        timestamp = datetime.now(timezone.utc).strftime("%Y%m%d_%H%M%S")
        screenshot_path = out_dir / "screenshot.png"
        dump_path = out_dir / "ui_dump.xml"
        matches_path = out_dir / "image_matches.json"
        analysis_path = out_dir / "analysis.md"
        metadata_path = out_dir / "metadata.json"

        print(f"═══ Goal Tactics UI Capture ═══")
        print(f"  Category:    {category}")
        print(f"  Subcategory: {subcategory or '(none)'}")
        print(f"  Output:      {out_dir}")
        print()

        # Step 1: Capture screenshot and UI dump
        print("Step 1: ADB capture")
        capture_screenshot(screenshot_path)
        capture_ui_dump(dump_path)
        print()

        # Step 2: Start background image comparison (skipped by default)
        compare_proc = None
        if not args.skip_compare:
            print("Step 2: Image comparison (background)")
            compare_proc = start_image_comparison(screenshot_path, matches_path)
            print()
        else:
            print("Step 2: Image comparison (skipped)")
            print()

        # Step 3: GPT-5 mini analysis (skipped by default)
        analysis_text = ""
        if not args.skip_ai:
            print("Step 3: GPT-5 mini analysis")
            token = get_gh_token()
            screenshot_b64 = screenshot_to_base64_jpeg(screenshot_path)

            # Wait for image comparison if it's running — it enriches the AI analysis
            image_matches = None
            if compare_proc is not None:
                print("  Waiting for image comparison to finish...")
                compare_proc.wait(timeout=300)
                stderr_output = compare_proc.stderr.read().decode()
                if stderr_output:
                    for line in stderr_output.strip().split("\n"):
                        print(f"    {line}")
                if matches_path.exists():
                    image_matches = json.loads(matches_path.read_text())
                    print(f"  Image comparison found {len(image_matches)} matches")
                compare_proc = None

            analysis_text = call_gpt5_mini(token, screenshot_b64, image_matches)

            if analysis_text:
                header = f"# UI Analysis: {category}"
                if subcategory:
                    header += f" / {subcategory}"
                header += f"\n\n_Generated {timestamp} by GPT-5 mini_\n\n"
                analysis_path.write_text(header + analysis_text)
                print(f"  Analysis saved: {analysis_path}")
            else:
                print("  WARNING: GPT-5 mini returned empty analysis", file=sys.stderr)
            print()
        else:
            print("Step 3: GPT-5 mini analysis (skipped)")
            print()

        # Step 4: Wait for any remaining background processes
        if compare_proc is not None:
            print("Step 4: Waiting for image comparison...")
            compare_proc.wait(timeout=300)
            stderr_output = compare_proc.stderr.read().decode()
            if stderr_output:
                for line in stderr_output.strip().split("\n"):
                    print(f"    {line}")
            print()

        # Step 5: Save metadata
        metadata = {
            "category": category,
            "subcategory": subcategory,
            "timestamp": timestamp,
            "device": _ADB_DEVICE,
            "files": {
                "screenshot": "screenshot.png",
                "ui_dump": "ui_dump.xml",
                "image_matches": "image_matches.json" if matches_path.exists() else None,
                "analysis": "analysis.md" if analysis_path.exists() else None,
            },
        }
        metadata_path.write_text(json.dumps(metadata, indent=2))
        print(f"Step 5: Metadata saved: {metadata_path}")
        print()
        print(f"═══ Capture complete ═══")
        print(f"  Output directory: {out_dir}")

        # Summary of files
        for f in sorted(out_dir.iterdir()):
            size = f.stat().st_size
            unit = "KB" if size > 1024 else "B"
            size_val = size / 1024 if size > 1024 else size
            print(f"    {f.name:30s} {size_val:>8.1f} {unit}")


    # Interactive mode when category not supplied: loop prompting user
    if args.category is None:
        print('Interactive mode: enter category and optional subcategory. Empty category to exit.')
        while True:
            try:
                cat = input('Category (empty to quit): ').strip()
            except EOFError:
                print('\nEOF received, exiting.')
                break
            if not cat:
                break
            sub = input('Subcategory (optional, empty for none): ').strip() or None
            try:
                do_capture(cat, sub, args)
            except Exception as e:
                print('Error during capture:', e, file=sys.stderr)
        print('Exiting interactive capture.')
    else:
        do_capture(args.category, args.subcategory, args)


if __name__ == "__main__":
    main()
