# Phase 3 Compat Attempt 06

Date: 2026-03-08

## What failed

The app still showed the startup popup `Oops! / Something went wrong.` after a long first-run wait, and no backend startup request from the app was observed in the correlation window.

## Why it failed

- I ran a 90+ second startup capture to account for slow first-load behavior.
- UI state confirmed the same popup remains present after the extended wait.
- PID-scoped logcat contained no managed/API exception details (only activity/window lifecycle events).
- Nginx access window for the same timeframe showed no Goal Tactics app startup calls (no `/api/*`, no `/GameEngine/*`, no `/chat`, no `/auc` from the device), which indicates failure can occur before HTTP request emission.
- This is consistent with a pre-request client-side failure path that is swallowed by retry logic and ends in generic popup fallback.

## What I will do next

- Test an `ip-http` hostpatch variant that forces all patched backend URLs to `http://10.8.0.1` to remove TLS/DNS uncertainty entirely.
- Re-run long-wait startup capture and verify whether app requests consistently reach nginx.
- If requests appear, patch backend contract gaps based on the first failing endpoint; if requests still do not appear, focus on client-side URL/runtime construction failures in GT.Core.
