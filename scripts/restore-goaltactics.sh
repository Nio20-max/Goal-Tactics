#!/usr/bin/env bash
set -euo pipefail

# Restore a GoalTactics SQLite backup to the production database location.
# Usage: restore-goaltactics.sh <backup-file.db.gz>

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <backup-file.db.gz>" >&2
  exit 1
fi

BACKUP_FILE="$1"
DEST_DB="/mnt/website/goal_tactics/data/goaltactics.db"
TMP_DIR="/mnt/website/goal_tactics/tmp"
TMP_RESTORED="${TMP_DIR}/goaltactics_restore_$$.db"

if [[ ! -f "${BACKUP_FILE}" ]]; then
  echo "Backup file not found: ${BACKUP_FILE}" >&2
  exit 1
fi

mkdir -p "${TMP_DIR}"

echo "Decompressing backup to temporary location..."
gunzip -c "${BACKUP_FILE}" > "${TMP_RESTORED}"

echo "Validating restored database integrity..."
INTEGRITY=$(sqlite3 "${TMP_RESTORED}" "PRAGMA integrity_check;" 2>&1)
if [[ "${INTEGRITY}" != "ok" ]]; then
  echo "Integrity check failed: ${INTEGRITY}" >&2
  rm -f "${TMP_RESTORED}"
  exit 1
fi

TABLE_COUNT=$(sqlite3 "${TMP_RESTORED}" "SELECT COUNT(*) FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%';" 2>&1)
if [[ "${TABLE_COUNT}" -eq 0 ]]; then
  echo "Restored database has no application tables" >&2
  rm -f "${TMP_RESTORED}"
  exit 1
fi

echo "Integrity OK (${TABLE_COUNT} tables). Replacing production database..."
cp "${TMP_RESTORED}" "${DEST_DB}"
rm -f "${TMP_RESTORED}"

echo "Restore complete: ${DEST_DB}"
