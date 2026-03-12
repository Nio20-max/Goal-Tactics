#!/usr/bin/env bash
set -euo pipefail

# Integration test: validates backup and restore of a SQLite database.
# Creates a temp database, inserts data, backs it up, restores it, and verifies integrity.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEST_DIR="$(mktemp -d)"
trap 'rm -rf "${TEST_DIR}"' EXIT

SRC_DB="${TEST_DIR}/source.db"
BACKUP_DB="${TEST_DIR}/backup.db"
BACKUP_GZ="${BACKUP_DB}.gz"
RESTORED_DB="${TEST_DIR}/restored.db"

echo "=== Backup/Restore Integration Test ==="
echo "Working directory: ${TEST_DIR}"

# 1. Create a source database with realistic schema
echo "[1/6] Creating source database with test data..."
sqlite3 "${SRC_DB}" <<'SQL'
CREATE TABLE users (id TEXT PRIMARY KEY, name TEXT NOT NULL, email TEXT);
CREATE TABLE teams (id TEXT PRIMARY KEY, user_id TEXT NOT NULL, name TEXT NOT NULL, strength INTEGER DEFAULT 50);
CREATE TABLE league_matches (id TEXT PRIMARY KEY, home_team TEXT, away_team TEXT, home_score INTEGER, away_score INTEGER, is_played INTEGER DEFAULT 0);

INSERT INTO users VALUES ('u1', 'TestManager1', 'test1@example.com');
INSERT INTO users VALUES ('u2', 'TestManager2', 'test2@example.com');
INSERT INTO teams VALUES ('t1', 'u1', 'FC Test Alpha', 75);
INSERT INTO teams VALUES ('t2', 'u2', 'SC Test Beta', 68);
INSERT INTO league_matches VALUES ('m1', 't1', 't2', 2, 1, 1);
INSERT INTO league_matches VALUES ('m2', 't2', 't1', NULL, NULL, 0);
SQL

SRC_USERS=$(sqlite3 "${SRC_DB}" "SELECT COUNT(*) FROM users;")
SRC_TEAMS=$(sqlite3 "${SRC_DB}" "SELECT COUNT(*) FROM teams;")
SRC_MATCHES=$(sqlite3 "${SRC_DB}" "SELECT COUNT(*) FROM league_matches;")
echo "  Source: ${SRC_USERS} users, ${SRC_TEAMS} teams, ${SRC_MATCHES} matches"

# 2. Online backup using Python sqlite3.backup (same method as production)
echo "[2/6] Running online backup (Python sqlite3.backup)..."
python3 - <<PY
import sqlite3
src = sqlite3.connect("${SRC_DB}")
dst = sqlite3.connect("${BACKUP_DB}")
with dst:
    src.backup(dst)
dst.close()
src.close()
PY

if [[ ! -f "${BACKUP_DB}" ]]; then
  echo "FAIL: Backup database not created" >&2
  exit 1
fi
echo "  Backup created: $(stat -c%s "${BACKUP_DB}") bytes"

# 3. Compress with gzip (same as production)
echo "[3/6] Compressing backup..."
gzip -f "${BACKUP_DB}"
if [[ ! -f "${BACKUP_GZ}" ]]; then
  echo "FAIL: Gzip file not created" >&2
  exit 1
fi
echo "  Compressed: $(stat -c%s "${BACKUP_GZ}") bytes"

# 4. Decompress
echo "[4/6] Decompressing backup..."
gunzip -c "${BACKUP_GZ}" > "${RESTORED_DB}"
if [[ ! -f "${RESTORED_DB}" ]]; then
  echo "FAIL: Restored database not created" >&2
  exit 1
fi

# 5. Integrity check
echo "[5/6] Verifying restored database integrity..."
INTEGRITY=$(sqlite3 "${RESTORED_DB}" "PRAGMA integrity_check;")
if [[ "${INTEGRITY}" != "ok" ]]; then
  echo "FAIL: Integrity check failed: ${INTEGRITY}" >&2
  exit 1
fi
echo "  Integrity: OK"

# 6. Data verification
echo "[6/6] Verifying data consistency..."
RST_USERS=$(sqlite3 "${RESTORED_DB}" "SELECT COUNT(*) FROM users;")
RST_TEAMS=$(sqlite3 "${RESTORED_DB}" "SELECT COUNT(*) FROM teams;")
RST_MATCHES=$(sqlite3 "${RESTORED_DB}" "SELECT COUNT(*) FROM league_matches;")

ERRORS=0
if [[ "${RST_USERS}" != "${SRC_USERS}" ]]; then
  echo "  FAIL: User count mismatch (source=${SRC_USERS}, restored=${RST_USERS})" >&2
  ERRORS=$((ERRORS + 1))
fi
if [[ "${RST_TEAMS}" != "${SRC_TEAMS}" ]]; then
  echo "  FAIL: Team count mismatch (source=${SRC_TEAMS}, restored=${RST_TEAMS})" >&2
  ERRORS=$((ERRORS + 1))
fi
if [[ "${RST_MATCHES}" != "${SRC_MATCHES}" ]]; then
  echo "  FAIL: Match count mismatch (source=${SRC_MATCHES}, restored=${RST_MATCHES})" >&2
  ERRORS=$((ERRORS + 1))
fi

# Verify specific data values survived the round-trip
TEAM_NAME=$(sqlite3 "${RESTORED_DB}" "SELECT name FROM teams WHERE id='t1';")
if [[ "${TEAM_NAME}" != "FC Test Alpha" ]]; then
  echo "  FAIL: Team name mismatch (expected='FC Test Alpha', got='${TEAM_NAME}')" >&2
  ERRORS=$((ERRORS + 1))
fi

MATCH_SCORE=$(sqlite3 "${RESTORED_DB}" "SELECT home_score FROM league_matches WHERE id='m1';")
if [[ "${MATCH_SCORE}" != "2" ]]; then
  echo "  FAIL: Match score mismatch (expected=2, got='${MATCH_SCORE}')" >&2
  ERRORS=$((ERRORS + 1))
fi

UNPLAYED=$(sqlite3 "${RESTORED_DB}" "SELECT home_score IS NULL FROM league_matches WHERE id='m2';")
if [[ "${UNPLAYED}" != "1" ]]; then
  echo "  FAIL: Unplayed match should have NULL score" >&2
  ERRORS=$((ERRORS + 1))
fi

if [[ ${ERRORS} -gt 0 ]]; then
  echo ""
  echo "FAILED: ${ERRORS} verification error(s)"
  exit 1
fi

echo ""
echo "=== ALL CHECKS PASSED ==="
echo "  Backup method: Python sqlite3.backup (online, consistent)"
echo "  Compression:   gzip"
echo "  Data verified:  ${RST_USERS} users, ${RST_TEAMS} teams, ${RST_MATCHES} matches"
echo "  Integrity:      PRAGMA integrity_check = ok"
