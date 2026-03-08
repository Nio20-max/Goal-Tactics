# Phase 3 Compat Attempt 01

Date: 2026-03-08

## What failed

The first smoke run did not prove that the app launched successfully after install.

## Why it failed

- The smoke script launched the wrong Android package: `de.goaltactics.app`.
- The APK manifest resolves the actual Xamarin launcher to `com.xyrality.goaltactics/crc645877ad3d44b9b81b.MainActivity`.
- Because the script used `monkey` with `|| true`, a bad launch target could be masked while the summary still reported success.

## What I will do next

- Fix the smoke script to resolve and start the real launcher activity explicitly.
- Re-run the install and launch flow with fresh logcat capture.
- Use the second attempt to determine whether the remaining problem is a startup hang, a runtime crash, or a backend/UI issue.