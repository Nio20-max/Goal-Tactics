# Transfer Market Mechanics (Phase 0)

## Phase 0 Step Log
1. Extracted transfer-market route and DTO surface from recovered docs.
2. Parsed decompiled constants and bid-availability checks from `AuctionViewModel` and settings.
3. Added user-provided empirical increment thresholds.
4. Ran simulation fit against `tools/phase0/formula_samples.json` and selected best-fit increment formula.
5. Added user-provided timer-reset behavior and validated with step simulation.

## Exact from decompiled logic
- Client bid ability check:
  - `CanMakeBid = Money >= CurrentBid + BidIncrement`.
- Constants:
  - `BidRange1 = 100000`
  - `BidRange2 = 150000`
  - `StartBidIncrement = 5000`
  - `BidIncrementFactor = 1.03`
- Auction details response provides `BidCost`, current auction player state, and current increment.

## Exact from client/docs
- New API routes: search, details, place bid, favorites, add/remove favorite.
- Squad side exposes `TransfermarketMinOffer`, `TransfermarketMaxOffer`, `TransfermarketMaxHours`, and fee.

## User empirical evidence integrated
- Below total bid `5,000,000`, increment is below `150,000`.
- At/above `5,000,000`, increment is fixed at `150,000`.

## Fallback model selected after testing
Selected increment model:
1. `increment = max(5000, round(current_bid * 0.03))`
2. clamp by cap: `increment = min(increment, 150000)`
3. optionally enforce floor ranges from server settings arrays (`MinimumBid`) when available from server settings payload.

Fit result against current auction samples:
- MAE at `r=0.03`: `0.00`
- MAE at `r=0.025`: `15741.17`
- MAE at `r=0.035`: `9212.83`

Timer-extension rule (user-observed, accepted fallback):
- If remaining time is `< 20s` when a valid bid is accepted, set remaining time to `20s`.

Settlement remains server-authoritative and depends on competing bids.

## Simulated walkthrough
Case A: current bid `1,200,000`
- `3%` rule -> `36,000`
- cap not hit -> next required bid `1,236,000`

Case B: current bid `7,500,000`
- `3%` rule -> `225,000`
- capped to `150,000`
- next required bid `7,650,000`

What this accomplishes:
- keeps early auctions granular.
- prevents late-stage increments from becoming unreasonably large.

Timer reset walkthrough:
- before `45s` -> after valid bid `45s`
- before `19s` -> after valid bid `20s`
- before `11s` -> after valid bid `20s`
- before `3s` -> after valid bid `20s`

This anti-sniping behavior is consistent with your observed live behavior.
