# Phase 3 Compat Attempt 03

Date: 2026-03-08

## What failed

The fixed APK still did not complete a valid Xamarin startup.

## Why it failed

- A clean PID-scoped log capture showed the actual loader failure:
  `monodroid-assembly: Compressed assembly '<assembly_store>' is larger than when the application was built`.
- This means the issue is inside the rebuilt Xamarin assembly store payload, not in the original UI resources and not in backend routing.
- The rebuilt blobs in the workspace are larger than the original assembly store from `reference_materials/Goal Tactics.apk`.
- The patcher currently recompresses compressed entries when rebuilding, which can inflate the final payload even when no GT.Core URL replacement happened.

## What I will do next

- Change the patcher to preserve original compressed bytes for unchanged entries.
- Reject any rebuilt entry that exceeds the original compressed size budget.
- Rebuild a fresh APK using the original assembly store payload and test that baseline on-device.