# Historical Bootstrap Rollout Report

## Goal

Move from reset/testing to live continuity on the main website/database, while backfilling bots as if 30 seasons had already happened.

Target anchor:

- Season 31, Day 1 = 2026-03-22 (UTC date anchor)
- Backfill window = Seasons 1..30
- Add 16 new bots each season during backfill
- Continue adding 16 bots at each new season after backfill (live mode)

## What Was Implemented

### 1. Historical Bootstrap Runtime (bots)

Implemented a one-time historical bootstrap mode in the bots runtime.

Key behavior:

- Runs for configured number of seasons (`historical-bootstrap-seasons`, default 30).
- Uses normal bot behavior execution paths (LLM + neural policy + online updates).
- Adds 16 fresh bots at each season start (`historical-bootstrap-bots-per-season`).
- Creates fresh neural policies for newly created bots.
- Tracks virtual historical date so anchor mapping is explicit:
  - season 31 day 1 maps to 2026-03-22
  - historical progress dates are computed backwards from this anchor.

Files:

- `bots/BotConfig.cs`
- `bots/Program.cs`
- `bots/BotRunner.cs`

### 2. Persistent Status + Resume

Bootstrap writes JSON status continuously and can resume after interruption.

Status file includes:

- phase/completed flags
- current season/matchday
- progress percent inputs
- total sessions/success/failures
- total bots
- anchor season/date
- virtual date
- observed live season/matchday
- run directory

Path default:

- `/mnt/website/goal_tactics/simulations/historical-bootstrap-status.json`

### 3. Ongoing Live Seasonal Growth

Added live runtime auto-growth:

- periodically reads current season/matchday from API (`GetMyTeamExtendedInfo`) using a bot account
- on detected season increment, adds `seasonal-bots-per-season` (default 16)
- keeps this behavior enabled after bootstrap completion

### 4. Wrapper Production Wiring

Production wrapper now starts bots with bootstrap + live growth flags enabled and LLM mode enabled.

File:

- `scripts/goaltactics-wrapper.sh`

### 5. Admin Website Visibility

Dashboard now shows bootstrap/live progression and core stats.

File:

- `admin-panel/app.py`
- `admin-panel/templates/index.html`

Displayed:

- phase, progress bar, current season/matchday
- target seasons/matchdays
- total sessions/success/auth failures
- total bots
- anchor + virtual date
- observed live season/matchday
- last update timestamp

## Operational Notes

- This rollout does **not** reset the main DB.
- Bootstrap is designed as one-time and resumable.
- If bootstrap is already complete, runtime skips backfill and continues live mode.
- Existing bots are not reinitialized; newly created bots get fresh neural model clones.

## Risks and Mitigations

### Risk: API throttling (429)

Mitigation:

- pacing between bootstrap sessions
- existing retry/backoff in API client
- runtime continues after transient throttling

### Risk: Process restart during bootstrap

Mitigation:

- status file checkpointing
- resume from stored season/matchday
- avoid duplicate seasonal bot creation on mid-season resume

### Risk: Data growth (bots increase every season)

Mitigation:

- explicit policy retained as requested
- status exposes total bot count for monitoring

## Production Commands

Deployment/restart path:

- `bash scripts/deploy-goaltactics.sh`

Health checks:

- `systemctl status goaltactics.service`
- `tail -f /mnt/website/goal_tactics/logs/bots.log`
- check dashboard at admin panel root
- inspect `/mnt/website/goal_tactics/simulations/historical-bootstrap-status.json`

## Acceptance Criteria Mapping

- No reset mode for production: implemented
- 30-season historical bootstrap: implemented
- Anchor season/day mapping: implemented and visible in status
- 16 new bots per season during bootstrap: implemented
- 16 new bots per season after bootstrap: implemented
- LLM decisions + neural networks active: configured in wrapper runtime
- Website visibility for progress/stats: implemented

