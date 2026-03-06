# Sponsors, Rewards, And Shop Mechanics (Phase 0)

## Phase 0 Step Log
1. Extracted sponsor/shop routes and DTO fields from recovered docs.
2. Extracted relevant cost/reward fields from decompiled `JsonCosts` and sponsor DTOs.
3. Added user-provided monetization observations (ads, stars pricing context).

## Exact from client/docs
- Sponsor routes: get sponsors, accept offer, negotiate.
- Sponsor DTOs include `OfferId`, `Date`, `Name`, `Description`, `Amounts`, `Stars`, `Cards`, `Accepted`.
- Shop routes include products, equipment, buy/use equipment, verify purchase.
- User routes include `ClaimDailyReward`.

## Exact from decompiled logic
- Cost/reward fields available through settings/definitions:
  - `NegotiatedSponsorOffer`
  - `VideoAdReward`
  - `PlaceBid`
  - `UpdateCamps`
  - social rewards (`FacebookReward`, `EmailReward`) under `JsonParameters`.
- Sponsor view uses three offer slots (basic + bonuses) and offer negotiation flow.

## Fallback model selected after testing
Pending formulas:
- sponsor offer generation distribution
- negotiate reroll probability and expected-value shift
- daily reward amount scaling
- ad reward throttling and abuse controls

Candidate sponsor EV model:
`expected_value = base_amount + match_bonus_component + championship_component - negotiate_cost`
Choose negotiate when EV increase probability-weighted benefit > cost.

## Simulated walkthrough
Sample sponsor decision:
- current offer EV estimate: `180,000`
- negotiate cost: `20,000`
- expected improved EV after negotiate: `230,000` with high confidence
- delta EV: `50,000`
- net after negotiate: `+30,000` -> negotiate is rational

What this accomplishes:
- avoids bots and players blindly rerolling sponsor offers.
- gives predictable money/stars/card inflow planning.
