# Legacy APK Compatibility Release (Phase 3 Selected Path)

## Goal
Ship a working APK with UI and UX as close as possible to the historic app by preserving the original APK and patching only backend endpoint bindings.

## Why this path
- Decompiled managed code shows core client behavior in `GT.Core` and `GT.Droid`, not only native Android XML.
- Full source rebuild from decompiled artifacts risks visual and behavioral drift.
- Original APK preserves exact menus, layouts, strings, and interaction timing.

## Evidence from recovered artifacts
- Legacy backend constant: `https://engine.goaltactics.de/GameEngine/`
- New backend constant: `https://gtwebapp2.azurewebsites.net/`
- New API service base pattern: `NewBackendUrl + "api/"`
- Real-time hubs: `NewBackendUrl + "/chat"`, `NewBackendUrl + "/auc"`

Reference: `reverse_engineering/decompiled/GT.Core.actual/store0_idx17.decompiled.cs`

## Required backend shape
The server must support both surfaces while compatibility mode is active:
- `/GameEngine/*` for legacy services still used by the client
- `/api/*` for newer typed services
- `/chat` and `/auc` SignalR hubs

## Release workflow
1. Start from original APK in `reference_materials/`.
2. Patch endpoint bindings only (no UI/resource edits).
3. Repackage and sign debug APK.
4. Run smoke tests against `gt.nikolai-linschmann.de` compatibility backend.
5. Archive tested APK with build notes.

## Execution result in this workspace (2026-03-07)
- Input APK: `reference_materials/Goal Tactics.apk`
- Decoded tree used: `analysis/phase3_compat/apk_dec`
- Rebuild command that succeeded: `apktool b --use-aapt2 analysis/phase3_compat/apk_dec -o analysis/phase3_compat/GoalTactics-compat-unsigned.apk`
- Output debug APK: `analysis/phase3_compat/out/GoalTactics-compat-debug.apk`

Applied decode/build fix:
- Renamed invalid drawable filenames that started with `$` to valid names (`avd_hide_password__*`, `avd_show_password__*`) and updated references in:
- `analysis/phase3_compat/apk_dec/res/drawable/avd_hide_password.xml`
- `analysis/phase3_compat/apk_dec/res/drawable/avd_show_password.xml`
- `analysis/phase3_compat/apk_dec/res/values/public.xml`

Observed limitation:
- Managed blob patching completed with zero host-literal replacements for known legacy/new endpoints in this APK variant.
- This indicates backend compatibility routing remains mandatory for runtime success.

## Endpoint policy for patch
- Prefer one backend host for all traffic: `https://gt.nikolai-linschmann.de`
- Route patterns expected by client:
- `https://gt.nikolai-linschmann.de/GameEngine/*`
- `https://gt.nikolai-linschmann.de/api/*`
- `wss://gt.nikolai-linschmann.de/chat`
- `wss://gt.nikolai-linschmann.de/auc`

## Validation checklist
- Login and session restore
- Club/Finances/Stadium/Squad/Lineup/Training/Scouting pages load and save
- Transfer market search/details/bid/favorites function
- Chat send/typing/history function
- Auction real-time updates function
- No visual UI drift from original APK baseline

## Known limits
- Purchase verification and ad SDK integrations may require environment-specific credentials not present in this repo.
- Without original source, future feature-level changes are slower than with a full source rebuild.
