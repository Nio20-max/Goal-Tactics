#!/usr/bin/env bash
set -euo pipefail

SRC_DB="/mnt/website/goal_tactics/data/goaltactics.db"
BACKUP_DIR="/mnt/website/goal_tactics/backup"
TMP_DIR="/mnt/website/goal_tactics/tmp"
STAMP="$(date -u +%Y%m%dT%H%M%SZ)"
OUT_DB="${BACKUP_DIR}/goaltactics_${STAMP}.db"
OUT_GZ="${OUT_DB}.gz"

mkdir -p "${BACKUP_DIR}" "${TMP_DIR}"

if [[ ! -f "${SRC_DB}" ]]; then
  echo "source db not found: ${SRC_DB}" >&2
  exit 1
fi

OUT_DB="${OUT_DB}" python3 - <<'PY'
import os
import sqlite3
src = "/mnt/website/goal_tactics/data/goaltactics.db"
out = os.environ["OUT_DB"]
con_src = sqlite3.connect(src)
con_out = sqlite3.connect(out)
with con_out:
    con_src.backup(con_out)
con_out.close()
con_src.close()
PY

gzip -f "${OUT_DB}"

# Keep backups lean while still allowing day-scale rollback: retain last 288 snapshots (24h at 5m interval)
ls -1t "${BACKUP_DIR}"/goaltactics_*.db.gz 2>/dev/null | tail -n +289 | xargs -r rm -f

echo "backup written: ${OUT_GZ}"
