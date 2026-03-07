# Phase 3 Through 5 Checklists

This file covers:

- Phase 3: shell and navigation parity
- Phase 4: shared component rebuild
- Phase 5: screen-by-screen implementation

## Phase 3 Checklist

### Inputs

- Phase 0 through 2 outputs
- navigation evidence from GT.Droid and GT.Core
- legacy screenshot pack

### Tasks

- [ ] Create the replacement Android project skeleton.
- [ ] Implement the root activity and startup shell.
- [ ] Implement the loading overlay.
- [ ] Implement the top bar and title handling.
- [ ] Implement the section or bottom navigation shell.
- [ ] Implement back handling behavior.
- [ ] Implement context menu or side menu behavior if required.
- [ ] Implement popup host behavior.
- [ ] Implement shell-level badge and notification hooks.
- [ ] Implement a navigation graph that matches the recovered screen graph.

### Outputs

- runnable shell skeleton
- navigation graph
- popup host
- shell state controller

### Completion Evidence

- [ ] The app can route placeholder screens through the shell.
- [ ] Loading and popup behavior can be demonstrated without backend dependency.

### Required Report

- [ ] Write a Phase 3 completion report.
- [ ] If shell parity is delivered in multiple milestones, write a big-step report after each milestone.

## Phase 4 Checklist

### Inputs

- Phase 2 design tokens
- Phase 1 component taxonomy
- shell implementation

### Tasks

- [ ] Build the resource bar component.
- [ ] Build timer and countdown components.
- [ ] Build badge and unread indicator components.
- [ ] Build reusable list row components.
- [ ] Build reusable table row components.
- [ ] Build popup and confirmation dialog components.
- [ ] Build lock-state overlay component.
- [ ] Build stars or strength display component.
- [ ] Build progress widgets.
- [ ] Build tab header or segment controls.
- [ ] Build at least one player summary card and one match summary cell.
- [ ] Add screenshot or visual tests for each component family.

### Outputs

- shared component library
- visual test set
- component parity notes

### Completion Evidence

- [ ] Components can be reused in at least three different screens.
- [ ] No screen implementation needs to invent a new version of an already-known shared widget.

### Required Report

- [ ] Write a Phase 4 completion report.

## Phase 5 Checklist

### Inputs

- shell implementation
- shared components
- legacy screenshot baselines
- fixture states

### Screen Order

- [ ] Login
- [ ] Quick Start or Register
- [ ] Club
- [ ] Finances
- [ ] Stadium
- [ ] Squad
- [ ] Lineup
- [ ] Training
- [ ] Scouting
- [ ] Transfer Market
- [ ] League
- [ ] GT Ladder
- [ ] Friends
- [ ] Chat
- [ ] Live
- [ ] Shop
- [ ] Settings or Support

### Per-Screen Checklist

Run this list for every screen:

- [ ] Map the screen to its legacy root layout and child templates.
- [ ] Build the static layout.
- [ ] Bind all primary text and state fields.
- [ ] Implement user actions and event handlers.
- [ ] Implement empty state.
- [ ] Implement loading state.
- [ ] Implement locked or disabled state.
- [ ] Compare against legacy screenshot baseline.
- [ ] Record visual or behavior gaps.
- [ ] Fix high-confidence parity gaps before marking the screen done.

### Outputs

- implemented feature screens
- per-screen parity notes
- screen comparison screenshots

### Completion Evidence

- [ ] All primary sections are navigable in fixture mode.
- [ ] Each finished screen has a parity note and screenshot evidence.

### Required Report

- [ ] Write a big-step report after each feature group.
- [ ] Write a Phase 5 completion report after all primary screens are implemented.