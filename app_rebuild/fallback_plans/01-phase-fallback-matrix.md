# Phase Fallback Matrix

Use this file when the primary plan fails.

## Phase 0 Fallbacks

### Failure

The stack decision remains disputed or unclear.

### Backup Path

1. Freeze Android-first anyway.
2. Freeze Kotlin plus Views/XML for parity phases only.
3. Mark Compose or cross-platform evaluation as a post-parity work item.

### Report Requirement

Write a blocker report and record why the stack debate could not be resolved cleanly.

## Phase 1 Fallbacks

### Failure A

Static mapping from GT.Droid to layouts is incomplete.

### Backup Path

1. Use runtime APK capture to identify screen structure.
2. Build the screen catalog from visible navigation plus layout inspection.
3. Mark unresolved static mappings as secondary recovery tasks.

### Failure B

The preserved APK cannot be run reliably for runtime capture.

### Backup Path

1. Use decoded XML plus managed code analysis only.
2. Use screenshots from any previous runs if available.
3. Build mock screens first and reserve runtime validation for later.

### Failure C

Some states cannot be reached in the legacy APK.

### Backup Path

1. Model those states from GT.Core and frontend rebuild notes.
2. Build synthetic fixtures.
3. Mark them as inferred parity states requiring later validation.

## Phase 2 Fallbacks

### Failure

Some visual tokens cannot be recovered exactly.

### Backup Path

1. Prefer closest evidence from screenshots over generic design choices.
2. Reuse legacy spacing ratios even if exact pixel values are uncertain.
3. Mark token confidence levels in notes.

## Phase 3 Fallbacks

### Failure

Exact shell or menu behavior is unclear.

### Backup Path

1. Reproduce the navigation sequence and visible chrome first.
2. Defer rare edge interactions until primary navigation works.
3. Validate later with runtime reference if recovered.

## Phase 4 Fallbacks

### Failure

Custom widgets are harder to replicate than expected.

### Backup Path

1. Implement a visually accurate minimal version first.
2. Match size, text, icons, and states before matching internals.
3. Revisit exact motion or internal behavior in stabilization.

## Phase 5 Fallbacks

### Failure

A screen cannot be completed due to missing backend or incomplete state logic.

### Backup Path

1. Finish the screen in fixture mode.
2. Lock the unresolved live behavior behind TODO parity notes.
3. Continue with the next screen if the blocker is backend-dependent.

## Phase 6 Fallbacks

### Failure

Some interaction details remain uncertain.

### Backup Path

1. Use the most conservative behavior.
2. Preserve visible constraints and confirmation prompts.
3. Mark the uncertainty in the parity gap list.

## Phase 7 Fallbacks

### Failure A

Live backend routes are incomplete.

### Backup Path

1. Keep the screen in fixture mode.
2. Use adapters around available routes.
3. Record missing API behavior as a backend dependency.

### Failure B

Realtime parity is unstable.

### Backup Path

1. Keep polling or manual refresh as a temporary replacement.
2. Add stale-state indicators.
3. Preserve screen usability until hubs are stabilized.

## Phase 8 Fallbacks

### Failure

Visual parity gaps remain too large late in the process.

### Backup Path

1. Prioritize shell, login, and highest-frequency screens first.
2. Defer low-frequency screens and rare popups.
3. Produce an accepted-gap list instead of chasing every difference equally.

## Phase 9 Fallbacks

### Failure

The replacement app is not ready for full cutover.

### Backup Path

1. Keep the legacy APK compatibility path alive as bridge release.
2. Release the rebuilt client to limited beta only.
3. Continue parity hardening before public replacement.