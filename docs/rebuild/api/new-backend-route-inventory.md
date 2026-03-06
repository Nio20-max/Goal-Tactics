# New Backend Route Inventory (Phase 0)

## Phase 0 Step Log
1. Extracted routes and DTO names from recovered API contract doc.
2. Cross-checked decompiled Refit interfaces for route names.
3. Grouped by bounded context and marked required operational metadata.

## Exact from client/docs
- Canonical route set is the `/api/*` surface listed in `analysis/plan/0-contract-and-mechanics-recovery.md` section `0.3`.
- Includes domains: auth, common, chat, friends, ladder, league, lineup, live, team, scouting, shop, sponsor, squad, stadium, training, transfer, tutorial, user.

Reference inventory source:
- `analysis/plan/0-contract-and-mechanics-recovery.md`
- `Goal Tactics app/docs/api-endpoints-and-response-contracts.md`

## Exact from decompiled logic
- Refit declarations confirm route strings and header behavior.
- Header injection on typed calls:
  - `x-goaltactics-version`
  - `x-goaltactics-capabilities`

## Required metadata to fill per route (must be completed before Phase 1 coding)
For each route record:
- request type
- response type
- auth required (`none`, `user token`, `admin`)
- idempotency (`safe`, `idempotent write`, `non-idempotent`)
- default rate limit bucket
- transaction boundary (`none`, `single aggregate`, `cross-aggregate`)
- tables read
- tables written
- side effects (`jobs`, `notifications`, `hub events`)

## Fallback model selected after testing
- None required for route inventory itself.

## Completion note
- Route names and DTO names are complete.
- Operational metadata remains to be filled as part of Phase 0 completion.
