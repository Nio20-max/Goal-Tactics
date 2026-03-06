# Goal Tactics Rebuild Plan

This folder is the rewritten implementation plan for rebuilding Goal Tactics from the recovered client and documentation. It starts with what is already known from the APK and recovered docs, then turns that into an execution plan with explicit files, APIs, database structures, mechanics-recovery work, bot behavior, app changes, and launch steps.

## What is known so far

- The shipped app is an always-online football management game with persistent club progression, league play, GT Ladder, friendlies, chat, scouting, transfer auctions, training, stadium upgrades, finances, sponsors, shop, support, and premium currency.
- The client talks to a newer backend at `NewBackendUrl + "api/"` and uses SignalR hubs at `/chat` and `/auc`.
- The new typed API surface has been recovered with exact route names, request DTO names, response DTO names, and top-level fields.
- The client exposes exact timers and costs for some mechanics, including normal scouting, premium scouting, scouting speedup, and GT Ladder stamina restore.
- The exact gameplay formulas are not fully documented yet. The plan therefore requires extracting them from the decompiled logic first. If a formula cannot be recovered exactly, the rebuild must test plausible candidate formulas and select the best one before implementation starts.
- The requested scope is the shipped game rebuild first. Wishlist features from the remake notes stay out of the execution phases until the shipped game is working.

## Plan structure

- [0-contract-and-mechanics-recovery.md](0-contract-and-mechanics-recovery.md): lock the exact public contracts, mechanics, formulas, timers, and validation rules before coding the backend.
- [1-backend-implementation.md](1-backend-implementation.md): build the new backend API, SignalR hubs, database, workers, and operational services.
- [2-bot-simulation.md](2-bot-simulation.md): build production-grade bots and an offline simulation harness that validates economy, match balance, social behavior, and live-world population.
- [3-app-integration-and-build.md](3-app-integration-and-build.md): retarget the app to the rebuilt backend, replace legacy calls, and produce debug and release builds.
- [4-launch-and-operations.md](4-launch-and-operations.md): stage rollout, observability, support workflows, migrations, and production cutover.

## Non-negotiable rules for the rebuild

- Do not implement gameplay formulas from intuition when the decompiled logic can still be mined.
- Do not ship with partial API coverage. Every route used by the rebuilt app must exist and be contract-tested.
- Treat the backend as authoritative for economy, competition, rewards, and timed progression.
- Treat bots as first-class actors in the live world, including chat and social systems, not only as a test harness.
- Preserve clear separation between proven facts, extracted formulas, and fallback model-selection work.

## Expected outputs by the end of this plan

- A documented mechanics specification covering formulas, timers, and validation rules.
- A backend repository layout with explicit files for APIs, hubs, jobs, domain logic, persistence, and tests.
- A precise database schema with migrations and seed data.
- A bot subsystem that can both populate the live game and run accelerated simulations.
- A rebuilt Android app that targets the new backend only.
- A launch process with monitoring, replay-safe monetization, and rollback procedures.
