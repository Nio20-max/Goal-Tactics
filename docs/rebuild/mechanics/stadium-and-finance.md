# Stadium And Finance Mechanics (Phase 0)

## Phase 0 Step Log
1. Extracted stadium/building DTO fields and speedup formula from decompiled logic.
2. Collected empirical stadium economics from user-provided live values.
3. Mapped finance ledger requirements from route and DTO contracts.
4. Ran reconstruction and simulation in `tools/phase0/simulate_phase0_formulas.py`.
5. Locked league-dependent seat earnings and occupancy fallback.

## Exact from decompiled logic
- Building speedup formula:
  - `speedup_price = ceil(remaining_minutes) * speedupCost`.
- Stadium contract fields include:
  - visitors and earnings aggregates
  - grass quality
  - max building level
  - building costs and daily costs.
- `MaxGrassQuality = 100`.

## Exact from client/docs
- Stadium routes: get stadium, build, build places, speedup, renew grass, rename.
- Finance routes: current finance summary and finance history.

## User empirical evidence integrated
- Running cost applies daily.
- Seat earnings per league and seat type:
  - league 4: VIP `212`, sit `16`, stand `8`
  - league 3: VIP `269`, sit `21`, stand `10`
  - league 2: VIP `343`, sit `27`, stand `13`
  - league 1: VIP `436`, sit `34`, stand `17`
- VIP/sit caps by league:
  - league 3: VIP `1900`, sit `24000`
  - league 2: VIP `2300`, sit `28500`
  - league 1: VIP `2800`, sit `35000`
- Standing seats are unbounded in build count but occupancy is bounded by league and team form.
- Third league sample:
  - standing 19,500, seats 24,000, VIP 1,900
  - running cost 97,655
  - earnings 1,210,100
- Unit increments observed:
  - +100 standing seats => +85 running cost, +1000 earnings
  - +10 VIP boxes => +212 running cost, +2690 earnings
- Friendly match income split equally.
- League home match income goes fully to home team.
- User states fans/members had no observed influence on stadium earnings.

## Fallback model selected after testing
Selected earnings model for known seat types:
- `match_earnings = vip * vip_rate[league] + sit * sit_rate[league] + filled_stand * stand_rate[league]`

Selected running-cost reconstruction:
- `daily_running_cost = vip * 21.2 + sit * 1.7 + stand * 0.85`

Standing occupancy fallback model (needed for unlimited stands):
- `max_filled_stands = (sit + vip * 10) * league_ratio[league] * (1 + 0.35 * form_index)`
- `filled_stand = min(standing_built, max_filled_stands)`
- calibrated ratios currently:
  - league 4: `0.36`
  - league 3: `0.45`
  - league 2: `0.55`
  - league 1: `0.68`

This occupancy model is explicitly a fallback pending more occupancy samples.

## Simulated walkthrough
Using observed increments only:
- Add 1,000 standing seats (10 x 100)
  - earnings delta: `10 * 1000 = 10,000`
  - running cost delta: `10 * 85 = 850`
- Add 100 VIP boxes (10 x 10)
  - earnings delta: `10 * 2690 = 26,900`
  - running cost delta: `10 * 212 = 2,120`

What this accomplishes:
- produces a positive but bounded ROI per stadium upgrade tier.
- allows daily cost pressure even without immediate match payouts.

Simulation validation highlights:
- Reconstructed league-3 sample earnings exactly: `1,210,100`.
- Reconstructed running costs exactly: `97,655`.
- Stand occupancy sensitivity behaves plausibly with form:
  - poor form -> reduced filled stands
  - neutral -> near baseline
  - strong form -> can fill up to built capacity
