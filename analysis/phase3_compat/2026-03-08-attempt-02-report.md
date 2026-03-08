# Phase 3 Compat Attempt 02

Date: 2026-03-08

## What failed

The second launch attempt reached the real Xamarin launcher activity, but Android reported `Status: timeout` and the app remained stuck behind the starting window.

## Why it failed

- The activity reached `RESUMED`, so this was not the earlier Mono/Xamarin loader crash.
- The activity dump showed only the splash window remaining visible.
- Focused logcat showed `ShellStartingWindow` throwing `Resources$NotFoundException` for `com.xyrality.goaltactics:drawable/splash_screen`.
- This run also used the older `analysis/phase3_compat/out/GoalTactics-compat-debug.apk` artifact, even though the crash regression report identifies `analysis/phase3_compat/out/GoalTactics-compat-debug-fixed.apk` as the last known safe baseline.

## What I will do next

- Switch the test workflow to `GoalTactics-compat-debug-fixed.apk` by default.
- Re-run install and launch on the fixed baseline.
- If the fixed build still stalls, separate startup-window packaging issues from app-level initialization hang evidence.