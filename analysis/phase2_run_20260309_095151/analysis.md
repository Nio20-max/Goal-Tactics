# Phase 2 Simulation Analysis (League Standing + Full Team Export)

## Run Metadata
- Run directory: `/mnt/website/goal_tactics/phase2_run_20260309_095151`
- Command: `dotnet run --project src/GoalTactics.Bots/GoalTactics.Bots.csproj -- --mode=simulate --seasons=20 --bot-count=96 --log-root=/mnt/website/goal_tactics/phase2_run_20260309_095151`
- Seasons: 20
- Bots: 96 (Tier 1: 16, Tier 2: 32, Tier 3: 48)

## Requested Output Validation

### 1) Log location under `/mnt/website/goal_tactics/phase2_run_{time}`
Status: `done`
- Logs were generated in the requested location pattern.

### 2) League standings for each league after each season
Status: `done`
- Standings are written per season and per league at:
- `season{n}/league/standings/tier{tier}_group{group}.csv`
- `season{n}/league/standings/tier{tier}_group{group}.json`
- Example:
- `season20/league/standings/tier1_group1.csv`

### 3) Full team export for every team, every season, sorted into folders
Status: `done`
- Team snapshots are written at:
- `season{n}/league/teams/tier{tier}_group{group}/teams.csv`
- `season{n}/league/teams/tier{tier}_group{group}/{team_name}.json`
- Each league folder contains all teams for that league and season.

### 4) Team count parity with currently running background instance
Status: `matched`
- Prior active configuration was verified as `bot-count=96` (same value used here).
- Validation checks show 96 team snapshots in each season.

## Structural Integrity Checks
- For every season `1..20`:
- `standings_csv=6` (Tier1 G1, Tier2 G1-2, Tier3 G1-3)
- `teams_json=96`
- Global layout check result: `all_seasons_layout_ok=1`

## KPI Snapshot (20-season averages)
- Goals per match: `2.083`
- Transfers per season: `1310.80`
- Transfer fees per season: `433,818,993.75 money`
- Stars earned per season: `1,659,920`
- Stars spent per season: `1,447,240`

## Additional Observation
- Season 20 max team strength:
- `PL Club 6` reached `689`.

## Conclusion
This run satisfies the requested export requirements:
- output path is under `/mnt/website/goal_tactics/phase2_run_{time}`,
- standings are present for every league in every season,
- and full team snapshots are exported for all 96 teams in every season using the requested season/league/team folder structure.
