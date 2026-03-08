# Goal Tactics APK Forensic Report (Offline Re-audit)

Date: 2026-03-08
Scope: Re-audit of existing logs/captures after device disconnect. No new on-device runtime test in this pass.

## 1. Executive Summary

The current failure mode is a startup regression introduced by aggressive third-party credential neutralization in GT.Droid payload patching.

- What failed:
  - Variants from later attempts crash during `MainActivity.onCreate` with `com.helpshift.exceptions.InstallException` (invalid app id).
- What worked:
  - Earlier variants launched successfully to visible `MainActivity` and remained alive long enough for interaction and network capture.
- What remains unresolved:
  - Backend-only traffic was not proven in prior captures; third-party destinations still dominated observed outbound connections.

## 2. Evidence Reviewed

Primary artifacts reviewed in this audit:

- Install success
  - `tmp/attempt10_install.out`
- Stable-launch era logs
  - `tmp/attempt8b_logcat_filtered.txt`
- Crash-era logs
  - `tmp/attempt12_logcat_crash_filtered.txt`
  - `tmp/attempt12b_logcat_filtered.txt`
  - `tmp/attempt13_logcat_filtered.txt`
  - `tmp/attempt14_logcat_focus.txt`
- Network destination summaries
  - `tmp/attempt11_dst_ips.txt`
  - `tmp/attempt11_to_publichost_packets.txt`
  - `tmp/attempt12_idle_dst_ips.txt`
- Server-side access tail
  - `tmp/attempt10_nginx_tail_filtered.txt`

## 3. What Failed

### 3.1 Deterministic startup crash in patched variants

Observed repeatedly:

- `java.lang.RuntimeException: Unable to start activity ... MainActivity`
- Caused by:
  - `com.helpshift.exceptions.InstallException: The app id used in the Core.install(application, apiKey, domain, appId) is not valid!`
- Stack evidence includes:
  - `com.helpshift.util.SchemaUtil.validateInstallCredentials`
  - `com.helpshift.Core.install`
  - `com.helpshift.xamarin.HelpshiftCore.install`
  - `crc645877ad3d44b9b81b.MainActivity.n_onCreate`

Source: `tmp/attempt12b_logcat_filtered.txt` (also repeated in attempts 13/14).

### 3.2 Backend-path validation not demonstrated in captures

During prior packet windows, destination distributions were dominated by non-target hosts/IPs. Example destination sets in summaries:

- `tmp/attempt11_dst_ips.txt`
- `tmp/attempt12_idle_dst_ips.txt`

Direct packet evidence to expected backend target remained absent/inconclusive in these sampled windows.

### 3.3 Server log noise from unrelated clients

`tmp/attempt10_nginx_tail_filtered.txt` primarily shows unrelated Nextcloud traffic patterns and does not prove Goal Tactics app requests in that interval.

## 4. What Worked

### 4.1 APK installation pipeline remained functional

Incremental install succeeded (`Success`) in tested run.

Source: `tmp/attempt10_install.out`.

### 4.2 Earlier patched variants reached and sustained `MainActivity`

In older run logs, app process start, activity transitions, focused window assignment, and main window draw completed successfully without immediate fatal crash.

Source: `tmp/attempt8b_logcat_filtered.txt`.

## 5. Root Cause Assessment

Most likely regression trigger:

- Third-party stripping logic replaced Helpshift credentials with syntactically invalid values.
- Helpshift performs credential validation during startup in `MainActivity.onCreate`.
- Invalid credentials cause a fatal exception before gameplay/backend flows can progress.

Confidence: high (stack trace directly points to credential validation failure).

## 6. Risk Register (What Might Fail Next)

1. Startup-blocking regressions from over-aggressive literal replacement
- Any replacement affecting startup-critical SDK initialization can cause hard crash before app UI/network flow.

2. False confidence from server tail checks
- Shared nginx logs can include unrelated clients; lack of app-specific filtering can mask true app behavior.

3. “Backend-only” objective still unmet
- Even with startup fixed, SDK init paths may continue opening third-party sockets unless calls are bypassed or host resolution is redirected in a startup-safe way.

4. Static patch safety boundaries
- Assembly store constraints (fixed size/compression limits) can force conservative substitutions and limit deep behavioral changes.

## 7. Immediate Remediation Plan (Next Pass)

1. Remove crash trigger first
- Keep Helpshift startup credentials unchanged (or map only safe domain literal), avoid invalidating app-id/api-key fields.

2. Preserve third-party suppression where startup-safe
- Continue neutralizing non-critical telemetry/ad keys that do not crash app at boot.

3. Rebuild a fresh APK and produce an implementation report
- Document exact patch semantics and expected residual traffic risks.

4. Defer final network proof until device reconnect
- Re-run packet capture + UID socket attribution + server-side filtered logs in one synchronized window.

## 8. Conclusion

The primary blocker is now clear and reproducible: the app crashes at startup due to invalid Helpshift install credentials introduced by aggressive third-party patching. Earlier builds showed the app can launch when this startup path is not broken. The safest forward step is to revise patch behavior to preserve startup validity, rebuild, and then re-run network validation after the phone is connected again.
