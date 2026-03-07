# Phase 2 Bot Simulation Analysis (Stadium and Facilities Follow-up)

## Scope
- Output directory: `analysis/phase2_run_20260307_083833`
- Seasons: 20
- Population: 96 bots (Tier 1: 16, Tier 2: 32, Tier 3: 48)
- Fixed schedule checks: training 08:00 UTC, friendlies 13:00 UTC, league 18:00 UTC

## Core Metrics (20-season averages)
- Goals per match: `2.054`
- Transfers per season: `1325.75`
- Transfer fees per season: `439,720,978.15 money`
- Stars earned per season: `1,662,335`
- Stars spent per season: `1,446,630`

## Validation of Requested Fixes

### Aging in tracked players
- Status: passed
- `tracked-players.csv` now shows age continuing to increase every season.
- Sold players no longer freeze at sell age in later rows.

### Stadium cash income
- Status: passed
- `tracked-teams.csv` now contains positive `money_in` values across the run.
- Automated check: `teams_with_money_in_gt0_rows=360`.

### Other facilities behavior
- Status: passed
- `office_level`, `fan_shop_level`, and `parking_level` are now tracked and progressing.
- Upgrade behavior follows office-gating (`required office >= building level + 1`) and level caps up to 20 in simulation logic.

### Training/high-end growth guardrail
- Status: passed
- Talent-9/10 trajectories still reach high outcomes.
- Max tracked strength in this run: `561.240` (`P-17-YTH-01`, season 20).

## Updated Team Tracking Coverage
- `tracked-teams.csv` includes:
- stadium and training center levels
- office, fan shop, parking levels
- team strength
- money/stars balances
- money/stars in/out season flow

## Remaining Risk
1. Transfer fee outflow remains the strongest money sink and still needs balancing work.
2. With stadium income now active, insolvency drift is reduced, but transfer pricing should still be softened for long-horizon stability.
