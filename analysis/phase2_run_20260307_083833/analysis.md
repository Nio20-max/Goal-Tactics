# Phase 2 Simulation Analysis (Server/Facility Follow-up)

## Run Metadata
- Run directory: `analysis/phase2_run_20260307_083833`
- Command: `dotnet run --project src/GoalTactics.Bots/GoalTactics.Bots.csproj -- --mode=simulate --seasons=20 --bot-count=96 --log-root=/root/projekte/Goal-Tactics/analysis`
- Seasons: 20
- Bots: 96 (Tier 1: 16, Tier 2: 32, Tier 3: 48)

## Key KPI Snapshot (20-season averages)
- Goals per match: `2.054`
- Transfers per season: `1325.75`
- Transfer fees per season: `439,720,978.15 money`
- Stars earned per season: `1,662,335`
- Stars spent per season: `1,446,630`

## Validation Against Requested Fixes

### 1) Aging issue in tracked players
Status: `fixed`
- Tracked output now shows age progression continuing season-over-season, including after sale events.
- Example sold player evidence:
- `P-16-NEW-01` sold in season 9, age then continues 26 -> 36 by season 20.

### 2) Stadium cash income missing
Status: `fixed`
- `tracked-teams.csv` now has positive `money_in` values in all rows sampled.
- Automated check result: `teams_with_money_in_gt0_rows=360`.
- Sample row:
- `AT Club 17` season 1: `money_in=8,838,300`.

### 3) Other buildings/facilities behavior
Status: `improved and active`
- `office_level`, `fan_shop_level`, and `parking_level` are now tracked and evolve over seasons.
- Office-gated upgrade behavior is active (`required office >= building level + 1` policy reflected in simulation progression).
- Training center and stadium progression now continue up to level 20 bands instead of prior early plateau.

### 4) Training realism check (carry-over)
Status: `working as expected`
- High-talent trajectories still reach requested high-end development.
- Max tracked-player strength in this run:
- `P-17-YTH-01` reached `561.240` by season 20.

## Remaining Balance Risk
- Transfer fee outflow is still very large and remains the dominant money sink.
- Stadium income now offsets structural insolvency, but transfer formula tuning is still recommended for longer-horizon stability.

## Conclusion
The follow-up issues from the latest request are resolved in this run:
- aging progression is visible and continuous,
- stadium-generated cashflow is active,
- and facility systems (office + other buildings) now progress with realistic constraints.
