#!/usr/bin/env bash
# ──────────────────────────────────────────────────────────────────
# deploy-live-services.sh — Deploy GoalTactics to production
#
# Uses a SINGLE unified systemd service that manages API, Bots,
# and Backup in one process tree.  Replaces the old multi-service
# setup (goaltactics-api, goaltactics-worker, goaltactics-backup).
# ──────────────────────────────────────────────────────────────────
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INSTALL_ROOT="/opt/goaltactics"
DATA_ROOT="/mnt/website/goal_tactics"

echo "═══  GoalTactics Deployment  ═══"

# ── Directories ──────────────────────────────────────────────────
mkdir -p "${INSTALL_ROOT}/api" "${INSTALL_ROOT}/bots" "${INSTALL_ROOT}/bin" "${INSTALL_ROOT}/admin-panel"
install -d -o www-data -g www-data \
    "${DATA_ROOT}/data" \
    "${DATA_ROOT}/data-protection" \
    "${DATA_ROOT}/logs" \
    "${DATA_ROOT}/backup" \
    "${DATA_ROOT}/saves" \
    "${DATA_ROOT}/tmp"

# ── Build .NET ───────────────────────────────────────────────────
echo "[1] Publishing API (includes Worker jobs)..."
dotnet publish "${REPO_ROOT}/src/GoalTactics.Api/GoalTactics.Api.csproj" -c Release -o "${INSTALL_ROOT}/api"

echo "[2] Publishing Bots..."
dotnet publish "${REPO_ROOT}/bots/GoalTacticsBots.csproj" -c Release -o "${INSTALL_ROOT}/bots"

# ── Install scripts ──────────────────────────────────────────────
echo "[3] Installing scripts..."
install -m 0755 "${REPO_ROOT}/scripts/goaltactics-wrapper.sh" "${INSTALL_ROOT}/bin/goaltactics-wrapper.sh"
install -m 0755 "${REPO_ROOT}/scripts/backup-goaltactics.sh" "${INSTALL_ROOT}/bin/backup-goaltactics.sh"
install -m 0755 "${REPO_ROOT}/scripts/restore-goaltactics.sh" "${INSTALL_ROOT}/bin/restore-goaltactics.sh"
install -m 0755 "${REPO_ROOT}/scripts/admin.py" "${INSTALL_ROOT}/bin/admin.py"

# ── Admin panel ──────────────────────────────────────────────────
echo "[4] Installing admin panel..."
cp -r "${REPO_ROOT}/admin-panel/"* "${INSTALL_ROOT}/admin-panel/"
if [ ! -d "${INSTALL_ROOT}/admin-panel/venv" ]; then
    python3 -m venv "${INSTALL_ROOT}/admin-panel/venv"
fi
"${INSTALL_ROOT}/admin-panel/venv/bin/pip" install -q -r "${INSTALL_ROOT}/admin-panel/requirements.txt"
chown -R www-data:www-data "${INSTALL_ROOT}/admin-panel"

# ── Remove old split services ────────────────────────────────────
echo "[5] Removing old split services..."
for svc in goaltactics-api.service goaltactics-worker.service goaltactics-backup.service goaltactics-backup.timer; do
    systemctl stop "${svc}" 2>/dev/null || true
    systemctl disable "${svc}" 2>/dev/null || true
    rm -f "/etc/systemd/system/${svc}" 2>/dev/null || true
done

# ── Install unified service ─────────────────────────────────────
echo "[6] Installing unified systemd service..."
install -m 0644 "${REPO_ROOT}/deploy/systemd/goaltactics.service" /etc/systemd/system/goaltactics.service
install -m 0644 "${REPO_ROOT}/deploy/systemd/goaltactics-admin-panel.service" /etc/systemd/system/goaltactics-admin-panel.service
install -m 0644 "${REPO_ROOT}/deploy/logrotate/goaltactics" /etc/logrotate.d/goaltactics

systemctl daemon-reload

# ── Start ────────────────────────────────────────────────────────
echo "[7] Starting services..."
systemctl enable goaltactics.service goaltactics-admin-panel.service
systemctl restart goaltactics.service
systemctl restart goaltactics-admin-panel.service

echo "═══  Deployment complete  ═══"
echo "  Admin CLI: python3 ${INSTALL_ROOT}/bin/admin.py"
echo "  Admin Web: https://gt.nikolai-linschmann.de/"
echo "  Logs:      ${DATA_ROOT}/logs/"