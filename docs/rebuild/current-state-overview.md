# Current State Overview (Phase 0)

## Purpose
Lock what is already known before backend coding and formula implementation.

## Phase 0 Step Log
1. Parsed recovered docs in `Goal Tactics app/docs/` for feature and API coverage.
2. Mined decompiled client code in `reverse_engineering/decompiled/GT.Core.actual/store0_idx17.decompiled.cs` for constants and executable formulas.
3. Collected additional historical values from user input (match bonus example, stadium economics, auction increment behavior, injury/card limits).
4. Split findings into exact facts, decompiled logic, and fallback areas.
5. Ran candidate-model fitting in `tools/phase0/simulate_phase0_formulas.py` and stored outputs in `tools/phase0/simulation_report.txt`.

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
- League-dependent seat rates:
  - league 4: VIP `212`, sit `16`, stand `8`
  - league 3: VIP `269`, sit `21`, stand `10`
  - league 2: VIP `343`, sit `27`, stand `13`
  - league 1: VIP `436`, sit `34`, stand `17`
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
- Frozen from tests:
  - transfer increment: `clamp(round(0.03 * bid), min=5000, max=150000)`
  - stadium running costs: `vip*21.2 + sit*1.7 + stand*0.85`
  - known seat earnings by league as listed above
  - fitness recovery: `+0.2 * training_center_level` per day, capped at `100`
  - auction anti-sniping: if remaining time `<20s` after valid bid, reset to `20s`
- Provisional fallback (documented, not claimed exact):
  - match goals from strength delta Poisson model (`base=1.0`, `scale=0.2` currently best on small sample)
  - standing occupancy scaling by league/form
  - contract renewal pricing curve by salary/strength/age
  - non-fitness skill growth with age/talent/fitness factors

## Immediate Phase 0 blockers
- No direct server code for match-event RNG and transfer settlement internals.
- Training progression samples are still limited for long-horizon calibration.
- Contract cost examples are still missing real renewal-price outputs.

## Output status
- Phase 0 documentation initialized.
- Formula recovery now has exact extracted constants plus tested fallback formulas with explicit confidence labels.
