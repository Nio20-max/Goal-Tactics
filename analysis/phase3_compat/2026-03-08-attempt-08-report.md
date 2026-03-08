# 2026-03-08 Attempt 08 Report (network-path isolation)

## Goal
Prove whether the patched APK actually attempts any backend connection, independent of nginx access-log visibility.

## What I changed
- Created and used workspace-local temp folder: `tmp/` (no `/tmp` usage in this attempt).
- Performed packet-level captures (`tcpdump`) during app launch and interaction windows.
- Correlated with app-UID socket tables from device `/proc/net/tcp6`.
- Re-tested both patched variants:
  - `GoalTactics-compat-hostpatched-iphttp-debug.apk`
  - `GoalTactics-compat-hostpatched-slashsafe-debug.apk`

## Key evidence
- `tmp/attempt8b_10_8_0_2_80_443.pcap` (iphttp launch window):
  - No packets to `10.8.0.1:80/443`.
- `tmp/attempt9_to_backend.pcap` (focused QuickStart taps + text injection):
  - No packets to `10.8.0.1:80/443`.
- `tmp/attempt10_to_publichost.pcap` (slashsafe/HTTPS launch window):
  - No packets to `217.154.251.5:443/80`.
- App UID socket sample (UID `10583`):
  - Active destinations repeatedly observed: `20.57.103.21:443`, `57.144.244.141:443`.
  - No active sockets to `10.8.0.1` or `217.154.251.5` during sampled windows.
- nginx access log correlation (`10.8.0.2`):
  - Only unrelated Nextcloud traffic observed in test windows.

## Interpretation
- GT backend traffic is still not being initiated in the observed startup/onboarding state.
- This is now confirmed at packet level (not just nginx route matching).
- URL patch injection into GT.Core is present, but the backend call path is likely not reached yet (or is gated by a non-accessible UI action/state).

## Why this attempt failed to reach fully functional state
- Could not trigger the first backend-relevant action from the custom-rendered onboarding controls via ADB automation.
- Without triggering that action, app keeps emitting only third-party traffic and no GoalTactics backend requests.

## Next fix path
1. Add an on-device MITM visibility step (TLS SNI + destination attribution) to distinguish GoalTactics SDK calls from app flow calls in real time.
2. Perform one manual-assisted onboarding step on device (team name + country + start) while running packet capture and app-UID socket sampling.
3. If still no backend attempt, patch flow control in managed code path (QuickStart/start gating) to force first register/login call for compatibility testing.
