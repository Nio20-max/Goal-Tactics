# Fresh Database Production Readiness Report

**Date:** 2026-03-13  
**Scope:** What happens if the database starts completely empty, and whether the game is production-ready in that state.

## Executive Verdict

A completely fresh database **boots successfully and becomes playable after the first user registration**, but it is **not yet production-ready as a full game platform**.

Current state is best described as:
- **Good for controlled launch / beta**
- **Not yet ready for large-scale, full-feature production**

## What Happens On a Fresh Database

## 1. Startup and schema
- API startup applies migrations automatically (`Database.Migrate()`).
- Optional destructive reset is guarded by explicit confirmation string.
- Health endpoint exists at `/health`.

**Result:** Fresh DB schema initialization is robust.

## 2. Data seeding behavior
- There is no big global seed step at startup.
- Core world seeding happens during first registration:
  - League pyramid is created (tiers/groups)
  - Bot users/teams and league slots are created
  - The first real user is assigned into a bot slot
  - Team resources and initial players are created

**Result:** First-user onboarding builds the game world automatically; this works, but first registration does heavy work and can be slower.

## 3. Early gameplay viability
After first registration/login, core flows are available:
- Team, squad, league, training, sponsors, scouting, stadium, transfer market search/bid/sell, live match APIs
- Compatibility aliases for legacy client routes are present (including Sponsor Accept path variants)

**Result:** A new instance is functionally playable.

## What Is Still Missing For True Production Readiness

## Critical gaps
1. Several gameplay actions are still no-op stubs:
- `FirePlayer`
- `UpgradePlayer`
- `UseSkillCard`
- `HealPlayer`
- `SaveLineup`
- `VerifyPurchase`

2. Multiple background jobs are placeholders (`Task.CompletedTask`), including:
- `SeasonTickJob`
- `TrainingProgressJob`
- `ScoutingCompletionJob`
- `LeagueFixtureGenerationJob`
- `ContractExpiryJob`
- `InjuryRecoveryJob`
- `DailyRewardResetJob`
- `PushNotificationDispatchJob`

These placeholders do not prevent boot, but they reduce long-term simulation depth and live-ops behavior.

## Important gaps
1. Real-money purchase verification is not implemented end-to-end (`VerifyPurchase` is stubbed).
2. Some game loops depend on on-demand logic instead of fully scheduled lifecycle jobs.
3. Operational maturity is partial:
- Health checks and rate limiting exist
- but end-to-end observability, alerting, and runbook-driven ops are still limited for high-scale production.

## Scalability and reliability concerns
1. First-user registration seeds a lot of data in one transaction path; this is workable but can be heavy under concurrent first-launch load.
2. SQLite is fine for single-node/small deployments, but is a bottleneck for multi-node/high write concurrency production.

## Security and account lifecycle status
- Good baseline: JWT + session table validation, lockout handling, password hashing, refresh-token rotation.
- Still not complete for full production expectations:
  - password reset / email verification exist logically but still need full production mail delivery and operations hardening.

## Fresh-DB Readiness Scorecard

- **Boot from empty DB:** Pass
- **First user onboarding:** Pass
- **Core gameplay availability:** Partial Pass
- **Feature completeness:** Fail (due to stubs/no-op endpoints)
- **Background automation completeness:** Fail (several placeholder jobs)
- **Security baseline:** Pass
- **Scale readiness:** Partial Fail (SQLite + heavy first-seed path)
- **Operations readiness:** Partial Pass

## Overall Conclusion

If you start from a completely new database today, the backend will come up and the game can be played.  
However, this is **not yet a production-ready final game** because key gameplay actions and several lifecycle jobs are still placeholders, and scale/ops hardening is incomplete.

## Recommended Go-Live Gate (Must complete before calling it production-ready)

1. Implement all no-op gameplay methods (`FirePlayer`, `UpgradePlayer`, `UseSkillCard`, `HealPlayer`, `SaveLineup`, `VerifyPurchase`).
2. Replace placeholder worker jobs with real logic, or remove/register only jobs that are truly implemented.
3. Add production-grade purchase verification flow and auditing.
4. Add launch-scale observability (metrics, alerts, SLO dashboards) and incident runbooks.
5. Define DB strategy for expected load (SQLite limits acknowledged, migration plan to server DB if needed).

## Evidence Basis (code-level)
- Startup migration path and reset guard in API startup.
- Registration flow seeding in auth store (league pyramid + bot slots + first user assignment).
- Placeholder/background job implementations in worker jobs.
- No-op gameplay methods in squad/lineup/shop services.
