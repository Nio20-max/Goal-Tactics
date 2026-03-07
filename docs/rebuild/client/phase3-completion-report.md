# Phase 3 Completion Report

Date: 2026-03-07
Target host: `gt.nikolai-linschmann.de`

## Completed artifacts
- `docs/rebuild/client/service-callsite-inventory.md`
- `docs/rebuild/client/legacy-to-new-api-mapping.md`
- `docs/rebuild/client/client-dto-migration-plan.md`
- `docs/rebuild/client/realtime-reconnection-plan.md`
- `docs/rebuild/client/build-environment.md`
- `docs/rebuild/client/release-checklist.md`
- `docs/rebuild/client/host-rewire-patch-set.md`
- `docs/rebuild/client/legacy-apk-compatibility-release.md`
- `scripts/android-build-debug.sh`
- `scripts/android-build-release.sh`
- `azure-pipelines.yml`

## What is finished
- Phase 3 strategy has been selected as legacy APK compatibility release (highest UI fidelity).
- Host migration target is pinned to `gt.nikolai-linschmann.de`.
- Legacy/new route and callsite inventory are complete from recovered managed interfaces.
- Realtime reconnect behavior and compatibility-release runbook are documented.
- Decoded APK was rebuilt and debug-signed successfully from `analysis/phase3_compat/apk_dec`.

## Build artifacts produced (2026-03-07)
- Unsigned rebuilt APK: `analysis/phase3_compat/GoalTactics-compat-unsigned.apk`
- Zip-aligned APK: `analysis/phase3_compat/out/GoalTactics-compat-aligned.apk`
- Debug-signed APK: `analysis/phase3_compat/out/GoalTactics-compat-debug.apk`

SHA-256:
- `analysis/phase3_compat/GoalTactics-compat-unsigned.apk`: `e80c70716da99d581cf62e08bec5709187dfddbb4d58ad700ffacebe23f0c4c3`
- `analysis/phase3_compat/out/GoalTactics-compat-aligned.apk`: `8c8bd30a6c361b1ec0de512756d3c23092ca11bcafacfcb4a402864be1662a5f`
- `analysis/phase3_compat/out/GoalTactics-compat-debug.apk`: `b2169438ea3a389f3cf4238f5a0eba55d39dcb8f91610acd114ad390ae51857c`

Signing verification:
- Signer DN: `C=US, O=Android, CN=Android Debug`
- Signer SHA-256: `9f8a684ac27463178766309c5432fc122b3e859e2c0905aae53da458aa1063af`

## Endpoint rewiring result in this APK variant
- Attempted managed assembly URL patch via `tools/patch_xamarin_assembly_store_urls.py` against `analysis/phase3_compat/apk_dec/unknown/assemblies/assemblies.blob`.
- Replacement counts were zero for all known legacy/new host literals.
- Patched blob hash equals source blob hash, confirming no literal host substitutions were possible in this binary variant.
- Therefore, compatibility currently depends on backend-side support for expected client route patterns.

## Workspace limitation and resolution
- Limitation:
- This repo snapshot does not include a buildable Xamarin client solution (`.sln` + mobile `.csproj`) for a full source rebuild path.
- Resolution:
- Selected path avoids this as a blocker by preserving original APK and patching endpoint bindings instead of rebuilding UI from source.

## Exit-criteria status in this repository snapshot
- Compatibility release strategy documented: satisfied.
- Legacy/new endpoint compatibility contract documented: satisfied.
- Realtime `/chat` and `/auc` contract and reconnection plan: satisfied.
- Debug build artifact produced and signed: satisfied.
- On-device smoke test execution against live backend: pending (requires device/emulator runtime outside this workspace session).
- Source-rebuild path: deferred.

## Runtime preflight update (2026-03-07)
- Active nginx vhost `/etc/nginx/sites-available/gt.nikolai-linschmann.de` was updated for compatibility routing.
- API and hub upstreams now target local GoalTactics backend on `127.0.0.1:5195`.
- Persistent process setup completed via `systemd` unit `goaltactics-api.service` (`/etc/systemd/system/goaltactics-api.service`) with `ASPNETCORE_URLS=http://127.0.0.1:5195`.
- Added compatibility routes for:
- `/GameEngine/*` -> `/api/*` (prefix rewrite)
- `/chat` -> `/chat` hub upstream
- `/auc` -> `/auc` hub upstream
- Added endpoint-name rewrites for known legacy action names (for example: `GetCurrentAppVersion` -> `GetVersion`, `GetMatchFormation` -> `GetMatchLineup`, `SaveTraining` -> `SaveTacticTraining`).

Validated probes through public host:
- `GET /health` -> `200` with `{"success":true,"message":"pong"}`
- `POST /api/Login` with `{}` -> `400` (validation error envelope)
- `POST /GameEngine/Login` with `{}` -> `400` (rewrite confirmed)
- websocket probe `wss://.../chat` -> `401` (expected unauthenticated)
- websocket probe `wss://.../auc` -> `401` (expected unauthenticated)

Current blocker for final smoke pass:
- No connected Android device in `adb devices`.
- No local emulator CLI available (`emulator` command missing).

## Next execution step (single step)
- Install `analysis/phase3_compat/out/GoalTactics-compat-debug.apk` on test device/emulator and execute the smoke checklist against `gt.nikolai-linschmann.de`.
