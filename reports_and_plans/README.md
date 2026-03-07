# Reports And Plans Overview

This folder is the quick index for the non-`app_rebuild` reports, historical notes, and planning documents in this workspace.

## What This Folder Is

This is a navigation hub. It points to the canonical locations that were kept after cleanup so you do not need to remember where each report set lives.

## Where To Look

### Legacy app UI and Xamarin reconstruction docs

Start here when you need the original app structure, feature notes, and UI-rebuild reference material:

- `reports_and_plans/legacy_app_docs/docs`

Canonical source:

- `Goal Tactics app/docs/`

### Project implementation plans

Start here when you need the main phased project plans for backend, app integration, launch, and operations:

- `reports_and_plans/analysis_plan/plan`

Canonical source:

- `analysis/plan/`

### Backend and rebuild documentation

Start here when you need the recovered API, mechanics, realtime, and rebuild docs:

- `reports_and_plans/rebuild_docs/rebuild`

Canonical source:

- `docs/rebuild/`

### Phase 3 compatibility and crash reports

Start here when you need the legacy APK compatibility reports and startup/crash findings:

- `reports_and_plans/phase3_reports/`

Canonical source:

- `analysis/phase3_compat/*.md`

### Root notes and historical summary files

Start here for top-level notes and task tracking:

- `reports_and_plans/root_notes/`

Canonical sources:

- `TASK_PLAN.md`
- `additional information.md`
- `Goal Tactics app/docs/Goal Tactics.md`

### Legacy analysis compatibility path

If an older document still points at `analysis/game_analysis/...`, that path now resolves to the canonical legacy app docs instead of a duplicate copy.

## Cleaned Canonical Technical Sources

The retained canonical technical artifact locations are:

- `reverse_engineering/decompiled/`
  - recovered decompiled managed code for reference
- `reverse_engineering/extracted_managed_meta/`
  - canonical extracted managed binaries referenced by legacy findings
- `reverse_engineering/output_dir/`
  - decoded APK resource and wrapper output still referenced by older analysis docs
- `analysis/phase3_compat/apk_dec/`
  - decoded compatibility APK tree kept for UI extraction and compatibility work
- `analysis/phase3_compat/out/GoalTactics-compat-debug.apk`
  - retained debug compatibility APK
- `analysis/phase3_compat/out/GoalTactics-compat-debug-fixed.apk`
  - retained fixed baseline compatibility APK

## What Was Cleaned Away

The main removed items were:

- duplicate reverse-engineering trees that were no longer referenced as canonical inputs
- duplicate `analysis/game_analysis` markdown copies
- obsolete phase 3 startup-bypass and patched-blob experiment artifacts

## Separate Active Workspace

The new non-Xamarin UI rebuild workspace is intentionally not indexed here.

Use this separately:

- `app_rebuild/`

That folder contains the active rebuild execution system with plans, checklists, fallback plans, and report templates.