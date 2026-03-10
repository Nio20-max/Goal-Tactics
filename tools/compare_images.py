#!/usr/bin/env python3
"""
Background image comparison script.
Finds which app resource images appear in a screenshot using OpenCV template matching.
Called by capture_ui.py — outputs JSON to stdout.

Optimizations:
- Works at half resolution for speed (~4x faster)
- Skips Android framework images (abc_, notification_, design_, etc.)
- Skips templates larger than 256px in any dimension
- Skips 9-patch images
"""

import argparse
import json
import sys
from pathlib import Path

import cv2
import numpy as np

# Android/third-party framework image prefixes to skip
FRAMEWORK_PREFIXES = (
    "abc_", "avd_", "btn_checkbox_", "btn_radio_",
    "com_facebook_", "design_", "hs__", "hs___",
    "ic_mtrl_", "mtrl_", "navigation_", "notification_",
    "common_", "tooltip_",
)

MAX_TEMPLATE_DIM = 256  # Skip templates wider/taller than this
MIN_TEMPLATE_DIM = 16   # Skip very tiny templates (false positive magnets)
SCALE = 0.5  # Work at half resolution


def load_and_scale(path: str) -> np.ndarray | None:
    img = cv2.imread(path, cv2.IMREAD_COLOR)
    if img is None:
        return None
    if SCALE != 1.0:
        h, w = img.shape[:2]
        img = cv2.resize(img, (int(w * SCALE), int(h * SCALE)), interpolation=cv2.INTER_AREA)
    return img


def is_app_image(name: str) -> bool:
    """Filter out Android framework images and 9-patches."""
    if name.endswith(".9.png"):
        return False
    for prefix in FRAMEWORK_PREFIXES:
        if name.startswith(prefix):
            return False
    return True


def png_dimensions(path: Path) -> tuple[int, int]:
    """Read PNG width/height from header without loading full image."""
    with open(path, "rb") as f:
        f.read(16)
        w = int.from_bytes(f.read(4), "big")
        h = int.from_bytes(f.read(4), "big")
    return w, h


def find_matches(screenshot: np.ndarray, templates_dir: str, threshold: float = 0.85) -> list[dict]:
    results = []
    templates_path = Path(templates_dir)

    if not templates_path.is_dir():
        print(f"Templates directory not found: {templates_dir}", file=sys.stderr)
        return results

    all_pngs = sorted(templates_path.glob("*.png"))
    png_files = [p for p in all_pngs if is_app_image(p.name)]
    total = len(png_files)
    print(f"  {total} app-specific templates (filtered from {len(all_pngs)})", file=sys.stderr)

    sh, sw = screenshot.shape[:2]
    skipped_size = 0

    for i, tpl_path in enumerate(png_files):
        name = tpl_path.name

        # Quick size check from PNG header before loading
        try:
            orig_w, orig_h = png_dimensions(tpl_path)
        except Exception:
            continue

        if orig_w > MAX_TEMPLATE_DIM or orig_h > MAX_TEMPLATE_DIM:
            skipped_size += 1
            continue
        if orig_w < MIN_TEMPLATE_DIM or orig_h < MIN_TEMPLATE_DIM:
            continue

        tpl = load_and_scale(str(tpl_path))
        if tpl is None:
            continue

        th, tw = tpl.shape[:2]
        if th > sh or tw > sw or th < 4 or tw < 4:
            continue

        result = cv2.matchTemplate(screenshot, tpl, cv2.TM_CCOEFF_NORMED)
        locations = np.where(result >= threshold)

        if len(locations[0]) == 0:
            continue

        # Non-max suppression
        points = list(zip(locations[1].tolist(), locations[0].tolist()))
        confidences = [float(result[y, x]) for x, y in points]
        indexed = sorted(zip(confidences, points), key=lambda p: -p[0])

        kept = []
        for conf, (x, y) in indexed:
            if len(kept) >= 5:
                break
            dominated = False
            for _, (kx, ky) in kept:
                if abs(x - kx) < tw * 0.5 and abs(y - ky) < th * 0.5:
                    dominated = True
                    break
            if not dominated:
                kept.append((conf, (x, y)))

        inv_scale = 1.0 / SCALE
        for conf, (x, y) in kept:
            results.append({
                "image": name,
                "x": int(x * inv_scale),
                "y": int(y * inv_scale),
                "width": orig_w,
                "height": orig_h,
                "confidence": round(conf, 3),
            })

        if (i + 1) % 50 == 0:
            print(f"  compare_images: {i+1}/{total} checked, {len(results)} matches", file=sys.stderr)

    print(f"  Skipped {skipped_size} templates larger than {MAX_TEMPLATE_DIM}px", file=sys.stderr)
    results.sort(key=lambda m: (m["y"], m["x"]))
    return results


def main():
    parser = argparse.ArgumentParser(description="Find app resource images in a screenshot")
    parser.add_argument("screenshot", help="Path to screenshot PNG")
    parser.add_argument("--templates-dir", default=None,
                        help="Directory with template PNGs (default: auto-detect app resources)")
    parser.add_argument("--threshold", type=float, default=0.75,
                        help="Match confidence threshold 0-1 (default: 0.85)")
    parser.add_argument("--output", default=None, help="Output JSON file (default: stdout)")
    args = parser.parse_args()

    if args.templates_dir is None:
        repo_root = Path(__file__).resolve().parent.parent
        args.templates_dir = str(repo_root / "Goal Tactics app" / "android_project" / "res" / "drawable-xhdpi")

    print(f"Loading screenshot: {args.screenshot}", file=sys.stderr)
    screenshot = load_and_scale(args.screenshot)
    if screenshot is None:
        print(f"ERROR: Cannot read screenshot: {args.screenshot}", file=sys.stderr)
        sys.exit(1)
    print(f"  Working resolution: {screenshot.shape[1]}x{screenshot.shape[0]} (scale={SCALE})", file=sys.stderr)

    print(f"Comparing against templates in: {args.templates_dir}", file=sys.stderr)
    matches = find_matches(screenshot, args.templates_dir, threshold=args.threshold)
    print(f"Found {len(matches)} image matches", file=sys.stderr)

    output = json.dumps(matches, indent=2)

    if args.output:
        Path(args.output).write_text(output)
        print(f"Results written to {args.output}", file=sys.stderr)
    else:
        print(output)


if __name__ == "__main__":
    main()
