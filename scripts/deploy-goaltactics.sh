#!/usr/bin/env bash
# ──────────────────────────────────────────────────────────────────
# deploy-goaltactics.sh — Full deployment script for GoalTactics
#
# Publishes API + Worker + Bots + Admin Panel, installs the unified
# systemd service, configures backup and logging, and starts everything.
#
# Run as root from the repository root.
# ──────────────────────────────────────────────────────────────────
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INSTALL_ROOT="/opt/goaltactics"
DATA_ROOT="/mnt/website/goal_tactics"

echo "═══════════════════════════════════════════════"
echo "  GoalTactics Deployment"
echo "═══════════════════════════════════════════════"
echo "  Repository:    ${REPO_ROOT}"
echo "  Install root:  ${INSTALL_ROOT}"
echo "  Data root:     ${DATA_ROOT}"
echo

# ── 1. Create directories ───────────────────────────────────────
echo "[1/8] Creating directories..."
mkdir -p "${INSTALL_ROOT}/api" "${INSTALL_ROOT}/bots" "${INSTALL_ROOT}/bin" "${INSTALL_ROOT}/admin-panel"
install -d -o www-data -g www-data \
    "${DATA_ROOT}/data" \
    "${DATA_ROOT}/data-protection" \
    "${DATA_ROOT}/logs" \
    "${DATA_ROOT}/backup" \
    "${DATA_ROOT}/saves" \
    "${DATA_ROOT}/tmp"

# ── 2. Build and publish .NET projects ──────────────────────────
echo "[2/8] Publishing .NET projects..."
dotnet publish "${REPO_ROOT}/src/GoalTactics.Api/GoalTactics.Api.csproj" -c Release -o "${INSTALL_ROOT}/api/"
dotnet publish "${REPO_ROOT}/bots/GoalTacticsBots.csproj" -c Release -o "${INSTALL_ROOT}/bots/"
echo "  .NET projects published."

# ── 3. Install scripts ──────────────────────────────────────────
echo "[3/8] Installing scripts..."
install -m 0755 "${REPO_ROOT}/scripts/goaltactics-wrapper.sh" "${INSTALL_ROOT}/bin/goaltactics-wrapper.sh"
install -m 0755 "${REPO_ROOT}/scripts/backup-goaltactics.sh" "${INSTALL_ROOT}/bin/backup-goaltactics.sh"
install -m 0755 "${REPO_ROOT}/scripts/restore-goaltactics.sh" "${INSTALL_ROOT}/bin/restore-goaltactics.sh"
install -m 0755 "${REPO_ROOT}/scripts/admin.py" "${INSTALL_ROOT}/bin/admin.py"
echo "  Scripts installed."

# ── 4. Install admin panel ──────────────────────────────────────
echo "[4/8] Installing admin panel..."
cp -r "${REPO_ROOT}/admin-panel/"* "${INSTALL_ROOT}/admin-panel/"
if [ ! -d "${INSTALL_ROOT}/admin-panel/venv" ]; then
    python3 -m venv "${INSTALL_ROOT}/admin-panel/venv"
fi
"${INSTALL_ROOT}/admin-panel/venv/bin/pip" install -q -r "${INSTALL_ROOT}/admin-panel/requirements.txt"
chown -R www-data:www-data "${INSTALL_ROOT}/admin-panel"
echo "  Admin panel installed."

# ── 5. Stop old services (if running) ───────────────────────────
echo "[5/8] Stopping old services..."
systemctl stop goaltactics-api.service 2>/dev/null || true
systemctl stop goaltactics-worker.service 2>/dev/null || true
systemctl stop goaltactics-backup.timer 2>/dev/null || true
systemctl stop goaltactics.service 2>/dev/null || true
systemctl stop goaltactics-admin-panel.service 2>/dev/null || true
systemctl disable goaltactics-api.service 2>/dev/null || true
systemctl disable goaltactics-worker.service 2>/dev/null || true
systemctl disable goaltactics-backup.timer 2>/dev/null || true
echo "  Old services stopped."

# ── 6. Install systemd units ────────────────────────────────────
echo "[6/8] Installing systemd units..."
install -m 0644 "${REPO_ROOT}/deploy/systemd/goaltactics.service" /etc/systemd/system/goaltactics.service
install -m 0644 "${REPO_ROOT}/deploy/systemd/goaltactics-admin-panel.service" /etc/systemd/system/goaltactics-admin-panel.service
install -m 0644 "${REPO_ROOT}/deploy/logrotate/goaltactics" /etc/logrotate.d/goaltactics
systemctl daemon-reload
echo "  Systemd units installed."

# ── 7. Enable and start services ────────────────────────────────
echo "[7/8] Starting services..."
systemctl enable goaltactics.service goaltactics-admin-panel.service
systemctl start goaltactics.service
systemctl start goaltactics-admin-panel.service
echo "  Services started."

# ── 8. Verify ───────────────────────────────────────────────────
echo "[8/8] Verifying..."
sleep 5
echo "  GoalTactics service:"
systemctl is-active goaltactics.service --quiet && echo "    ✓ active" || echo "    ✗ NOT active"
echo "  Admin panel:"
systemctl is-active goaltactics-admin-panel.service --quiet && echo "    ✓ active" || echo "    ✗ NOT active"

# Wait for API to come up
echo "  Waiting for API health..."
for i in $(seq 1 30); do
    if curl -sf http://127.0.0.1:5195/health >/dev/null 2>&1; then
        echo "    ✓ API healthy"
        break
    fi
    sleep 1
done

echo
echo "═══════════════════════════════════════════════"
echo "  Deployment complete!"
echo ""
echo "  Admin CLI:  python3 ${INSTALL_ROOT}/bin/admin.py"
echo "  Admin Web:  https://gt.nikolai-linschmann.de/"
echo "  API Health: https://gt.nikolai-linschmann.de/health"
echo "  Logs:       ${DATA_ROOT}/logs/"
echo "  Backups:    ${DATA_ROOT}/backup/"
echo "  Saves:      ${DATA_ROOT}/saves/"
echo "═══════════════════════════════════════════════"
