# Phase 0 Through 2 Checklists

This file covers:

- Phase 0: project framing and stack lock
- Phase 1: artifact harvest and UI extraction
- Phase 2: design system reconstruction

## Phase 0 Checklist

### Inputs

- `app_rebuild/plan/01-target-architecture.md`
- `app_rebuild/plan/03-multi-phase-execution-plan.md`
- `Goal Tactics app/docs/frontend-rebuild-analysis.md`
- `docs/rebuild/current-state-overview.md`

### Tasks

- [ ] Lock Android-first as the first shipping target.
- [ ] Lock Kotlin plus Android Views/XML as the primary UI stack.
- [ ] Write the module map for shell, ui-kit, features, data, and parity harness.
- [ ] Write explicit non-goals for the first rebuild cycle.
- [ ] Define parity acceptance criteria for layout, strings, state handling, and navigation.
- [ ] Define what third-party SDKs are not required for first parity delivery.
- [ ] Define the naming convention for generated artifacts and reports.
- [ ] Define the list of mandatory evidence sources the agent must use.

### Outputs

- architecture decision record
- module map
- parity acceptance checklist
- risk register

### Completion Evidence

- [ ] The target stack is frozen in writing.
- [ ] The first delivery scope is frozen in writing.
- [ ] There is a clear definition of what counts as parity.

### Required Report

- [ ] Write a Phase 0 completion report.
- [ ] Use `app_rebuild/report_templates/02-phase-completion-report-template.md`.

## Phase 1 Checklist

### Inputs

- `app_rebuild/plan/02-ui-extraction-playbook.md`
- `reverse_engineering/decompiled/GT.Droid.actual/GT.Droid.decompiled.cs`
- `reverse_engineering/decompiled/GT.Core.actual/store0_idx17.decompiled.cs`
- `analysis/phase3_compat/apk_dec/res/`
- `analysis/phase3_compat/apk_dec/AndroidManifest.xml`
- `Goal Tactics app/docs/important-files-and-paths-summary.md`

### Static Extraction Tasks

- [ ] Build a resource id map from `public.xml` and decoded resources.
- [ ] Build a layout catalog for all relevant `res/layout*` files.
- [ ] Build a drawable and selector inventory.
- [ ] Build a strings catalog grouped by feature or screen.
- [ ] Extract all `SetContentView(...)` roots from GT.Droid.
- [ ] Extract all `LayoutInflater.Inflate(...)` calls from GT.Droid.
- [ ] Extract all `FindViewById(...)` bindings from GT.Droid.
- [ ] Extract all `ItemTemplate`, header template, and popup template assignments.
- [ ] Extract screen registration from `InitNavigation()`.
- [ ] Build a screen-to-layout map.
- [ ] Build a view-binding matrix for each screen.
- [ ] Build a custom widget inventory.

### Runtime Harvest Tasks

- [ ] Identify the safest legacy APK baseline for runtime capture.
- [ ] Define the test environment for running the preserved APK.
- [ ] Capture full-screen screenshots for each reachable screen.
- [ ] Capture screenshots for key popup states.
- [ ] Capture layout tree or accessibility hierarchy dumps where possible.
- [ ] Capture short recordings for transitions that are visually important.
- [ ] Record which screens remain unreachable under the current setup.

### Fixture Tasks

- [ ] Define fixture states for empty, loading, success, locked, and error states.
- [ ] Define fixture states for high-value domain situations such as injured players, active builds, unread mail, lineup lock, and transfer bids.
- [ ] Document which fixture states can be produced from live backend data and which need explicit mocks.

### Outputs

- resource id map
- screen inventory
- screen-to-layout map
- view-binding matrix
- strings catalog
- component taxonomy
- screenshot baseline pack
- runtime capture notes
- fixture state plan

### Completion Evidence

- [ ] Every major screen has a known root layout.
- [ ] Every major screen has at least one evidence source for state behavior.
- [ ] The extraction gaps are listed explicitly.

### Required Report

- [ ] Write a Phase 1 completion report.
- [ ] Write a separate big-step report if the runtime capture pass completes independently.

## Phase 2 Checklist

### Inputs

- Phase 1 outputs
- `Goal Tactics app/docs/frontend-rebuild-analysis.md`
- decoded `res/values*`, `res/drawable*`, and layout evidence

### Tasks

- [ ] Define color tokens from legacy resources.
- [ ] Define typography roles and approximate font behavior.
- [ ] Define spacing and sizing tokens.
- [ ] Define background, panel, and border treatments.
- [ ] Define button variants and selector states.
- [ ] Define badge, chip, and notification visuals.
- [ ] Define popup shell visuals.
- [ ] Define loading overlay visuals.
- [ ] Define image scaling and icon usage rules.
- [ ] Build the initial UI parity reference board from extracted evidence.

### Outputs

- design token sheet
- style mapping
- selector mapping
- visual primitives board

### Completion Evidence

- [ ] Shared visual rules are stable enough for shell and component coding.
- [ ] Known ambiguities are recorded with fallback decisions.

### Required Report

- [ ] Write a Phase 2 completion report.