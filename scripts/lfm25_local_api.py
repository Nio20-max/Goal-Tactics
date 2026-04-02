#!/usr/bin/env python3
"""Local LFM2.5 model API server.

Loads the GGUF model once into RAM and exposes a small OpenAI-compatible
chat completion endpoint for local bot decisioning.

Run:
  python scripts/lfm25_local_api.py

Optional env vars:
  LFM25_MODEL_PATH=./models/lfm25/LFM2.5-1.2B-Thinking-Q4_0.gguf
  LFM25_HOST=127.0.0.1
  LFM25_PORT=5057
  LFM25_N_CTX=4096
  LFM25_N_THREADS=<cpu_count>
  LFM25_MAX_CONCURRENCY=4
"""

from __future__ import annotations

import asyncio
import os
from typing import Any

from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field
from uvicorn import run as uvicorn_run

try:
    from llama_cpp import Llama
except ImportError as exc:  # pragma: no cover - runtime guard
    raise RuntimeError("Missing llama_cpp. Install with: pip install llama-cpp-python") from exc


class ChatMessage(BaseModel):
    role: str
    content: str


class ChatCompletionRequest(BaseModel):
    model: str | None = "lfm25-local"
    messages: list[ChatMessage]
    max_tokens: int = Field(default=256, ge=1, le=1024)
    temperature: float = Field(default=0.2, ge=0.0, le=2.0)


class HealthResponse(BaseModel):
    status: str
    model_path: str
    max_concurrency: int


class Lfm25Runtime:
    def __init__(self) -> None:
        self.model_path = os.getenv(
            "LFM25_MODEL_PATH", "./models/lfm25/LFM2.5-1.2B-Thinking-Q4_0.gguf"
        )
        self.n_ctx = int(os.getenv("LFM25_N_CTX", "4096"))
        self.n_threads = int(os.getenv("LFM25_N_THREADS", str(os.cpu_count() or 4)))
        self.max_concurrency = max(1, int(os.getenv("LFM25_MAX_CONCURRENCY", "4")))
        self.max_prompt_chars = max(1024, int(os.getenv("LFM25_MAX_PROMPT_CHARS", "7000")))
        self._semaphore = asyncio.Semaphore(self.max_concurrency)

        if not os.path.exists(self.model_path):
            raise FileNotFoundError(f"Model file not found: {self.model_path}")

        self.model = Llama(
            model_path=self.model_path,
            n_ctx=self.n_ctx,
            n_threads=self.n_threads,
            verbose=False,
        )

    async def complete(self, req: ChatCompletionRequest) -> dict[str, Any]:
        messages = [m.model_dump() for m in req.messages]

        # Guard against oversized prompts that can crash llama.cpp at native level
        # before Python can raise a catchable context-window exception.
        total_chars = sum(len(str(m.get("content", ""))) for m in messages)
        while total_chars > self.max_prompt_chars and messages:
            idx = max(range(len(messages)), key=lambda i: len(str(messages[i].get("content", ""))))
            content = str(messages[idx].get("content", ""))
            if len(content) <= 256:
                break
            new_len = max(256, int(len(content) * 0.75))
            messages[idx]["content"] = content[:new_len]
            total_chars = sum(len(str(m.get("content", ""))) for m in messages)

        async with self._semaphore:
            # Bot prompts can occasionally exceed the model context window.
            # Retry with progressively shorter message bodies instead of hard-failing.
            for _ in range(5):
                try:
                    response = await asyncio.to_thread(
                        self.model.create_chat_completion,
                        messages=messages,
                        max_tokens=req.max_tokens,
                        temperature=req.temperature,
                        stream=False,
                    )
                    return response
                except Exception as exc:
                    message = str(exc)
                    if "exceed context window" not in message.lower():
                        raise HTTPException(status_code=500, detail=f"Inference failed: {exc}") from exc

                    if not messages:
                        raise HTTPException(status_code=500, detail=f"Inference failed: {exc}") from exc

                    # Trim the largest message first to preserve most recent context breadth.
                    idx = max(range(len(messages)), key=lambda i: len(str(messages[i].get("content", ""))))
                    content = str(messages[idx].get("content", ""))
                    if len(content) <= 256:
                        raise HTTPException(status_code=500, detail=f"Inference failed: {exc}") from exc

                    new_len = max(256, int(len(content) * 0.6))
                    messages[idx]["content"] = content[:new_len]

            raise HTTPException(status_code=500, detail="Inference failed: prompt too long after retries")


app = FastAPI(title="LFM25 Local API", version="1.0")
runtime = Lfm25Runtime()


@app.get("/health", response_model=HealthResponse)
def health() -> HealthResponse:
    return HealthResponse(
        status="ok",
        model_path=runtime.model_path,
        max_concurrency=runtime.max_concurrency,
    )


@app.post("/v1/chat/completions")
async def chat_completions(req: ChatCompletionRequest) -> dict[str, Any]:
    if not req.messages:
        raise HTTPException(status_code=400, detail="messages must not be empty")
    return await runtime.complete(req)


def main() -> None:
    host = os.getenv("LFM25_HOST", "127.0.0.1")
    port = int(os.getenv("LFM25_PORT", "5057"))
    uvicorn_run(app, host=host, port=port, log_level="info")


if __name__ == "__main__":
    main()
