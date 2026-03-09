# Goal Tactics Device Validation Report (Attempt 15-18)

Date: 2026-03-09
Device: `10.8.0.2:39719`
Objective: Launch and stabilize the app on a connected device, capture runtime/network evidence under `tmp/`, and iterate fixes until app startup works.

## 1. Outcome

Final status: **working startup confirmed**.

Evidence:
- Launch completed successfully:
  - `tmp/attempt18/launch.out`
  - `Status: ok`, `LaunchState: COLD`, `Activity: ...MainActivity`
- Process alive after startup wait window:
  - `tmp/attempt18/pid.txt` -> `26474`
  - `tmp/attempt18/pid_after_capture.txt` -> `26474`
- No startup crash signatures in filtered log:
  - `tmp/attempt18/logcat_crash_filtered.txt` (empty)
- UI dump shows app UI (not launcher), including in-app popup:
  - `tmp/attempt18/ui.xml`

## 2. Attempt Timeline

### Attempt 15

APK:
- `tmp/goaltactics-patched-signed.apk`

Result:
- Crash on startup.

Primary error:
- `FacebookSdkNotInitializedException`
- `Unable to start activity ... MainActivity`

Evidence:
- `tmp/attempt15/logcat_full.txt`
- `tmp/attempt15/pid.txt` (empty)

### Attempt 16

Change made before run:
- Removed explicit GT.Droid replacement of literal `1498fe489` from patch tool.

Result:
- Still crashed with same Facebook SDK initialization exception.

Evidence:
- `tmp/attempt16/logcat_full.txt`
- `tmp/attempt16/pid.txt` (empty)

### Attempt 17

Change made before run:
- Rebuilt from clean `assemblies.blob.original` with conservative GT.Core-only host patch.

Result:
- Still crashed with same Facebook SDK initialization exception.

Evidence:
- `tmp/attempt17/logcat_full.txt`
- `tmp/attempt17/pid.txt` (empty)

### Attempt 18 (successful)

Critical fix:
- Restored `analysis/phase3_compat/apk_dec/AndroidManifest.xml` from canonical recovered manifest:
  - source: `Goal Tactics app/android_project/AndroidManifest.xml`
- Rebuilt from clean `assemblies.blob.original` with conservative GT.Core host patch.

Result:
- Startup succeeded and app remained running.

Evidence:
- `tmp/attempt18/launch.out`
- `tmp/attempt18/pid.txt`
- `tmp/attempt18/pid_after_capture.txt`
- `tmp/attempt18/logcat_crash_filtered.txt`
- `tmp/attempt18/ui.xml`
- `tmp/attempt18/screen_after_launch.png`

## 3. Root Cause Analysis

There were two independent startup-break paths discovered during this run:

1. Earlier GT.Droid literal stripping introduced SDK init regressions.
- Prior failures included Helpshift credential validation crashes.
- Later failures showed Facebook SDK not initialized.

2. Manifest drift in decoded build tree.
- Active manifest (`analysis/phase3_compat/apk_dec/AndroidManifest.xml`) had become minimal and missed required SDK metadata/providers/activities.
- Missing Facebook entries caused deterministic `FacebookSdkNotInitializedException` during `MainActivity` service registration.
- Restoring canonical manifest resolved the startup crash.

## 4. Fixes Applied

### Code/tooling changes

File:
- `tools/patch_xamarin_assembly_store_urls.py`

Changes during this cycle:
- Removed GT.Droid replacement of `1498fe489` (Facebook-related literal) to avoid direct corruption.
- Kept earlier safety change preserving Helpshift app-id/api-key literals.

### Build-input restoration

File replaced:
- `analysis/phase3_compat/apk_dec/AndroidManifest.xml`
- Source used: `Goal Tactics app/android_project/AndroidManifest.xml`

### APK build used for successful launch

Artifact:
- `tmp/attempt18/goaltactics-signed.apk`

Rebuild flow:
1. Patch clean blob from `assemblies.blob.original` -> `tmp/attempt18/assemblies.blob.patched`
2. Copy patched blob into decoded tree
3. `apktool b --use-aapt2 ...`
4. `zipalign`
5. `apksigner` and verify
6. `adb install -r`

## 5. Captured Diagnostics (Attempt 18)

Logs:
- full logcat: `tmp/attempt18/logcat_full.txt`
- focused subset: `tmp/attempt18/logcat_focus.txt`
- crash-only subset: `tmp/attempt18/logcat_crash_filtered.txt`

Network:
- pcap: `tmp/attempt18/phone_any.pcap`
- tcpdump stats: `tmp/attempt18/tcpdump_stderr.txt`
- destination summary: `tmp/attempt18/dst_ips_80_443.txt`

Sockets / UID:
- package UID: `tmp/attempt18/pkg_uid_cmd.txt`
- UID-filtered IPv6 sockets: `tmp/attempt18/uid_tcp6_lines.txt`
- UID-filtered IPv4 sockets: `tmp/attempt18/uid_tcp_lines.txt`

UI / visual:
- UI dump: `tmp/attempt18/ui.xml`
- screenshot: `tmp/attempt18/screen_after_launch.png`

## 6. Residual Notes

- Startup is now stable in this run.
- The app currently displays an in-app error popup (`Oops! Something went wrong.`) visible in UI dump, indicating runtime/backend-flow issues may remain beyond startup.
- Third-party outbound traffic is still visible in destination summary and was not eliminated in this stabilization pass.

## 7. Recommendation for next pass

1. Keep this manifest restoration as baseline (do not revert to stripped manifest).
2. Continue runtime functional debugging from this stable startup point.
3. If backend-only traffic remains required, apply targeted runtime-safe reductions incrementally and validate after each change with the same `tmp/attemptXX` capture pattern.
