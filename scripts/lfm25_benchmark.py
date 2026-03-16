#!/usr/bin/env python3
"""Benchmark LFM2.5-1.2B-Thinking (llama.cpp Q4_0) on this host.

This script downloads the quantized GGUF model from Hugging Face and runs a few
prompts while measuring throughput (tokens/sec) and memory usage.

Requirements:
  - python packages: huggingface_hub, llama-cpp-python, psutil, tqdm

Usage:
  python scripts/lfm25_benchmark.py
  python scripts/lfm25_benchmark.py --ctx 512 1024 2048 --max-new-tokens 128

If you run into "OOM" errors, reduce context / max-new-tokens, or run on a larger machine.
"""

import argparse
import json
import os
import sys
import time

import psutil
from huggingface_hub import snapshot_download

# For parallel execution
from multiprocessing import Pool

try:
    from llama_cpp import Llama
except ImportError as e:
    print("Missing llama_cpp. Install it with: pip install llama-cpp-python")
    raise


def human_bytes(num: int) -> str:
    for unit in ["B", "KiB", "MiB", "GiB", "TiB"]:
        if abs(num) < 1024.0:
            return f"{num:3.1f}{unit}"
        num /= 1024.0
    return f"{num:.1f}PiB"


def download_model(repo_id: str, filename: str, cache_dir: str) -> str:
    """Download a single file from a Hugging Face repo to a local cache directory."""
    os.makedirs(cache_dir, exist_ok=True)
    model_path = os.path.join(cache_dir, filename)
    if os.path.exists(model_path):
        return model_path

    print(f"Downloading {filename} from {repo_id} to {cache_dir}...")
    snapshot_download(
        repo_id=repo_id,
        cache_dir=cache_dir,
        local_dir=cache_dir,
        local_dir_use_symlinks=False,
        allow_patterns=[filename],
    )

    if not os.path.exists(model_path):
        raise FileNotFoundError(f"Model file not found after download: {model_path}")

    return model_path


CHAT_TEMPLATE = """<|startoftext|><|im_start|>system
You are a helpful assistant trained by Liquid AI.<|im_end|><|im_start|>user
{prompt}<|im_end|><|im_start|>assistant
"""


def format_prompt_chatml(prompt: str) -> str:
    return CHAT_TEMPLATE.format(prompt=prompt)


def run_generation(model: Llama, prompt: str, max_new_tokens: int, verbose: bool = False, use_chat_template: bool = True):
    """Run a model generation and return stats.

    Returns a dict with keys:
      - input_tokens
      - output_tokens
      - duration_s
      - tokens_per_sec
      - output
      - output_is_empty
      - error (optional)
    """

    formatted_prompt = format_prompt_chatml(prompt) if use_chat_template else prompt
    input_tokens = model.tokenize(formatted_prompt.encode("utf-8"))
    input_token_count = len(input_tokens)

    t0 = time.perf_counter()
    try:
        if use_chat_template:
            # Use the chat completion API to better fit LFM's chat/think format.
            messages = [
                {"role": "system", "content": "You are a helpful assistant trained by Liquid AI."},
                {"role": "user", "content": formatted_prompt},
            ]
            resp = model.create_chat_completion(
                messages=messages,
                max_tokens=max_new_tokens,
                temperature=0.1,
                top_k=50,
                top_p=0.1,
                repeat_penalty=1.05,
                stream=False,
            )
            t1 = time.perf_counter()
            duration = t1 - t0
            text = resp["choices"][0]["message"]["content"]
        else:
            resp = model.create_completion(
                prompt=formatted_prompt,
                max_tokens=max_new_tokens,
                temperature=0.1,
                top_k=50,
                top_p=0.1,
                repeat_penalty=1.05,
                echo=False,
            )
            t1 = time.perf_counter()
            duration = t1 - t0
            text = resp["choices"][0]["text"] if isinstance(resp, dict) else str(resp)

        # Tokenize the result to estimate tokens output. This is not exact for all formats.
        output_stripped = text.strip()
        output_tokens = model.tokenize(text.encode("utf-8"))
        output_token_count = len(output_tokens)

        # Treat empty/whitespace output as zero tokens for reporting purposes.
        output_is_empty = (len(output_stripped) == 0)
        if output_is_empty:
            output_token_count = 0

        if verbose or output_is_empty:
            print("--- prompt ---")
            print(prompt)
            print("--- output (repr) ---")
            print(repr(text))

        return {
            "input_tokens": input_token_count,
            "output_tokens": output_token_count,
            "duration_s": duration,
            "tokens_per_sec": (input_token_count + output_token_count) / duration if duration > 0 else float("inf"),
            "output": text,
            "output_is_empty": output_is_empty,
        }

    except Exception as e:
        t1 = time.perf_counter()
        duration = t1 - t0
        return {
            "input_tokens": input_token_count,
            "output_tokens": 0,
            "duration_s": duration,
            "tokens_per_sec": 0.0,
            "output": "",
            "error": str(e),
        }


def worker_init(model_path: str, n_ctx: int, threads: int, use_chat_template: bool):
    """Initializer for worker processes.

    Loads the model once per worker.
    """

    global _WORKER_MODEL, _WORKER_USE_CHAT_TEMPLATE
    _WORKER_MODEL = Llama(model_path=model_path, n_ctx=n_ctx, n_threads=threads, verbose=False)
    _WORKER_USE_CHAT_TEMPLATE = use_chat_template


def worker_task(task):
    """Worker task for running one prompt generation.

    Task is a dict with keys: prompt, max_new_tokens, n_ctx, run_id
    """

    global _WORKER_MODEL, _WORKER_USE_CHAT_TEMPLATE
    prompt = task["prompt"]
    max_new_tokens = task["max_new_tokens"]
    n_ctx = task["n_ctx"]
    run_id = task["run_id"]

    stats = run_generation(
        _WORKER_MODEL,
        prompt,
        max_new_tokens=max_new_tokens,
        verbose=False,
        use_chat_template=_WORKER_USE_CHAT_TEMPLATE,
    )

    return {
        **stats,
        "ctx": n_ctx,
        "run": run_id,
    }


def main(argv=None):
    parser = argparse.ArgumentParser(description="Benchmark LFM2.5-1.2B-Thinking (llama.cpp Q4_0).")
    parser.add_argument(
        "--model-repo",
        default="LiquidAI/LFM2.5-1.2B-Thinking-GGUF",
        help="Hugging Face repo containing the quantized GGUF model.",
    )
    parser.add_argument(
        "--model-file",
        default="LFM2.5-1.2B-Thinking-Q4_0.gguf",
        help="The GGUF model file name inside the repo to download and load.",
    )
    parser.add_argument(
        "--model-dir",
        default="./models/lfm25",
        help="Directory to cache the downloaded model.",
    )
    parser.add_argument(
        "--ctx",
        type=int,
        nargs="*",
        default=[512, 1024, 2048],
        help="Context sizes (n_ctx) to test.",
    )
    parser.add_argument(
        "--max-new-tokens",
        type=int,
        default=128,
        help="Number of new tokens to generate per prompt.",
    )
    parser.add_argument(
        "--runs",
        type=int,
        default=2,
        help="Number of runs per context size.",
    )
    parser.add_argument(
        "--prompt",
        action="append",
        default=None,
        help="Prompt(s) to use for generation. Can be specified multiple times.",
    )
    parser.add_argument(
        "--parallel",
        type=int,
        default=1,
        help="Number of parallel workers to run simultaneously (each worker loads its own model).",
    )
    parser.add_argument(
        "--no-chat-template",
        action="store_true",
        help="Do not wrap the prompt with the LFM chat template.",
    )
    parser.add_argument(
        "--report-csv",
        type=str,
        default=None,
        help="Optional path to write a CSV report of each run.",
    )
    parser.add_argument(
        "--report-json",
        type=str,
        default=None,
        help="Optional path to write a JSON report with summary stats.",
    )
    parser.add_argument(
        "--threads",
        type=int,
        default=None,
        help="Number of threads to use for inference (defaults to os.cpu_count()).",
    )
    parser.add_argument(
        "--verbose",
        action="store_true",
        help="Print full outputs for each prompt.",
    )
    args = parser.parse_args(argv)

    process = psutil.Process()

    model_path = download_model(args.model_repo, args.model_file, args.model_dir)
    print(f"Model path: {model_path}")

    # Simple prompts for testing.
    prompts = [
        "Write a short, friendly message from a football coach to the team after a close win.",
        "Summarize the following match report in one sentence: Team A scored first, Team B equalized, and Team A won on a late penalty.",
        "Explain why time management is important in a football match and give two quick tips.",
    ]

    csv_lines = []
    if args.report_csv:
        csv_lines.append(
            "ctx,run,input_tokens,output_tokens,duration_s,tokens_per_sec,rss_bytes,cpu_pct,output_empty,has_error"
        )

    all_runs = []

    prompt_list = args.prompt if args.prompt else prompts
    parallel = max(1, args.parallel)

    if parallel > 1:
        print(f"Running in parallel with {parallel} workers. This will multiply memory usage (~1GB/worker).")

    for n_ctx in args.ctx:
        print("\n=== Context size: {} ===".format(n_ctx))

        # Warm up model load timing.
        mem_before = process.memory_info().rss
        t0 = time.perf_counter()

        # Load once in this process for sequential mode.
        if parallel == 1:
            model = Llama(
                model_path=model_path,
                n_ctx=n_ctx,
                n_threads=args.threads,
                verbose=False,
            )

            t1 = time.perf_counter()
            mem_after = process.memory_info().rss
            print(
                f"Model load: {t1-t0:.2f}s, RSS {human_bytes(mem_after)} (delta {human_bytes(mem_after-mem_before)})"
            )

        else:
            # In parallel mode, defer model loading into worker processes.
            t1 = time.perf_counter()
            mem_after = process.memory_info().rss
            print(
                f"Parallel run: no model loaded in main process; current RSS {human_bytes(mem_after)}"
            )

        tasks = []
        for prompt in prompt_list:
            for r in range(args.runs):
                tasks.append({
                    "prompt": prompt,
                    "max_new_tokens": args.max_new_tokens,
                    "n_ctx": n_ctx,
                    "run_id": r + 1,
                })

        if parallel == 1:
            for task in tasks:
                stats = run_generation(
                    model,
                    task["prompt"],
                    max_new_tokens=task["max_new_tokens"],
                    verbose=args.verbose,
                    use_chat_template=not args.no_chat_template,
                )

                rss = process.memory_info().rss
                cpu = process.cpu_percent(interval=0.1)

                if stats.get("error"):
                    print(
                        f"run={task['run_id']}/{args.runs} ctx={n_ctx} ERROR: {stats['error']} "
                        f"rss={human_bytes(rss)} cpu={cpu:.0f}%"
                    )
                else:
                    print(
                        f"run={task['run_id']}/{args.runs} ctx={n_ctx} input={stats['input_tokens']} out={stats['output_tokens']} "
                        f"time={stats['duration_s']:.2f}s tps={stats['tokens_per_sec']:.1f} "
                        f"rss={human_bytes(rss)} cpu={cpu:.0f}%"
                        f" empty={stats.get('output_is_empty', False)}"
                    )

                output_preview = stats.get("output", "").replace("\n", " ").strip()[:120]

                if args.report_csv:
                    csv_lines.append(
                        f"{n_ctx},{task['run_id']},{stats['input_tokens']},{stats['output_tokens']},{stats['duration_s']:.4f},{stats['tokens_per_sec']:.1f},{rss},{cpu:.0f},{stats.get('output_is_empty', False)},{bool(stats.get('error'))},{output_preview}"
                    )

                all_runs.append({
                    **stats,
                    "ctx": n_ctx,
                    "run": task["run_id"],
                    "rss": rss,
                    "cpu_pct": cpu,
                })

                try:
                    model.reset()
                except Exception:
                    pass

        else:
            # Parallel mode: spawn workers with preloaded models.
            ctx = Pool(processes=parallel, initializer=worker_init, initargs=(model_path, n_ctx, args.threads, not args.no_chat_template))
            try:
                results = list(ctx.imap(worker_task, tasks))
            finally:
                ctx.close()
                ctx.join()

            for stats in results:
                rss = process.memory_info().rss
                cpu = process.cpu_percent(interval=0.1)

                if stats.get("error"):
                    print(
                        f"run={stats['run']}/{args.runs} ctx={stats['ctx']} ERROR: {stats['error']} "
                        f"rss={human_bytes(rss)} cpu={cpu:.0f}%"
                    )
                else:
                    print(
                        f"run={stats['run']}/{args.runs} ctx={stats['ctx']} input={stats['input_tokens']} out={stats['output_tokens']} "
                        f"time={stats['duration_s']:.2f}s tps={stats['tokens_per_sec']:.1f} "
                        f"rss={human_bytes(rss)} cpu={cpu:.0f}%"
                        f" empty={stats.get('output_is_empty', False)}"
                    )

                output_preview = stats.get("output", "").replace("\n", " ").strip()[:120]

                if args.report_csv:
                    csv_lines.append(
                        f"{stats['ctx']},{stats['run']},{stats['input_tokens']},{stats['output_tokens']},{stats['duration_s']:.4f},{stats['tokens_per_sec']:.1f},{rss},{cpu:.0f},{stats.get('output_is_empty', False)},{bool(stats.get('error'))},{output_preview}"
                    )

                all_runs.append({
                    **stats,
                    "rss": rss,
                    "cpu_pct": cpu,
                })

        # free memory between contexts
        if parallel == 1:
            try:
                del model
            except NameError:
                pass
        time.sleep(1)

    if args.report_csv:
        with open(args.report_csv, "w", encoding="utf-8") as f:
            f.write("\n".join(csv_lines))
        print(f"Wrote CSV report to {args.report_csv}")

    if args.report_json:
        import json

        completed_runs = [r for r in all_runs if not r.get("error")]
        summary = {
            "runs": len(all_runs),
            "contexts": sorted({r["ctx"] for r in all_runs}),
            "avg_tokens_per_sec": sum(r["tokens_per_sec"] for r in completed_runs) / max(1, len(completed_runs)),
            "error_rate": sum(1 for r in all_runs if r.get("error")) / max(1, len(all_runs)),
            "empty_rate": sum(1 for r in all_runs if r.get("output_is_empty")) / max(1, len(all_runs)),
            "rss_max": max(r.get("rss", 0) for r in all_runs),
            "rss_min": min(r.get("rss", float("inf")) for r in all_runs),
        }

        with open(args.report_json, "w", encoding="utf-8") as f:
            json.dump({"summary": summary, "runs": all_runs}, f, indent=2)
        print(f"Wrote JSON report to {args.report_json}")

    print("\nDone.")


if __name__ == "__main__":
    main()
