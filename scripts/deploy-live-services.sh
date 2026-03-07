#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INSTALL_ROOT="/opt/goaltactics"
DATA_ROOT="/mnt/website/goal_tactics"

mkdir -p "${INSTALL_ROOT}/api" "${INSTALL_ROOT}/worker"
mkdir -p "${INSTALL_ROOT}/bin"
install -d -o www-data -g www-data "${DATA_ROOT}/data" "${DATA_ROOT}/data-protection" "${DATA_ROOT}/logs" "${DATA_ROOT}/backup" "${DATA_ROOT}/tmp"

dotnet publish "${REPO_ROOT}/src/GoalTactics.Api/GoalTactics.Api.csproj" -c Release -o "${INSTALL_ROOT}/api"
dotnet publish "${REPO_ROOT}/src/GoalTactics.Worker/GoalTactics.Worker.csproj" -c Release -o "${INSTALL_ROOT}/worker"
install -m 0755 "${REPO_ROOT}/scripts/backup-goaltactics.sh" "${INSTALL_ROOT}/bin/backup-goaltactics.sh"

install -m 0644 "${REPO_ROOT}/deploy/systemd/goaltactics-api.service" /etc/systemd/system/goaltactics-api.service
install -m 0644 "${REPO_ROOT}/deploy/systemd/goaltactics-worker.service" /etc/systemd/system/goaltactics-worker.service
install -m 0644 "${REPO_ROOT}/deploy/systemd/goaltactics-backup.service" /etc/systemd/system/goaltactics-backup.service
install -m 0644 "${REPO_ROOT}/deploy/systemd/goaltactics-backup.timer" /etc/systemd/system/goaltactics-backup.timer
install -m 0644 "${REPO_ROOT}/deploy/logrotate/goaltactics" /etc/logrotate.d/goaltactics

systemctl daemon-reload
systemctl enable goaltactics-api.service goaltactics-worker.service goaltactics-backup.timer
systemctl restart goaltactics-api.service
systemctl restart goaltactics-worker.service
systemctl restart goaltactics-backup.timer