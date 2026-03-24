#!/usr/bin/env bash
# ──────────────────────────────────────────────────────────────────
# GoalTactics unified wrapper — starts API, Bots, and Backup loop
# in a single process tree for systemd management.
# ──────────────────────────────────────────────────────────────────
set -euo pipefail

INSTALL_ROOT="/opt/goaltactics"
DATA_ROOT="/mnt/website/goal_tactics"
LOG_DIR="${DATA_ROOT}/logs"
SAVES_DIR="${DATA_ROOT}/saves"
BACKUP_DIR="${DATA_ROOT}/backup"
DB_PATH="${DATA_ROOT}/data/goaltactics.db"
BOT_DB_PATH="${DATA_ROOT}/data/bots.db"
SNAPSHOT_DIR="${DATA_ROOT}/simulations/snapshots"
SNAPSHOT_DB_PATH="${SNAPSHOT_DIR}/goaltactics_snapshot.db"
BOT_SNAPSHOT_DB_PATH="${SNAPSHOT_DIR}/bots_snapshot.db"
BOOTSTRAP_STATUS_PATH="${DATA_ROOT}/simulations/historical-bootstrap-status.json"
# Enable daily progression ticks during fast simulation mode, even if real UTC days don't advance.
export GT_SIMULATION_FORCE_DAY_TICK="1"
BACKUP_INTERVAL=300  # 5 minutes
API_HEALTH_TIMEOUT=60  # seconds to wait for API startup

# Ensure directories exist
mkdir -p "${DATA_ROOT}/data" "${DATA_ROOT}/data-protection" "${LOG_DIR}" \
         "${SAVES_DIR}" "${BACKUP_DIR}" "${DATA_ROOT}/tmp" "${SNAPSHOT_DIR}"

# ── Logging helpers ──────────────────────────────────────────────
log() {
    local ts
    ts="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
    echo "[${ts}] [wrapper] $*" | tee -a "${LOG_DIR}/wrapper.log"
}

# ── Child PID tracking ───────────────────────────────────────────
API_PID=""
BOT_PID=""
BACKUP_PID=""

cleanup() {
    log "Shutdown requested — stopping child processes..."
    for pid in $API_PID $BOT_PID $BACKUP_PID; do
        if [[ -n "$pid" ]] && kill -0 "$pid" 2>/dev/null; then
            kill -TERM "$pid" 2>/dev/null || true
        fi
    done
    # Give children a moment to stop gracefully
    sleep 2
    for pid in $API_PID $BOT_PID $BACKUP_PID; do
        if [[ -n "$pid" ]] && kill -0 "$pid" 2>/dev/null; then
            kill -KILL "$pid" 2>/dev/null || true
        fi
    done
    log "All children stopped. Wrapper exiting."
    exit 0
}

trap cleanup SIGTERM SIGINT SIGHUP

# ── Start API ────────────────────────────────────────────────────
log "Starting GoalTactics API..."
ASPNETCORE_URLS="http://127.0.0.1:5195" \
ASPNETCORE_ENVIRONMENT="Production" \
ConnectionStrings__Default="Data Source=${DB_PATH}" \
/usr/bin/dotnet "${INSTALL_ROOT}/api/GoalTactics.Api.dll" \
    >> "${LOG_DIR}/api.log" 2>&1 &
API_PID=$!
log "API started (PID ${API_PID})"

# Wait for API to become healthy
log "Waiting for API to become healthy..."
for i in $(seq 1 "${API_HEALTH_TIMEOUT}"); do
    if curl -sf http://127.0.0.1:5195/health >/dev/null 2>&1; then
        log "API is healthy after ${i}s"
        break
    fi
    if ! kill -0 "$API_PID" 2>/dev/null; then
        log "ERROR: API process exited prematurely"
        exit 1
    fi
    sleep 1
done

if ! curl -sf http://127.0.0.1:5195/health >/dev/null 2>&1; then
    log "WARNING: API not healthy after 60s, continuing anyway..."
fi

# ── Start Bots ───────────────────────────────────────────────────
log "Starting GoalTactics Bots..."
/usr/bin/dotnet "${INSTALL_ROOT}/bots/GoalTacticsBots.dll" \
    --api-url=http://127.0.0.1:5195 \
    --db-path="${BOT_DB_PATH}" \
    --bot-count=96 \
    --neural-enabled=true \
    --require-llm-for-chat=true \
    --enable-historical-bootstrap=true \
    --historical-bootstrap-central-brain=true \
    --game-db-path="${DB_PATH}" \
    --historical-bootstrap-fast-seasons=29 \
    --historical-bootstrap-real-simulation-seasons=1 \
    --central-brain-bots-per-matchday=16 \
    --historical-bootstrap-seasons=30 \
    --historical-bootstrap-bots-per-season=16 \
    --historical-bootstrap-anchor-season=31 \
    --historical-bootstrap-anchor-day1-utc=2026-03-23 \
    --historical-bootstrap-status-path="${BOOTSTRAP_STATUS_PATH}" \
    --enable-seasonal-bot-growth=true \
    --seasonal-bots-per-season=16 \
    --seasonal-growth-check-minutes=20 \
    --simulate-matchdays=30 \
    --poll-interval=10 \
    >> "${LOG_DIR}/bots.log" 2>&1 &
BOT_PID=$!
log "Bots started (PID ${BOT_PID})"

# ── Backup loop ──────────────────────────────────────────────────
backup_loop() {
    # Wait 2 minutes after boot before first backup
    sleep 120
    while true; do
        if [[ -f "${DB_PATH}" ]]; then
            local stamp
            stamp="$(date -u +%Y%m%dT%H%M%SZ)"
            local out_db="${BACKUP_DIR}/goaltactics_${stamp}.db"

            python3 -c "
import sqlite3, os
src = '${DB_PATH}'
out = '${out_db}'
con_src = sqlite3.connect(src)
con_out = sqlite3.connect(out)
with con_out:
    con_src.backup(con_out)
con_out.close()
con_src.close()
" 2>>"${LOG_DIR}/backup.log" && \
            gzip -f "${out_db}" 2>>"${LOG_DIR}/backup.log" && \
            echo "[$(date -u +"%Y-%m-%dT%H:%M:%SZ")] backup: ${out_db}.gz" >> "${LOG_DIR}/backup.log"

            # Also backup bot database
            if [[ -f "${BOT_DB_PATH}" ]]; then
                local bot_out="${BACKUP_DIR}/bots_${stamp}.db"
                python3 -c "
import sqlite3
con_src = sqlite3.connect('${BOT_DB_PATH}')
con_out = sqlite3.connect('${bot_out}')
with con_out:
    con_src.backup(con_out)
con_out.close()
con_src.close()
" 2>>"${LOG_DIR}/backup.log" && \
                gzip -f "${bot_out}" 2>>"${LOG_DIR}/backup.log"
            fi

            # Retain last 288 main backups (24h at 5min interval)
            ls -1t "${BACKUP_DIR}"/goaltactics_*.db.gz 2>/dev/null | tail -n +289 | xargs -r rm -f
            ls -1t "${BACKUP_DIR}"/bots_*.db.gz 2>/dev/null | tail -n +289 | xargs -r rm -f

            # Save snapshot DB copy (live snapshot usage for admin panel)
            if [[ -f "${DB_PATH}" ]]; then
                python3 - <<PY 2>>"${LOG_DIR}/backup.log"
import sqlite3, os
src = "${DB_PATH}"
dst = "${SNAPSHOT_DB_PATH}"
if os.path.exists(src):
    con_src = sqlite3.connect(src)
    con_dst = sqlite3.connect(dst)
    with con_dst:
        con_src.backup(con_dst)
    con_dst.close()
    con_src.close()
PY
            fi
            if [[ -f "${BOT_DB_PATH}" ]]; then
                python3 - <<PY 2>>"${LOG_DIR}/backup.log"
import sqlite3, os
src = "${BOT_DB_PATH}"
dst = "${BOT_SNAPSHOT_DB_PATH}"
if os.path.exists(src):
    con_src = sqlite3.connect(src)
    con_dst = sqlite3.connect(dst)
    with con_dst:
        con_src.backup(con_dst)
    con_dst.close()
    con_src.close()
PY
            fi

            # Save state snapshot to saves directory
            local save_file="${SAVES_DIR}/state_${stamp}.json"
            python3 -c "
import sqlite3, json, os
db_path = '${DB_PATH}'
if not os.path.exists(db_path):
    exit(0)
con = sqlite3.connect(db_path)
con.row_factory = sqlite3.Row
cur = con.cursor()
state = {}
try:
    cur.execute('SELECT COUNT(*) as c FROM Users')
    state['total_users'] = cur.fetchone()['c']
except: pass
try:
    cur.execute('SELECT COUNT(*) as c FROM Teams')
    state['total_teams'] = cur.fetchone()['c']
except: pass
try:
    cur.execute('SELECT COUNT(*) as c FROM TeamPlayers WHERE IsScouted = 0')
    state['total_players'] = cur.fetchone()['c']
except: pass
try:
    cur.execute('SELECT COUNT(*) as c FROM LeagueMatches WHERE IsPlayed = 1')
    state['matches_played'] = cur.fetchone()['c']
except: pass
try:
    cur.execute('SELECT COUNT(*) as c FROM Auctions')
    state['total_auctions'] = cur.fetchone()['c']
except: pass
state['timestamp'] = '${stamp}'
con.close()
with open('${save_file}', 'w') as f:
    json.dump(state, f, indent=2)
" 2>>"${LOG_DIR}/backup.log"

            # Keep last 288 state snapshots
            ls -1t "${SAVES_DIR}"/state_*.json 2>/dev/null | tail -n +289 | xargs -r rm -f
        fi
        sleep "${BACKUP_INTERVAL}"
    done
}

backup_loop &
BACKUP_PID=$!
log "Backup loop started (PID ${BACKUP_PID})"

# ── Monitor children ─────────────────────────────────────────────
log "All services running. Monitoring..."
while true; do
    # Check if API is still alive
    if ! kill -0 "$API_PID" 2>/dev/null; then
        log "ERROR: API process (PID ${API_PID}) died. Restarting..."
        ASPNETCORE_URLS="http://127.0.0.1:5195" \
        ASPNETCORE_ENVIRONMENT="Production" \
        ConnectionStrings__Default="Data Source=${DB_PATH}" \
        /usr/bin/dotnet "${INSTALL_ROOT}/api/GoalTactics.Api.dll" \
            >> "${LOG_DIR}/api.log" 2>&1 &
        API_PID=$!
        log "API restarted (PID ${API_PID})"
    fi

    # Check if Bots are still alive
    if ! kill -0 "$BOT_PID" 2>/dev/null; then
        log "WARNING: Bot process (PID ${BOT_PID}) died. Restarting..."
        /usr/bin/dotnet "${INSTALL_ROOT}/bots/GoalTacticsBots.dll" \
            --api-url=http://127.0.0.1:5195 \
            --db-path="${BOT_DB_PATH}" \
            --bot-count=96 \
            --neural-enabled=true \
            --require-llm-for-chat=true \
            --enable-historical-bootstrap=true \
            --historical-bootstrap-central-brain=true \
            --game-db-path="${DB_PATH}" \
            --historical-bootstrap-fast-seasons=29 \
            --historical-bootstrap-real-simulation-seasons=1 \
            --central-brain-bots-per-matchday=16 \
            --historical-bootstrap-seasons=30 \
            --historical-bootstrap-bots-per-season=16 \
            --historical-bootstrap-anchor-season=31 \
            --historical-bootstrap-anchor-day1-utc=2026-03-23 \
            --historical-bootstrap-status-path="${BOOTSTRAP_STATUS_PATH}" \
            --enable-seasonal-bot-growth=true \
            --seasonal-bots-per-season=16 \
            --seasonal-growth-check-minutes=20 \
            --simulate-matchdays=30 \
            --poll-interval=10 \
            >> "${LOG_DIR}/bots.log" 2>&1 &
        BOT_PID=$!
        log "Bots restarted (PID ${BOT_PID})"
    fi

    # Check if backup loop is still alive
    if ! kill -0 "$BACKUP_PID" 2>/dev/null; then
        log "WARNING: Backup loop died. Restarting..."
        backup_loop &
        BACKUP_PID=$!
        log "Backup loop restarted (PID ${BACKUP_PID})"
    fi

    sleep 10
done
