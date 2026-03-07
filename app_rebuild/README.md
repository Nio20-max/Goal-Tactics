# App Rebuild Workspace

This folder is the execution workspace for rebuilding the Goal Tactics client without Xamarin while keeping the legacy UI as close as possible to the original app.

## Folder Structure

- `plan/`
  - strategic plan documents
- `checklists/`
  - concrete execution checklists for each phase
- `fallback_plans/`
  - backup paths and decision matrix when the primary path fails
- `report_templates/`
  - templates the agent must use after each major step
- `reports/`
  - generated step reports and phase completion reports

## Execution Rule

Run work in this order:

1. read the relevant file in `plan/`
2. execute the matching checklist in `checklists/`
3. if blocked, consult `fallback_plans/`
4. after each big step, write a report into `reports/` using `report_templates/`

## Big Step Definition

A big step is any one of these:

- completion of a numbered phase
- completion of a major artifact harvest pass
- completion of shell parity milestone
- completion of a shared component bundle
- completion of one feature group rollout
- completion of backend integration milestone
- completion of a visual diff and QA stabilization pass

## Non-Negotiable Rule

Do not skip report writing. If work was performed, a report must be written into `reports/` before moving to the next big step.# App Rebuild Plan

This folder contains the execution plan for rebuilding the Goal Tactics client without Xamarin while keeping the legacy UI and UX as close as possible to the original Android app.

## Selected Direction

The rebuild path assumed here is:

- no Xamarin runtime in the shipped replacement app,
- Android-first client rebuild,
- maximum UI fidelity to the legacy APK,
- backend integration against the recovered `/api/*`, `/chat`, and `/auc` surface.

## Recommended Target Stack

For best UI parity, the default recommendation is:

- Kotlin
- Android native Views and XML layouts, not Jetpack Compose as the primary rendering layer
- Retrofit/OkHttp for API
- WebSocket or SignalR-compatible client for realtime hubs
- Coil or Glide for image loading
- Room or light local persistence only where needed

Reason:

The legacy client is not primarily a Xamarin.Forms or XAML app. The recovered evidence shows Android XML resources plus managed `GT.Droid` code that inflates layouts, binds fields with `FindViewById`, and registers screens through a custom navigation/binding stack. Matching that structure is easier with Android Views/XML than with a fully declarative rewrite.

## Files In This Folder

- `01-target-architecture.md`
  - target stack, constraints, and non-goals
- `02-ui-extraction-playbook.md`
  - how to extract and reconstruct UI from the recovered Xamarin-era artifacts
- `03-multi-phase-execution-plan.md`
  - the end-to-end phased delivery plan with deliverables and exit criteria

## Core Principle

Do not try to "convert Xamarin files into a new app" mechanically.

Instead:

1. extract Android resources and managed UI structure from the legacy artifacts,
2. reconstruct the design system and screen contracts,
3. rebuild screen behavior natively,
4. use the original APK as the visual and behavioral reference until parity is proven.