# Production Readiness Plan — Goal Tactics Backend

**Date:** 2026-03-12

This document outlines a prioritized sequence of work items and milestones required to take the Goal
Tactics backend from its current bug‑fixed state to a production‑ready service.  It complements the
`production-readiness-analysis.md` report by focusing on *when* and *how* to tackle remaining
features, hardening tasks, and improvements.

---

## 1. Immediate critical path
These items must be implemented, tested and deployed before any public release.

1. **Transfer market engine**
   - Design and create an `Auctions` table in SQLite.
   - Implement service methods for listing, bidding, and selling; replace `BuildTransferPlayers()`.
   - Add a background worker that expires old listings.
   - Extend market controllers and contract models accordingly; add unit and contract tests.
   - Make sure that the remaining time goes up to 20 seconds again if a player bid on the transfer market. 

2. **Per-player goal tracking**
   - Modify match simulation to record individual scorer events.
   - Change `LeagueService.GetGoalGettersAsync()` to query real player stats.
   - Update related models, mappers and tests.

3. **Match simulation rewrite**
   - Replace the crude `random.Next(0,3)+strengthDiff/25` logic with an event‑driven engine:
     minute-by-minute probabilities, substitutions, cards and injuries.
   - Ensure deterministic seeding for reproducible tests.
   - Add simulation unit tests and run integration tests to validate output ranges.
   - Make sure that the strength the team plays with includes the tactical bonus and what follows from it. More information is in tactics.md. 

4. **Resolve failing tests**
   - Diagnose and fix the broken `FriendsControllerTests` flow.
   - Correct `TeamAccomplishmentTests` to pass teamId instead of userId.

5. **Authentication hardening**
   - Implement JWT refresh token rotation and expiry.
   - Add account lockout logic on repeated failed logins.
   - Create password‑reset and email‑verification endpoints and flows.
   - Add corresponding tests and update documentation.

6. **Database migrations deployment**
   - Ensure the two migrations (`AddCampRefreshCount`, `AddIsScoutedColumn`) are applied in staging and production during the rollout.

## 2. Secondary backend improvements
These enhancements should follow the critical path and can be delivered over one or two sprints.

1. **Scouting mechanics** – honour `NextScoutingDate`, implement star speed‑ups and a cap on simultaneous scouts.
2. **Implement favorites and selling stubs in transfer market APIs.**
3. **Add pagination** to large endpoints (friends search, transfer market, league queries).
4. **Sponsor system overhaul** – introduce contract durations, renewals and performance-based bonuses.
5. **Equipment image validation** – verify correct drawable names, trim variations across clients.
6. **Financial ledger formatting** – match the exact format expected by the Xamarin client.

## 3. Long-term polish & operational readiness
These tasks are valuable but not strictly blocking a release; schedule them as part of ongoing
maintenance and feature sprints.

- Bot AI expansion (training, scouting, market activity). (later, that is a big rebuild)
- Live match event broadcasting over `/auc` and `/chat` hubs.
- Localization framework and string extraction beyond German country names.
- Tune stadium naming/renewal costs if needed. 
- Validate and improve ladder/ranking algorithm.
- Add structured logging, health check endpoint and metrics export (Prometheus, etc.).
- Enhance rate limiting with IP-based rules and abuse detection.
- Test backup/restore procedure for the SQLite database.

## 4. Deployment checklist (reuse from analysis)

1. Build and publish the API project (`dotnet publish ...`).
2. Stop the `goaltactics-api.service`.
3. Apply new migrations explicitly or rely on `EnsureCreated`.
4. Start the service and run smoke‑tests (countries count, fixed features).
5. Run full test suite and verify contract tests against deployed API.

## 5. Risk mitigation and notes

- Document all DB schema changes and keep them additive.
- Maintain a changelog for API contract modifications.
- Use feature flags for any behavioural changes to allow quick rollback.
- Ensure unit/contract tests run in CI with the persisted SQLite DB reset at assembly load.

---
