# Goal Tactics Device Validation Report (Attempt 19)

Date: 2026-03-09
Device: `10.8.0.2:39719`
Objective: eliminate runtime calls to `in.appcenter.ms`, `launches.appsflyer.com`, and `graph.facebook.com`, and validate outbound traffic is constrained to `gt.nikolai-linschmann.de`.

## Outcome

Final status: **success with v3 patch set**.

Evidence summary:
- v3 APK installed and process stayed alive after launch:
  - `tmp/attempt19/install_v3.out`
  - `tmp/attempt19/launch_v3.out`
  - `tmp/attempt19/pid_v3.txt`
- Network capture for v3 contains only allowed backend domain hit:
  - `tmp/attempt19/domain_hits_from_host_pcap_v3.txt`
  - Content: `gt.nikolai-linschmann.de`
- UID-filtered socket snapshot maps to allowed host IP only:
  - `tmp/attempt19/uid_tcp6_lines_v3.txt`
  - Remote IP decodes to `217.154.251.5` (A record of `gt.nikolai-linschmann.de`)

## Timeline

### Baseline in this attempt
- Earlier attempt19 builds still showed forbidden domains in capture:
  - `tmp/attempt19/domain_hits_from_host_pcap.txt`
  - `tmp/attempt19/domain_hits_from_host_pcap_v2.txt`
- Hits present before final fix:
  - `in.appcenter.ms`
  - `ingest.appcenter.ms0`
  - `launches.appsflyer.com`

### Final remediation (v3)
- Patched AppsFlyer launch URL template in smali:
  - `analysis/phase3_compat/apk_dec/smali/com/appsflyer/internal/ac.smali`
  - Changed `https://%slaunches.%s/api/v` -> `https://gt.nikolai-linschmann.de/api/v`
- Patched AppCenter ingestion send path to no-op:
  - `analysis/phase3_compat/apk_dec/smali_classes2/com/microsoft/appcenter/ingestion/AppCenterIngestion.smali`
  - `sendAsync(...)` now returns `null` directly (prevents outbound ingestion call)

### Build used for final verification
- `tmp/attempt19/goaltactics-signed-v3.apk`

Build flow:
1. `apktool b --use-aapt2 analysis/phase3_compat/apk_dec -o tmp/attempt19/goaltactics-unsigned-v3.apk`
2. `zipalign -p -f 4 ...unsigned-v3.apk ...aligned-v3.apk`
3. `apksigner sign ... --out ...signed-v3.apk ...aligned-v3.apk`
4. `adb install -r ...signed-v3.apk`

## Final validation artifacts

- Install/launch:
  - `tmp/attempt19/install_v3.out`
  - `tmp/attempt19/launch_v3.out`
  - `tmp/attempt19/pid_v3.txt`
- Network:
  - `tmp/attempt19/host_any_v3.pcap`
  - `tmp/attempt19/domain_hits_from_host_pcap_v3.txt`
- Sockets:
  - `tmp/attempt19/pkg_uid_v3.txt`
  - `tmp/attempt19/proc_net_tcp6_v3.txt`
  - `tmp/attempt19/uid_tcp6_lines_v3.txt`

## Notes

- v3 launch had `Status: timeout` in `am start -W`, but app process remained running and stable (`pid` present).
- Runtime network evidence for v3 no longer includes AppCenter/AppsFlyer/Facebook host hits in the host-captured domain extraction.
