# Goal Tactics Startup Remediation Report

Date: 2026-03-07

## Objective

After tracing the startup flow, the remediation work focused on problems that are fixable in this repository without performing more unsafe binary surgery on the legacy Xamarin payload.

## What Was Changed

### 1. Blocked unsafe GT.Droid behavioral rewrites in AssemblyUrlPatcher

File:
`tools/AssemblyUrlPatcher/Program.cs`

Change:
- Removed support for `--disable-helpshift`, `--disable-appcenter`, and `--disable-appsflyer`.
- The tool now rejects those flags with a clear error.
- The usage text now states that the tool only supports fixed-string backend URL patching.

Reason:
- Those flags rewrote real GT.Droid IL by clearing method and constructor bodies.
- That path was the highest-confidence cause of the final direct-crash regression.
- Leaving the flags available would keep the known-bad workflow live.

Result:
- Future runs cannot accidentally reproduce the unsafe startup-bypass build through the C# patcher.

### 2. Blocked accidental GT.Droid reinjection into assemblies.blob

File:
`tools/patch_xamarin_assembly_store_urls.py`

Change:
- Added `--allow-unsafe-gt-droid-payload`.
- If `--patched-gt-droid` is supplied without that explicit opt-in, the script now aborts.

Reason:
- The previous rebuild pipeline made GT.Droid payload injection nearly as easy as the safe GT.Core URL-only patch path.
- That was too permissive given the confirmed crash risk.

Result:
- The safe default is now GT.Core-only URL patching.
- Anyone attempting GT.Droid payload reinjection has to make an explicit unsafe choice.

### 3. Wrote a step-by-step startup callflow report

File:
`analysis/phase3_compat/2026-03-07-startup-callflow-report.md`

Content:
- launcher-to-managed entrypoint mapping,
- ordered `MainActivity.OnCreate` call sequence,
- service/container and UI initialization flow,
- first backend/network gate,
- loading overlay behavior,
- startup risk separation and fixability boundaries.

Reason:
- The existing crash report explains the regression well, but it does not provide a code-walked startup trace from entrypoint through backend gating.

## What Was Not Changed

Some issues were identified but cannot be fixed safely from the available repository sources:

### 1. Unguarded third-party SDK initialization inside GT.Droid

Why not fixed:
- The app code exists only as recovered/decompiled artifacts here.
- Rewriting those methods again would repeat the exact risk that caused the crash regression.

### 2. `URLHelper.CheckNetworkState()` infinite wait loop in GT.Core

Why not fixed:
- The original managed source is not available as a supported build target in this repo.
- Binary patching that logic safely would require a more conservative assembly-preservation strategy than the current experimental path.

### 3. The stable descriptor-index-fixed build hang

Why not fixed:
- The callflow identifies plausible gates, but the exact hang point still needs fresh runtime instrumentation or device logs.

## Validation

The changes are intended to validate at the tool level:

- the dangerous C# patcher flags now fail fast,
- GT.Droid reinjection now requires an explicit unsafe opt-in,
- the safe descriptor-index-fixed GT.Core URL patch workflow remains available.

## Outcome

The known-bad workflow that produced the direct-crash regression is now blocked by default. The repository also now contains a startup trace that separates:

- loader/package failures,
- app-level startup stalls,
- backend/API failures.

That separation is the main operational improvement because it prevents future iterations from mixing unrelated failure classes into a single experiment.

## Recommended Next Investigation Step

Resume from the descriptor-index-fixed baseline and investigate the stable hang without changing GT.Droid method bodies. The next useful evidence would be runtime logs around:

- which first screen is actually navigated to,
- whether `LoginViewModel.Update()` or `QuickStartViewModel.Update()` runs,
- whether `URLHelper.CheckNetworkState()` is entered and loops,
- whether any third-party SDK throws before first-screen completion.