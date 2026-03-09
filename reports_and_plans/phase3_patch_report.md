# Phase 3: Xamarin client backend redirection — Investigation & Fix

Date: 2026-03-09

## Executive summary

- Objective: Patch the recovered Xamarin Android client (`GT.Core`) so all backend traffic is redirected to `gt.nikolai-linschmann.de` and verify full login flow end-to-end.
- Outcome: Fixed a subtle URL-padding bug in the assembly-store patching tool that caused the managed Mono HTTP client to construct invalid request paths (leading `////` segments). After switching to dot-segment padding (`../` and `./`) and rebuilding the assemblies blob and APK, the app successfully contacted the backend and login/registration flows worked.

## Background and symptoms

- Rebuilt APK was installed on a device but immediately showed `"Oops! Something went wrong"` and no managed API calls reached the server (tcpdump and nginx logs showed zero requests from the Mono-managed layer). Only Java/SDK requests (AppsFlyer/Nextcloud) were visible.
- Mono TLS/debug logs showed no TLS activity — the failure was before any TCP/TLS handshake.

## Root cause

- The assembly-store URL patcher replaced original longer URLs with the custom host. To preserve fixed string-lengths in the binary, it padded shorter replacements using the `/` character. That produced literal strings like:

```
https://gt.nikolai-linschmann.de////api/Authentication
```

- .NET's `Uri` preserves consecutive slashes in the path portion; `new Uri("https://host////api/").AbsolutePath` yields `////api/` (slashes not normalized). Refit in the client concatenates `BaseAddress.AbsolutePath` with route `RelativePath` (string concat), resulting in request-targets like `////api/Authentication/Login` which did not match nginx `location /api/` (and in practice caused the Mono HTTP stack to never establish a connection).

## Fix applied

1. Use dot-segment padding instead of slash padding:
   - Inserted `../` and `./` segments to bring replacement strings to the original byte-length while relying on `Uri` normalization to remove them.
   - Example: `https://gt.nikolai-linschmann.de/././api/` normalizes to `/api/`.

2. Implemented the change in `tools/patch_xamarin_assembly_store_urls.py`:
   - Added `pad_url_with_dots()` and helpers to build exact-length dot-segment padding.
   - Replaced previous `/` padding calls with dot-segment-aware replacements for both UTF-8 and UTF-16LE literals.

3. Rebuilt the Xamarin assembly blob and APK using the usual workflow (apktool rebuild + zipalign + apksigner) and installed the updated APK on device.

4. Backend compatibility updates: made DTOs accept legacy client field names and emit legacy response fields (to fully interoperate with the decompiled client):
   - `RegisterRequest` now accepts `Login` and `TeamName` (and exposes `ResolvedEmail` / `ResolvedManagerName`).
   - `RegisterResponse` includes `Status`, `ErrorMessage`, `Login`, `Punishment` fields for legacy consumers.
   - `AuthService.RegisterAsync` updated to use the resolved fields and populate legacy response fields.

## Files changed (key)

- tools/patch_xamarin_assembly_store_urls.py — new dot-segment padding logic (`pad_url_with_dots`, `_build_dot_padding`) and patched-replacement flow
- analysis/phase3_compat/apk_dec/unknown/assemblies/assemblies.blob — rebuilt with patched GT.Core (artifact produced during rebuild)
- analysis/phase3_compat/GoalTactics-dotseg-aligned.apk — rebuilt APK (signed debug)
- src/GoalTactics.Contracts/Auth/RegisterRequest.cs — accept `Login` and `TeamName`, validation
- src/GoalTactics.Contracts/Auth/RegisterResponse.cs — legacy response fields
- src/GoalTactics.Application/Auth/AuthService.cs — RegisterAsync updated to use resolved fields and populate legacy response

Note: the full change set is in the repository history (this commit).

## Reproduction & verification steps (what I ran)

1. Rebuild assembly blob with the patched tool (example):

```bash
python tools/patch_xamarin_assembly_store_urls.py \
  --blob analysis/phase3_compat/apk_dec/unknown/assemblies/assemblies.blob.original \
  --manifest analysis/phase3_compat/apk_dec/unknown/assemblies/assemblies.manifest \
  --host gt.nikolai-linschmann.de \
  --out analysis/phase3_compat/apk_dec/unknown/assemblies/assemblies.blob
```

2. Rebuild APK from decoded tree:

```bash
cd analysis/phase3_compat
apktool b apk_dec --use-aapt2 -o GoalTactics-dotseg-unsigned.apk
zipalign -f 4 GoalTactics-dotseg-unsigned.apk GoalTactics-dotseg-aligned.apk
apksigner sign --ks ~/.android/debug.keystore --ks-pass pass:android GoalTactics-dotseg-aligned.apk
adb install -r GoalTactics-dotseg-aligned.apk
```

3. Launch app, monitor server logs and tcpdump:

```bash
sudo tcpdump -i wg0 'tcp port 443' -nn
adb shell am start -n com.xyrality.goaltactics/crc645877ad3d44b9b81b.MainActivity
tail -f /var/log/nginx/access.log
```

Expected: server receives calls like `POST /api/Common/GetCountries` and `GET /api/Common/GetVersion` and they return 200.

## Test results observed

- `POST /api/Common/GetCountries` → HTTP 200
- `GET /api/Common/GetVersion` → HTTP 200
- Registration with legacy fields (`Login`, `TeamName`) succeeded and returned 200 and `status: 1`.
- Login using `Login` field succeeded and returned JWT token and `status: 1`.

## Notes & recommendations

- Avoid using literal-slash padding when patching fixed-width string constants — prefer dot-segment padding or exact-length replacements to ensure `Uri` normalization produces valid paths.
- When changing string constants in compressed assembly images, always ensure compressed size <= original compressed size; the script enforces this and will error otherwise.
- Keep a copy of the original `assemblies.blob` and the manifest close to every iteration for auditability.

## Artifacts & locations

- Patched blob: `analysis/phase3_compat/apk_dec/unknown/assemblies/assemblies.blob` (rewritten)
- Signed APK: `analysis/phase3_compat/GoalTactics-dotseg-aligned.apk`
- Report (this file): `reports_and_plans/phase3_patch_report.md`

## Next steps

1. Run a few end-to-end user flows on the device (registration, login, match flow) and collect full logcat + tcpdump traces for later regression checks.
2. Consider further hardening: add verbose managed logging in `GT.Core` (re-enable Log.Info/Log.Error) or patch a temporary diagnostic endpoint to ensure visibility.

---

Prepared by: automated agent (operation performed on 2026-03-09)
