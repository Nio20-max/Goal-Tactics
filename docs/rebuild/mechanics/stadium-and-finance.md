# Stadium And Finance Mechanics (Phase 0)

## Phase 0 Step Log
1. Extracted stadium/building DTO fields and speedup formula from decompiled logic.
2. Collected empirical stadium economics from user-provided live values.
3. Mapped finance ledger requirements from route and DTO contracts.
4. Drafted fallback attendance model with current evidence.

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
Candidate earnings model (current best fit to provided data):
- `match_earnings = standing_places * 10 + vip_boxes * 269 + seat_places * seat_factor_by_league`
- `daily_running_cost = standing_places * 0.85 + vip_boxes * 21.2 + seat_places * seat_cost_factor + fixed_building_costs`

League multiplier and seat factors still need more samples.

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
