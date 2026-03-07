# Bot Simulation (Phase 2)

This project models realistic human-like bot club behavior for accelerated multi-season balance simulation.

## Fixed Constraints

- `League kickoff`: 18:00 UTC
- `Friendly kickoff`: 13:00 UTC
- `Training tick`: 08:00 UTC
- `Bid star cost`: 200
- `Short sponsor`: renew every 3 days, pays 200 stars/day
- `Season sponsor`: signed at season start, pays 300 stars/day
- `Rewarded ad stars`: 100
- `Season count`: 20
- `League pyramid`: Tier 1 (1 group), Tier 2 (2 groups), Tier 3 (3 groups)

## Run

```bash
dotnet run --project src/GoalTactics.Bots/GoalTactics.Bots.csproj -- --mode=simulate --seasons=20 --bot-count=96 --log-root=/mnt/website/goal_tactics
```

## Outputs

- `simulation-events.log`: match and timeline events
- `economy.log`: stars/money inflow-outflow actions
- `transfers.log`: transfer search and bid behavior
- `ladder.log`: ladder challenges and stamina restores
- `social-chat.log`: friendlies and chat messages
- `season-summary.log`: per-season aggregate line summaries
- `metrics.json` and `metrics.csv`: season-level KPI dataset
- `transfer-completions.log` and `transfer-completions.csv`: completed transfer ledger with player stats and transfer fees
- `tracked-players.csv` and `tracked-players.json`: longitudinal tracked-player progression and sale events
- `bot-spend-by-persona-money.csv` and `bot-spend-by-persona-stars.csv`: spend breakdown by bot type and resource
