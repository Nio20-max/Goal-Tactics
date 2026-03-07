# Global Execution Checklist

Use this checklist before starting any phase.

## Startup

- [ ] Read the relevant strategic document in `app_rebuild/plan/`.
- [ ] Read the matching phase checklist in this folder.
- [ ] Read the relevant fallback section in `app_rebuild/fallback_plans/01-phase-fallback-matrix.md`.
- [ ] Confirm the inputs for the phase exist.
- [ ] Confirm the output folder and target filenames for the phase are defined.
- [ ] Confirm report filenames to be written after the step.

## Evidence Collection Rule

- [ ] Capture exact source files used for decisions.
- [ ] Record any assumptions that are not directly supported by repo evidence.
- [ ] Distinguish confirmed facts from inferences.
- [ ] Save intermediate artifacts rather than keeping them only in notes.

## Fidelity Rule

- [ ] Prefer legacy APK runtime evidence over static inference when both are available.
- [ ] Prefer Android XML and resource evidence over generic redesign decisions.
- [ ] Do not introduce visual modernization during parity phases.

## Blocker Handling

- [ ] Stop and consult the fallback matrix before changing direction.
- [ ] If choosing a fallback, record why the primary path failed.
- [ ] If both primary and fallback paths fail, write a blocker report immediately.

## Reporting

- [ ] Write a big-step report after the phase or milestone.
- [ ] Store the report in `app_rebuild/reports/`.
- [ ] Name the report with date plus phase and milestone.
- [ ] Include unresolved items and next actions.