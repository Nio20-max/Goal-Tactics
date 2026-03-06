# Current State Overview (Phase 0)

## Purpose
Lock what is already known before backend coding and formula implementation.

## Phase 0 Step Log
1. Parsed recovered docs in `Goal Tactics app/docs/` for feature and API coverage.
2. Mined decompiled client code in `reverse_engineering/decompiled/GT.Core.actual/store0_idx17.decompiled.cs` for constants and executable formulas.
3. Collected additional historical values from user input (match bonus example, stadium economics, auction increment behavior, injury/card limits).
4. Split findings into exact facts, decompiled logic, and fallback areas.

## Exact from client/docs
- Shipped game loop includes club, finances, stadium, squad, lineup, training, scouting, transfer market, league, GT Ladder, friends, live report, chat, shop, support.
- New backend surface is `/api/*` plus SignalR `/chat` and `/auc`.
- New API route and DTO inventory is recoverable from `api-endpoints-and-response-contracts.md`.
- Shared headers: `x-goaltactics-version` and `x-goaltactics-capabilities`.
- Capability string: `youthlist,htmligm,friendlist,indtrainings`.

## Exact from decompiled logic
- `Settings.LadderStaminaCost = 25`.
- `Settings.LadderStaminaMax = 100`.
- `Settings.LineupChangeMinutesBeforeMatch = 60`.
- `Settings.OldPlayerAge = 34`.
- `Settings.MaxGrassQuality = 100`.
- `Settings.BidRange1 = 100000`, `BidRange2 = 150000`, `StartBidIncrement = 5000`, `BidIncrementFactor = 1.03`.
- Stadium speedup price formula in client: `ceil(remaining_minutes) * speedupCost`.
- Lineup total strength formula in client: sum of `player.GetStrengthForPositionId(field.PositionId)` across placed formation fields.
- Upgrade cost formula in client screen logic: `UpgradeCost = (UpgradeStrength - CurrentStrength) * 10000`.
- Mood labels bucketized at `<20`, `<40`, `<60`, `<80`, else highest mood label.
- Mood modifier resolved from server-provided `JsonDefinitions.MoodModifiers` by descending threshold match.

## User-provided runtime values (treated as empirical evidence)
- Example match bonuses observed: home bonus, tactic bonus, captain, penalty, corner, free-kick all contributed as additive components.
- Stadium running costs are daily.
- Third-league sample: 19,500 standing + 24,000 seats + 1,900 VIP -> running cost `97,655`, earnings `1,210,100`.
- Unit economics sample:
  - +100 standing seats -> running cost +85, earnings +1000.
  - +10 VIP boxes -> running cost +212, earnings +2690.
- Transfer bidding behavior:
  - Below 5,000,000 bid level: increment below 150,000.
  - At/above 5,000,000: increment fixed at 150,000.
- Injury and card behavior observed:
  - Max injury duration 3 days.
  - Red-card suspension 1 day (with one league game per day cadence).

## Fallback model selected after testing
- Not frozen yet. Match event generation, salary evolution, contract pricing curves, and attendance league multiplier still need calibration tests.

## Immediate Phase 0 blockers
- No direct server code for match-event RNG and transfer settlement internals.
- Training progression samples are missing.
- Contract cost examples are not yet entered in structured form.

## Output status
- Phase 0 documentation initialized.
- Formula recovery is partially complete and now has enough seeds to run candidate-model tests once more samples are captured.
