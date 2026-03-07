# Multi-Phase UI Rebuild Execution Plan

## Goal

Deliver a non-Xamarin Android client that preserves the legacy Goal Tactics UI as closely as possible while integrating with the recovered backend contracts and realtime endpoints.

## Summary Of Phases

0. Project framing and stack lock
1. Artifact harvest and UI extraction
2. Design system reconstruction
3. Shell and navigation parity
4. Shared component rebuild
5. Screen-by-screen implementation
6. State parity and interaction parity
7. Backend and realtime integration
8. Visual diff, QA, and stabilization
9. Cutover, beta, and release preparation

## Phase 0. Project Framing And Stack Lock

### Objective

Remove ambiguity before implementation starts.

### Tasks

1. Lock the target platform to Android-first.
2. Lock the primary UI stack to Kotlin plus Android Views/XML.
3. Decide project modules and package structure.
4. Define parity goals:
   - exact screen structure where possible
   - exact strings and iconography where possible
   - same navigation flow and confirmation behavior
   - acceptable tolerances for spacing and animation
5. Define what will not be ported in the first pass:
   - deprecated third-party SDK flows
   - store and ad integrations if backend parity is not ready
6. Define acceptance metrics for "close enough".

### Deliverables

- architecture decision record
- module map
- parity acceptance criteria
- risk register

### Exit Criteria

- stack choice is frozen
- parity definition is written down
- implementation can proceed without framework debate

## Phase 1. Artifact Harvest And UI Extraction

### Objective

Turn the legacy app into a complete reference corpus for the rebuild.

### Tasks

1. Catalog all decoded resource layouts, values, drawables, menus, and styles.
2. Build a numeric resource id to symbolic name map.
3. Parse `GT.Droid.decompiled.cs` for:
   - `SetContentView(...)`
   - `LayoutInflater.Inflate(...)`
   - `FindViewById(...)`
   - `ItemTemplate` and popup templates
   - `Register(ScreenIdentifier, Type)` screen wiring
4. Build a screen inventory with root layout, sublayouts, and list cell templates.
5. Build a view-binding matrix for each screen.
6. Extract all strings and classify them by screen and flow.
7. Inventory all images, selectors, progress assets, and special drawables.
8. Identify all custom views and their behavior.
9. Prepare a fixture strategy for unreachable states.
10. Run the preserved APK and capture screenshots, layout trees, and screen recordings where possible.

### Special Note On "getting UI out of Xamarin files"

This phase is exactly where that happens.

Not by sending requests to files, but by extracting UI from:

- Android XML resources
- managed Android view wiring
- runtime view trees and screenshots from the preserved APK

### Deliverables

- screen inventory
- layout inventory
- resource id map
- screenshot baseline pack
- view binding matrix
- custom view inventory
- extraction scripts plan or prototypes

### Exit Criteria

- every major screen has a known root layout and known state model
- enough runtime screenshots exist to use as a fidelity baseline

## Phase 2. Design System Reconstruction

### Objective

Recreate the visual grammar of the old app before feature coding begins.

### Tasks

1. Reconstruct color palette.
2. Reconstruct typography hierarchy.
3. Reconstruct spacing, margins, paddings, and panel geometry.
4. Reconstruct button states and selector behavior.
5. Reconstruct icon usage and image scaling rules.
6. Reconstruct global overlays, loading visuals, and popup chrome.
7. Convert recovered design details into reusable Android styles/themes.
8. Define all design tokens in one place.

### Deliverables

- token sheet
- style/theme definitions
- shared drawable and selector catalog
- UI reference board comparing old vs rebuilt primitives

### Exit Criteria

- shared visual primitives are stable enough that screens can be built from them

## Phase 3. Shell And Navigation Parity

### Objective

Rebuild the application shell so the rest of the screens can plug into a faithful navigation model.

### Tasks

1. Recreate startup shell and root activity flow.
2. Implement the main shell with:
   - top bar
   - bottom or section navigation structure
   - loading overlay
   - badges
   - side or menu interactions if required by the original app
3. Rebuild popup and dialog host behavior.
4. Recreate navigation graph according to the recovered screen registration map.
5. Recreate shell-level state handling for titles, back actions, menu availability, and context actions.

### Deliverables

- running shell skeleton
- navigation graph
- popup host
- loading overlay system

### Exit Criteria

- screens can be routed into place with the same shell semantics as the legacy app

## Phase 4. Shared Component Rebuild

### Objective

Implement the recurring building blocks once and reuse them everywhere.

### Tasks

1. Build currency/resource bar.
2. Build countdown and timer widgets.
3. Build badge and notification indicators.
4. Build list rows and table row components.
5. Build popup templates and confirmation dialogs.
6. Build status chips and lock-state overlays.
7. Rebuild custom widgets analogous to:
   - stars/strength controls
   - progress bars
   - table/list hybrids
   - tab headers
   - match/player summary cells
8. Add screenshot tests for each shared component.

### Deliverables

- shared UI kit module
- component catalog
- component parity screenshots

### Exit Criteria

- feature screens no longer need to invent one-off versions of common UI primitives

## Phase 5. Screen-By-Screen Implementation

### Objective

Rebuild the actual product screens in a strict implementation order.

### Recommended order

1. Login
2. Quick start / registration
3. Club
4. Finances
5. Stadium
6. Squad
7. Lineup
8. Training
9. Scouting
10. Transfer Market
11. League
12. GT Ladder
13. Friends
14. Chat
15. Live
16. Shop
17. Settings / Support

### Tasks Per Screen

For every screen:

1. Map legacy screen to recovered layout and bindings.
2. Rebuild static layout.
3. Rebuild state rendering.
4. Rebuild interactions and button enablement rules.
5. Rebuild empty, loading, error, and locked states.
6. Compare against legacy screenshot baseline.
7. Record parity gaps and fix them before moving on.

### Deliverables

- implemented screens with screenshot comparisons
- per-screen parity notes

### Exit Criteria

- all primary sections exist and are navigable in fixture mode

## Phase 6. State Parity And Interaction Parity

### Objective

Make the rebuild behave like the legacy app, not just look similar.

### Tasks

1. Implement visibility and enablement rules driven by state.
2. Match confirmation dialog usage.
3. Match timer progression and in-progress button states.
4. Match read-only behavior such as lineup lock windows.
5. Match badge counts and unread indicators.
6. Match popup flows for errors and confirmations.
7. Validate all fixture states against the original APK where possible.

### Deliverables

- state matrix by screen
- interaction parity checklist

### Exit Criteria

- screen behavior under key states is considered parity-complete in fixture mode

## Phase 7. Backend And Realtime Integration

### Objective

Move from fixture mode to live system behavior.

### Tasks

1. Implement API clients from recovered route and DTO documentation.
2. Implement auth/session restore.
3. Implement `/chat` hub integration.
4. Implement `/auc` hub integration.
5. Add reconnect and stale-state indicators.
6. Replace fixtures screen by screen with live calls.
7. Preserve parity for loading, retry, and error UX.

### Deliverables

- live API integration
- realtime integration
- offline and reconnect behavior notes

### Exit Criteria

- core product flows work end to end with the live backend

## Phase 8. Visual Diff, QA, And Stabilization

### Objective

Prove that the rebuilt app is visually and behaviorally close enough to the old app.

### Tasks

1. Build a screenshot comparison suite.
2. Compare rebuilt screens against captured legacy baselines.
3. Run manual side-by-side testing for all primary flows.
4. Fix high-visibility visual drift first.
5. Fix interaction drift second.
6. Validate performance on real devices.
7. Validate text truncation, scaling, and timers.

### Deliverables

- visual diff report
- QA issue list
- parity signoff list

### Exit Criteria

- critical screens pass parity review
- remaining gaps are explicitly accepted, not accidental

## Phase 9. Cutover, Beta, And Release Preparation

### Objective

Turn the rebuild from a parity prototype into a releasable client.

### Tasks

1. Remove temporary fixture-only hooks from production paths.
2. Harden logging, crash reporting, and analytics.
3. Add release signing and CI build pipeline.
4. Run beta with targeted users.
5. Collect gap reports comparing old and new clients.
6. Prioritize parity regressions over new feature work.
7. Plan retirement of the legacy APK path once confidence is high.

### Deliverables

- beta build
- release checklist
- cutover decision memo

### Exit Criteria

- replacement app is stable enough to carry real users

## Parallel Workstreams Required Across All Phases

These tracks must run in parallel, not sequentially.

### A. Resource normalization

- clean asset names
- standardize drawable references
- verify density buckets and scaling

### B. Fixture and mock infrastructure

- JSON fixtures
- mock backend or replay server
- repeatable screen-state launch paths

### C. Parity documentation

- capture decisions
- record deviations from legacy behavior
- document unknowns and accepted replacements

### D. Automation

- screenshot capture
- visual diff tooling
- layout extraction helpers
- UI smoke tests

## Critical Risks

1. Trying to code screens before the extraction inventory is complete.
2. Choosing Compose too early and losing easy fidelity to XML-era layout behavior.
3. Underestimating custom widgets and popup flows.
4. Depending only on static decompilation without runtime capture.
5. Integrating live backend too early before fixture parity exists.
6. Replacing legacy interaction details with generic modern patterns.

## Recommended First Three Implementation Steps

If execution starts immediately, do these first:

1. Build the extraction outputs from Phase 1.
2. Stand up a new Android project with the shell, theme, and asset pipeline from Phase 0 and Phase 2.
3. Rebuild the login, quick-start, and shell screens first and compare them side by side against captured legacy screenshots.