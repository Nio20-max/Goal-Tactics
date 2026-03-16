# Bot Neural Ops Runbook

## 1) Start local LFM API

Command:

```bash
python scripts/lfm25_local_api.py
```

Optional environment variables:

- `LFM25_MODEL_PATH` (default: `./models/lfm25/LFM2.5-1.2B-Thinking-Q4_0.gguf`)
- `LFM25_HOST` (default: `127.0.0.1`)
- `LFM25_PORT` (default: `5057`)
- `LFM25_N_CTX` (default: `4096`)
- `LFM25_N_THREADS` (default: cpu count)
- `LFM25_MAX_CONCURRENCY` (default: `4`)

Health check:

```bash
curl http://127.0.0.1:5057/health
```

## 2) Start bots with neural planning

Example:

```bash
dotnet run --project bots/GoalTacticsBots.csproj -- \
  --api-url=http://127.0.0.1:5000 \
  --bot-count=24 \
  --neural-enabled=true \
  --neural-api-url=http://127.0.0.1:5057 \
  --neural-max-concurrency=4 \
  --neural-timeout-seconds=20 \
  --night-start-hour=22 \
  --night-end-hour=6
```

## 3) What now happens

- Night plans are generated and persisted in `BotNightPlans` (one per bot + local date).
- Group transfer intent messages are generated and persisted in `BotGroupChatMessages`.
- Transfer behavior posts group-prefixed coordination chat messages via API chat.
- Training/scouting/bidding/chat tone are adjusted by model-derived night plan values.

## 4) Failure mode

If local model API is down or returns bad output:

- Bots continue with deterministic fallback plan based on personality.
- Runtime remains operational (no hard dependency on model availability).
