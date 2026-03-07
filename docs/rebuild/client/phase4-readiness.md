# Phase 4 Readiness Status

Date: 2026-03-07
Target host: `https://gt.nikolai-linschmann.de`

## Ready now
- Compatibility APK artifact exists: `analysis/phase3_compat/out/GoalTactics-compat-debug.apk`.
- Persistent backend service is installed and enabled:
- `goaltactics-api.service` at `/etc/systemd/system/goaltactics-api.service`
- bind address `http://127.0.0.1:5195`
- Public host routing for legacy client paths is active in nginx:
- `/api/*`
- `/GameEngine/*`
- `/chat`
- `/auc`
- Public host probes currently pass basic compatibility checks:
- `/health` returns `200` and `pong` payload.
- `/api/Login` returns `400` for empty payload (route reachable).
- `/GameEngine/Login` returns `400` for empty payload (legacy rewrite reachable).
- `/chat` and `/auc` websocket probes return `401` unauthenticated (hub path reachable).

## Not ready yet
- On-device smoke execution is blocked by missing runtime target:
- `adb devices` has no connected device.
- Android emulator CLI is not installed (`emulator` not found).
- Backend feature parity is not complete for all documented legacy routes yet.
- Some rewritten legacy endpoints still return `404` because corresponding modern endpoints are not implemented in the current API build.

## Operator run command
Run this once a device/emulator is available:

```bash
bash scripts/phase4-smoke-preflight.sh
```

Optional arguments:

```bash
bash scripts/phase4-smoke-preflight.sh https://gt.nikolai-linschmann.de analysis/phase3_compat/out/GoalTactics-compat-debug.apk
```

Service health checks:

```bash
systemctl is-active goaltactics-api.service
curl -skS https://gt.nikolai-linschmann.de/health
```

## Phase 4 gate recommendation
Treat Phase 4 as conditionally ready with two hard gates:
- Device availability gate: at least one connected Android target in `adb`.
- Backend parity gate: required gameplay endpoints for the smoke checklist return non-404 responses.
