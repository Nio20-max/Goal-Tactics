# Migration Plan: Xamarin → Native Android

Last updated: 2026-03-10

Summary
- Replace the legacy Xamarin Android client with a native Android app that reproduces the UI 1:1 and reuses existing picture assets. Target implementation language: Kotlin (Jetpack Compose recommended). Validate pixel parity with automated image-diff tools in the repo.

Scope
- Recreate all screens and UI components in a native Android project located at `android-app/` using assets extracted from the Xamarin APK and project trees.
- Port necessary client-side logic from decompiled managed assemblies where required, reimplementing in Kotlin.
- Preserve server API contracts (no server changes expected).

Assumptions
- High-resolution artwork and drawable resources are available in `analysis/phase3_compat/apk_dec/res/drawable-*` and `Goal Tactics app/android_project/res`.
- Decompiled managed code and `assemblies.blob` exist under `reverse_engineering/` for inspection and logic-porting reference.
- No confidential or proprietary secrets are needed to reproduce UI and flows.

Primary deliverables
- `android-app/` updated to contain a production-ready native Android app with Phase A screens implemented and pixel-verified.
- `migration/layout_drawable_map.csv` mapping layout files → referenced drawables.
- `migration/plan.md` (this file) and a short checklist for continuing work.

High-level phases and checklist

Phase 0 — Inventory & setup (complete)
- Inventory assets and layout XMLs (done). See `migration/layout_drawable_map.csv`.
- Identify core viewmodels and logic to port in `reverse_engineering/decompiled/*` and `GT.Core` artifacts.

Phase 1 — Project skeleton & assets
1. Create or confirm Android Gradle project in `android-app/` (use existing Gradle files). Prefer Kotlin + Compose.
2. Create module structure: `app` (UI), `core` (models/viewmodels), `network` (API client), `assets` (images/fonts).
3. Import asset sources into `android-app/app/src/main/res/` separated by density. Keep canonical copies from:
   - `analysis/phase3_compat/apk_dec/res/drawable-*/`
   - `Goal Tactics app/android_project/res/drawable-*/`

Phase 2 — UI reproduction (pixel-first)
1. Implement shared UI tokens: colors, typography, dimensions derived from `R.java` and `res/values`.
2. Recreate shared components (list cells, buttons, tab headers) as Compose composables or XML includes.
3. Implement Phase A screens (pixel-first): Main, Stadium, Lineup, Chat, DetailedPlayerInfo, Shop.
4. Run pixel-diff after each screen using `tools/capture_ui.py` + `tools/compare_images.py`.

Phase 3 — Port logic and integrate
1. Inspect `GT.Core` and `GT.Droid` decompiled sources for viewmodels and port required client logic into Kotlin.
2. Implement API client behavior, auth flows, local persistence, and any local business rules.
3. Reuse or reimplement realtime (SignalR/WebSocket) connections from `GoalTactics.Realtime` mapping.

Phase 4 — Native libs, assemblies and special cases
1. Identify native `.so` libraries in `apk_dec/lib/`. Decide whether to recompile, drop, or embed compatible equivalents.
2. Extract images and other payloads from `assemblies.blob` using the repo tools (take care to preserve descriptor indexes — see repo notes about assembly-store rebuild risks).

Phase 5 — Tests, CI, release
1. Add UI tests (ComposeTest/Espresso) for core flows.
2. Add pixel-diff checks to CI (compare built UI screenshots vs reference images with tolerances).
3. Configure Gradle release build, R8/proguard rules, and signing config.

Phase 6 — Polish & launch
1. Accessibility and localization pass; extract strings and ensure fonts match.
2. Performance tuning, memory profiling, and battery-impact checks.
3. Release to Play Store (prepare metadata and binaries).

Phase A (detailed): top priority screens and tasks
- These screens are the minimum viable replacement and must be pixel-verified first.

Main / Home (MainMenu)
- Reference layout: `analysis/phase3_compat/apk_dec/res/layout/mainmenucell.xml`
- Key assets: `menu_row_selector`, menu icons, banners.
- Tasks:
  - Create `MainActivity` and `MainScreen` container (Compose `NavHost`).
  - Recreate `MenuCell` composable; banner carousel with auto-scroll.
  - Port `MainMenuCell` viewmodel behavior from `GT.Core`.
  - Pixel-diff test and adjust.

Stadium / Home Map
- Reference layout: `analysis/phase3_compat/apk_dec/res/layout/stadiumlayout.xml`
- Key assets: `stadium1..stadium5`, `map`, building sprites.
- Tasks:
  - Import stadium assets preserved at xxhdpi.
  - Implement background/map container with responsive scaling.
  - Implement precise clickable overlays for buildings and popup modals.

Lineup Formation
- Reference layout: `analysis/phase3_compat/apk_dec/res/layout/lineupformation.xml`
- Key assets: `soccerfield`, player avatars, `LineupFormation_*` field images.
- Tasks:
  - Implement drag/drop field view with snapping.
  - Implement bench, players table, tactics selector, and options dialog.

Chat / Messaging
- Reference layout: `analysis/phase3_compat/apk_dec/res/layout/chatmessage.xml` and chat list items.
- Key assets: `hs__chatBubble*`, `wappen*_normal` team icons.
- Tasks:
  - Recreate message list UI and bubble styles.
  - Implement input row and typing indicator.
  - Connect to realtime endpoints (reuse server paths from `GoalTactics.Realtime`).

Player Detail / Auction
- Reference layout: `analysis/phase3_compat/apk_dec/res/layout/detailedplayerinfo.xml`
- Tasks:
  - Implement tabbed player info layout.
  - Implement bidding UI and server-validated flow.

Shop / In-app purchase
- Reference layout: `analysis/phase3_compat/apk_dec/res/layout/shop.xml`
- Tasks:
  - Recreate shop grid and item detail.
  - Integrate Google Play Billing (start with stubbed flows for QA).

Asset extraction and import guidance
1. Copy assets referenced by `migration/layout_drawable_map.csv` into `android-app/app/src/main/res/drawable-<density>/`.
2. If only xxhdpi or single-density assets are present, import into `drawable-nodpi/` and create scaled variants later using `convert`/`inkscape`/`cwebp`.
3. Preserve filenames exactly when possible to simplify layout porting.

Example commands
Place canonical assets into the native project (run from repo root):

```bash
mkdir -p android-app/app/src/main/res/drawable-xxhdpi
cp analysis/phase3_compat/apk_dec/res/drawable-xxhdpi/* android-app/app/src/main/res/drawable-xxhdpi/
cp "Goal Tactics app/android_project/res/drawable-xxhdpi"/* android-app/app/src/main/res/drawable-xxhdpi/
```

Build and run (debug):

```bash
cd android-app
./gradlew assembleDebug
adb install -r app/build/outputs/apk/debug/app-debug.apk
```

Pixel-diff workflow
1. Start the app on an emulator/device and use `tools/capture_ui.py` to save screenshots of screens.
2. Compare against reference images with `tools/compare_images.py` and tune UI until diffs are within tolerance.

Automated checks for CI
- Add a pipeline step that:
  - Builds the app.
  - Launches an emulator or device farm job (or uses Robo tests) to capture screenshots of key screens.
  - Runs pixel diff comparisons; fail the build when mismatch > configured tolerance.

Risks & mitigations
- Assemblies.blob/assembly-store rebuild risk: recompressing patched assembly stores can change descriptor indexes and break runtime loading. Mitigation: use extracted resource copies for native app and avoid rebuilding assembly stores; if rebuild necessary, follow repo tooling and preserve descriptor_index metadata.
- Missing assets or video recordings: if any screen-recordings or UI dumps are missing, regenerate using `adb` + `tools/capture_ui.py` or request uploads.
- Native libraries: some `.so` may be required for 3rd-party libraries (SkiaSharp/Mono). Mitigation: remove Mono-specific code, replace with native alternatives, or include compatible native libs only where required.

Estimated timeline (Phase A)
- Total Phase A estimate: ~99 hours (approx. 12.5 working days) as previously scoped. See per-screen task cards in `session` plan for detailed hour estimates.

Success criteria
- Core flows implemented and passing pixel-diff checks.
- Functional parity on key behaviors: navigation, lineup editing, chat messaging, bidding, purchases.
- CI pipeline runs builds and pixel checks reliably.

Questions / decisions for you
1. Confirm Kotlin + Jetpack Compose as the preferred UI approach (recommended). (answered: Kotlin)
2. Confirm minimum API level (default: 21). (answered: 21)
3. Provide any missing UI recording files if you expect exact animation reproduction.

Next immediate actions (what I will do next if you say 'go')
1. Create import scripts that copy drawables referenced in `migration/layout_drawable_map.csv` into `android-app/app/src/main/res` and produce a short checklist to verify each screen.
2. Scaffold `MainActivity` and a simple Compose navigation host, and wire one sample screen (`Main`) with referenced assets.

Appendix: useful repo paths
- Decompressed APK layouts: `analysis/phase3_compat/apk_dec/res/layout/`
- Canonical Android project assets: `Goal Tactics app/android_project/res/`
- Decompiled managed code: `reverse_engineering/decompiled/` and `reverse_engineering/output_dir/`
- Image diff tools: `tools/compare_images.py`, capture helpers: `tools/capture_ui.py`

Contact & coordination
- I will track progress in the repo `migration/` folder and update the todo list as tasks complete. Ask me to start the next script or the `Main` screen scaffold when ready.
