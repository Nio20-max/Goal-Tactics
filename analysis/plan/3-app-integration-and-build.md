# Phase 3 - App Integration And Build

## Execution Status (2026-03-07)

Phase 3 has been pivoted to the highest-fidelity working option:

- keep the original app UI and behavior from the APK
- avoid full Xamarin source rebuild
- patch only backend endpoint bindings and keep runtime contracts intact

Why this option was selected after decompiled + docs review:

- `reverse_engineering/decompiled/GT.Core.actual/store0_idx17.decompiled.cs` proves most UI and game logic are in managed assemblies (`GT.Core`, `GT.Droid`) inside the APK.
- `Goal Tactics app/docs/features-and-frontend.md` and `Goal Tactics app/docs/frontend-rebuild-analysis.md` show the full UI is management-heavy and tightly coupled to existing client behavior.
- Rebuilding from decompiled source risks visual and behavioral drift; using the original APK preserves the old app look exactly.

Produced outputs:

- `docs/rebuild/client/service-callsite-inventory.md`
- `docs/rebuild/client/legacy-to-new-api-mapping.md`
- `docs/rebuild/client/client-dto-migration-plan.md`
- `docs/rebuild/client/realtime-reconnection-plan.md`
- `docs/rebuild/client/build-environment.md`
- `docs/rebuild/client/release-checklist.md`
- `docs/rebuild/client/host-rewire-patch-set.md`
- `docs/rebuild/client/phase3-completion-report.md`
- `scripts/android-build-debug.sh`
- `scripts/android-build-release.sh`
- `azure-pipelines.yml`
- `analysis/phase3_compat/GoalTactics-compat-unsigned.apk`
- `analysis/phase3_compat/out/GoalTactics-compat-debug.apk`

Repository limitation recorded in completion report (still true for full source rebuild):

- the buildable Xamarin client solution is not present in this snapshot, so signed APK/AAB execution is blocked until the client project files are restored.

Execution result now includes a rebuilt and debug-signed compatibility APK.

Important runtime finding from patch execution:

- direct host literal patching in `analysis/phase3_compat/apk_dec/unknown/assemblies/assemblies.blob` yielded zero replacements for known legacy/new URL constants.
- this APK variant does not expose expected host constants as directly patchable literals in managed payloads.
- backend compatibility routing remains required for operational validation.

This phase now focuses on a compatibility release path that keeps the old client UI intact while making it work with the rebuilt backend host.

## 3.1 Inputs required from earlier phases

Phase 3 depends on:

- the Phase 0 legacy-to-new API mapping being complete
- the new backend routes being implemented and contract-tested in Phase 1
- the chat and auction hubs being live
- purchase verification, daily reward, preferences, and notification services being functional

## 3.2 Main client rewrite objective

The chosen objective is no longer "full client rewrite first". The chosen objective is:

- keep original APK UI/flow exactly as-is
- patch endpoint host targets used by the managed client
- provide backend compatibility for both old and new route surfaces

The runtime must successfully reach:

- `https://<new-host>/api/*`
- `wss://<new-host>/chat`
- `wss://<new-host>/auc`
- legacy-compatible `.../GameEngine/*` where old services are still called

From decompiled client findings, both of these are still used:

- `URLHelper.BaseServiceUrl` (`/GameEngine/`)
- `URLHelper.NewBackendUrl + "api/"` plus hubs `/chat` and `/auc`

Therefore, the server must support compatibility mode until a later full rewrite.

## 3.3 Required client analysis and patch set

Create and use these documents before shipping:

- `docs/rebuild/client/service-callsite-inventory.md`
- `docs/rebuild/client/legacy-to-new-api-mapping.md`
- `docs/rebuild/client/client-dto-migration-plan.md`
- `docs/rebuild/client/realtime-reconnection-plan.md`
- `docs/rebuild/client/build-environment.md`

Add this Phase 3 execution artifact:

- `docs/rebuild/client/legacy-apk-compatibility-release.md`

The callsite inventory must list for every service method:

- current client class and file
- current route or base service
- target new route
- DTO conversion requirement
- whether the UI behavior also changes

## 3.4 Binary-preserving patch areas

Patch only the minimum needed to re-target backend hosts while preserving UI and gameplay flow.

Primary targets from decompiled managed code:

- `GT.Core.URLHelper` constants and selectors
- service base selection (`BaseServiceUrl` and `NewBackendUrl` consumers)
- hub URLs for chat (`/chat`) and auction (`/auc`)

Validation targets from decompiled code:

- `URLHelper` constants in `GT.Core.actual/store0_idx17.decompiled.cs`
- hub wiring lines that build connections to `URLHelper.NewBackendUrl + "/chat"` and `... + "/auc"`

Do not rewrite UI layer for this phase.

## 3.5 Compatibility backend requirements (selected path)

To keep the original client functional, backend must expose both:

- legacy-compatible `/GameEngine/*` contract endpoints still called by legacy services
- newer `/api/*` endpoints used by `NewBackendService<T>`
- SignalR hubs `/chat` and `/auc`

The compatibility layer must preserve:

- expected request/response DTO shapes
- headers `x-goaltactics-version` and `x-goaltactics-capabilities`
- auth token and session semantics used by the existing app

## 3.6 APK patch and packaging flow (selected path)

1. Start from original APK in `reference_materials/`.
2. Modify backend URL bindings only (no UI/layout/resource changes).
3. Repackage APK.
4. Sign debug build for QA.
5. Verify login, core navigation, lineup, training, transfer market, chat, and realtime.

This path yields the closest visual and behavioral match to the historic app.

## 3.7 Deferred scope (not in selected path)

Deferred to later phase:

- full Xamarin source rebuild from recovered/decompiled code
- large DTO/UI refactor to remove all legacy flows
- complete removal of `/GameEngine/*` from runtime

## 3.8 Verification checklist for compatibility release

Must pass on-device:

- login and session restore
- Club, Finances, Stadium, Squad, Lineup, Training, Scouting
- Transfer market search/details/bid/favorites
- Chat history/post/typing with reconnect
- Auction realtime updates via `/auc`
- no visible UI regressions versus original APK

## 3.9 Exit criteria (updated)

Phase 3 is complete for the selected option when:

- patched APK runs with original UI unchanged
- patched APK works against rebuilt backend host with compatibility routing
- `/api/*`, `/chat`, and `/auc` flows are operational
- required legacy `/GameEngine/*` compatibility calls are operational
- debug-signed APK artifact is produced and smoke-tested