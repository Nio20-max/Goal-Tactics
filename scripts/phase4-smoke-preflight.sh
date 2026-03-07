#!/usr/bin/env bash
set -euo pipefail

HOST="${1:-https://gt.nikolai-linschmann.de}"
APK_PATH="${2:-analysis/phase3_compat/out/GoalTactics-compat-debug.apk}"

echo "[1/6] Host preflight: $HOST"

health_status=$(curl -skS -o /tmp/gt_phase4_health.out -w "%{http_code}" "$HOST/health")
echo "health status: $health_status"
cat /tmp/gt_phase4_health.out || true

auth_status=$(curl -skS -o /tmp/gt_phase4_login.out -w "%{http_code}" -H 'Content-Type: application/json' -d '{}' "$HOST/api/Login")
echo "api login probe status: $auth_status"

legacy_status=$(curl -skS -o /tmp/gt_phase4_legacy_login.out -w "%{http_code}" -H 'Content-Type: application/json' -d '{}' "$HOST/GameEngine/Login")
echo "legacy login probe status: $legacy_status"

chat_status=$(curl --http1.1 -skS -o /tmp/gt_phase4_chat.out -w "%{http_code}" \
  -H 'Connection: Upgrade' \
  -H 'Upgrade: websocket' \
  -H 'Sec-WebSocket-Version: 13' \
  -H 'Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==' \
  "$HOST/chat" || true)
echo "chat hub probe status: $chat_status"

auc_status=$(curl --http1.1 -skS -o /tmp/gt_phase4_auc.out -w "%{http_code}" \
  -H 'Connection: Upgrade' \
  -H 'Upgrade: websocket' \
  -H 'Sec-WebSocket-Version: 13' \
  -H 'Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==' \
  "$HOST/auc" || true)
echo "auc hub probe status: $auc_status"

echo "[2/6] Device check"
if ! command -v adb >/dev/null 2>&1; then
  echo "ERROR: adb not installed"
  exit 1
fi

adb start-server >/dev/null
if [[ -z "$(adb devices | awk 'NR>1 && $2=="device" {print $1}')" ]]; then
  echo "ERROR: no connected Android device/emulator in adb"
  echo "Attach a device or start an emulator, then re-run this script."
  exit 2
fi

echo "[3/6] Installing APK: $APK_PATH"
adb install -r "$APK_PATH"

echo "[4/6] Launching app"
adb shell monkey -p de.goaltactics.app 1 >/tmp/gt_phase4_monkey.out 2>&1 || true

sleep 8

echo "[5/6] Capturing focused logs"
adb logcat -d | grep -Ei "goaltactics|signalr|websocket|auth|login|exception|error" | tail -n 200 > /tmp/gt_phase4_logcat_tail.txt || true

echo "[6/6] Summary"
echo "- Host health status: $health_status (expected 200)"
echo "- /api/Login probe: $auth_status (expected 400 for empty payload indicates endpoint exists)"
echo "- /GameEngine/Login probe: $legacy_status (expected 400 for empty payload indicates rewrite works)"
echo "- /chat hub probe: $chat_status (expected 401/403 before auth)"
echo "- /auc hub probe: $auc_status (expected 401/403 before auth)"
echo "- Device install/launch completed"
echo "- Logs: /tmp/gt_phase4_logcat_tail.txt"
