# Goal Tactics Remediation + Build Report

Date: 2026-03-08
Scope: Apply startup-safe remediation after forensic pass, then compile and sign a fresh APK artifact.

## 1. Changes Applied

### 1.1 Startup-safe fix in GT.Droid patch routine

File changed:
- `tools/patch_xamarin_assembly_store_urls.py`

Change summary:
- Removed GT.Droid replacements that altered Helpshift API key and Helpshift app id literals.
- Kept the Helpshift domain replacement and other non-critical third-party literal neutralization.

Why:
- Crash logs showed `InstallException` during `Core.install(...)` caused by invalid Helpshift app id at app startup.
- Keeping startup-critical credentials unchanged avoids immediate `MainActivity` crash while preserving the ability to reduce some third-party behavior.

## 2. Static Regression Check (Code-level)

Checked for likely new failure points introduced by this remediation:

- No syntax errors in modified Python patcher.
  - Command: `/root/projekte/Goal-Tactics/.venv/bin/python -m py_compile tools/patch_xamarin_assembly_store_urls.py`
  - Result: success.

- Risk addressed directly:
  - The specific credential rewrite path that produced invalid Helpshift install parameters is removed.

Residual static risks:
- Third-party SDK initialization callsites still execute at runtime (behavior now depends on runtime network/config responses).
- Full runtime proof still requires on-device launch after reconnect.

## 3. Assembly Store Rebuild

Command used:

```bash
/root/projekte/Goal-Tactics/.venv/bin/python tools/patch_xamarin_assembly_store_urls.py \
  --blob analysis/phase3_compat/apk_dec/unknown/assemblies/assemblies.blob \
  --manifest analysis/phase3_compat/apk_dec/unknown/assemblies/assemblies.manifest \
  --host gt.nikolai-linschmann.de \
  --strip-third-party \
  --allow-unsafe-gt-droid-payload \
  --out tmp/assemblies.blob.nothirdparty.safe
```

Outcome:
- Completed without compressed-size overflow error.
- Produced output blob: `tmp/assemblies.blob.nothirdparty.safe`

Then injected into decoded APK tree:
- Replaced: `analysis/phase3_compat/apk_dec/unknown/assemblies/assemblies.blob`

## 4. APK Build and Signing

### 4.1 Build

Initial attempt:
- `apktool b analysis/phase3_compat/apk_dec -o tmp/goaltactics-patched-unsigned.apk`
- Failed with `aapt` resource parse crash (`First type is not attr`).

Successful retry:
- `apktool b --use-aapt2 analysis/phase3_compat/apk_dec -o tmp/goaltactics-patched-unsigned.apk`
- Result: success.

### 4.2 Align + sign + verify

Commands:

```bash
zipalign -f 4 tmp/goaltactics-patched-unsigned.apk tmp/goaltactics-patched-aligned.apk
apksigner sign \
  --ks /root/.android/debug.keystore \
  --ks-key-alias androiddebugkey \
  --ks-pass pass:android \
  --key-pass pass:android \
  --out tmp/goaltactics-patched-signed.apk \
  tmp/goaltactics-patched-aligned.apk
apksigner verify --verbose --print-certs tmp/goaltactics-patched-signed.apk
```

Verification:
- `Verifies`
- v1/v2/v3 signature schemes: true

Output artifact:
- `tmp/goaltactics-patched-signed.apk`

## 5. What This Fixes

- Removes the known deterministic startup crash trigger introduced by invalid Helpshift credential replacement.
- Produces a new installable APK artifact built from updated remediation logic.

## 6. What Is Still Unverified (Device Offline)

- Runtime launch confirmation on phone for this exact APK.
- Network-level confirmation that outbound traffic is now reduced to desired backend-only set.

## 7. Next Runtime Validation Steps (When Device Reconnects)

1. Install `tmp/goaltactics-patched-signed.apk` and launch once from cold start.
2. Capture synchronized evidence window:
- app UID socket tables
- packet capture from device IP
- filtered server logs for Goal Tactics endpoints
3. Compare against pre-fix crash signature to confirm startup regression is gone.
4. Re-evaluate third-party destinations and decide whether deeper call-path bypass (beyond literal patching) is needed.
