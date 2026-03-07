# Phase 6 Through 9 Checklists

This file covers:

- Phase 6: state and interaction parity
- Phase 7: backend and realtime integration
- Phase 8: visual diff, QA, and stabilization
- Phase 9: cutover, beta, and release preparation

## Phase 6 Checklist

### Inputs

- implemented screens
- fixture library
- legacy behavior notes

### Tasks

- [ ] Match visibility rules driven by state.
- [ ] Match enabled and disabled rules driven by state.
- [ ] Match confirmation dialog flows.
- [ ] Match timer-driven in-progress states.
- [ ] Match unread counters and badges.
- [ ] Match shell title and context action changes.
- [ ] Match read-only windows such as lineup lock.
- [ ] Validate critical fixture states against the legacy APK.

### Outputs

- state parity matrix
- interaction parity checklist
- unresolved parity gap list

### Completion Evidence

- [ ] Critical screen states behave consistently in fixture mode.

### Required Report

- [ ] Write a Phase 6 completion report.

## Phase 7 Checklist

### Inputs

- `docs/rebuild/api/`
- `docs/rebuild/realtime/`
- `docs/rebuild/client/service-callsite-inventory.md`
- rebuilt screens in fixture mode

### Tasks

- [ ] Implement auth flow.
- [ ] Implement session restore.
- [ ] Implement API client base.
- [ ] Integrate `/api/*` routes by feature area.
- [ ] Integrate `/chat` hub.
- [ ] Integrate `/auc` hub.
- [ ] Implement reconnect indicators.
- [ ] Replace fixtures screen by screen with live calls.
- [ ] Preserve parity for loading, retry, and error states.

### Outputs

- live data integration
- realtime integration
- network state notes

### Completion Evidence

- [ ] Core user flows work against live backend.
- [ ] Realtime chat and auction flows are functionally connected.

### Required Report

- [ ] Write a big-step report after auth and API base are working.
- [ ] Write another big-step report after realtime parity is working.
- [ ] Write a Phase 7 completion report.

## Phase 8 Checklist

### Inputs

- live-integrated app
- legacy screenshot baseline pack
- parity notes from prior phases

### Tasks

- [ ] Build screenshot comparison suite.
- [ ] Run side-by-side comparisons.
- [ ] Record visual drift.
- [ ] Record interaction drift.
- [ ] Fix high-visibility layout drift first.
- [ ] Fix text truncation and scaling issues.
- [ ] Fix timer and loading inconsistencies.
- [ ] Validate performance on target devices.

### Outputs

- visual diff report
- QA issue log
- parity signoff candidate list

### Completion Evidence

- [ ] Critical screens pass parity review.
- [ ] Remaining gaps are explicitly accepted and documented.

### Required Report

- [ ] Write a big-step report after the first full visual diff pass.
- [ ] Write a Phase 8 completion report.

## Phase 9 Checklist

### Inputs

- stabilized app
- QA issue log
- release and build requirements

### Tasks

- [ ] Remove temporary parity-only or fixture-only production shortcuts.
- [ ] Add release logging and crash handling.
- [ ] Finalize build pipeline and signing.
- [ ] Produce beta build.
- [ ] Run beta feedback round.
- [ ] Triage parity regressions.
- [ ] Produce release candidate.
- [ ] Write legacy cutover plan.

### Outputs

- beta build
- release candidate
- cutover memo
- release checklist

### Completion Evidence

- [ ] Replacement app is stable enough for limited real users.
- [ ] Cutover risks are documented.

### Required Report

- [ ] Write a beta-readiness report.
- [ ] Write a Phase 9 completion report.