#!/usr/bin/env python3
"""
GoalTactics Admin Panel — Web Dashboard

Serves a log viewer, bot inspector, and analytics dashboard
at gt.nikolai-linschmann.de (proxied by nginx on port 3000).
"""

import json
import os
import re
import sqlite3
import glob
import subprocess
from datetime import datetime, timezone
from pathlib import Path

from flask import Flask, render_template, request, jsonify, Response

app = Flask(__name__)

# ── Configuration ────────────────────────────────────────────────

DATA_ROOT   = os.environ.get("GT_DATA_ROOT", "/mnt/website/goal_tactics")
DB_PATH     = f"{DATA_ROOT}/data/goaltactics.db"
BOT_DB_PATH = f"{DATA_ROOT}/data/bots.db"
LOG_DIR     = f"{DATA_ROOT}/logs"
BACKUP_DIR  = f"{DATA_ROOT}/backup"
SAVES_DIR   = f"{DATA_ROOT}/saves"


# ── Database helpers ─────────────────────────────────────────────

def db_query(db_path: str, sql: str, params: tuple = ()) -> list[dict]:
    """Execute a read query and return list of dicts."""
    if not os.path.exists(db_path):
        return []
    try:
        con = sqlite3.connect(db_path, timeout=5)
        con.row_factory = sqlite3.Row
        cur = con.execute(sql, params)
        rows = [dict(r) for r in cur.fetchall()]
        con.close()
        return rows
    except Exception:
        return []


def get_game_stats() -> dict:
    """Gather game statistics from the main database."""
    stats = {}
    queries = {
        "total_users":     "SELECT COUNT(*) as c FROM Users",
        "total_teams":     "SELECT COUNT(*) as c FROM Teams",
        "total_players":   "SELECT COUNT(*) as c FROM TeamPlayers WHERE IsScouted = 0",
        "scouted_players": "SELECT COUNT(*) as c FROM TeamPlayers WHERE IsScouted = 1",
        "matches_played":  "SELECT COUNT(*) as c FROM LeagueMatches WHERE IsPlayed = 1",
        "matches_pending": "SELECT COUNT(*) as c FROM LeagueMatches WHERE IsPlayed = 0",
        "total_auctions":  "SELECT COUNT(*) as c FROM Auctions",
        "chat_messages":   "SELECT COUNT(*) as c FROM ChatMessages",
        "friend_requests": "SELECT COUNT(*) as c FROM FriendRequests",
        "active_sessions": "SELECT COUNT(*) as c FROM UserSessions WHERE RevokedAtUtc IS NULL",
    }
    for key, sql in queries.items():
        try:
            rows = db_query(DB_PATH, sql)
            stats[key] = rows[0]["c"] if rows else 0
        except Exception:
            stats[key] = 0
    return stats


def get_bot_stats() -> dict:
    """Gather bot statistics."""
    stats = {"total_bots": 0, "high_activity": 0, "mid_activity": 0, "low_activity": 0}
    try:
        rows = db_query(BOT_DB_PATH, "SELECT COUNT(*) as c FROM Bots")
        stats["total_bots"] = rows[0]["c"] if rows else 0
        rows = db_query(BOT_DB_PATH, "SELECT COUNT(*) as c FROM Bots WHERE Activity >= 70")
        stats["high_activity"] = rows[0]["c"] if rows else 0
        rows = db_query(BOT_DB_PATH, "SELECT COUNT(*) as c FROM Bots WHERE Activity >= 30 AND Activity < 70")
        stats["mid_activity"] = rows[0]["c"] if rows else 0
        rows = db_query(BOT_DB_PATH, "SELECT COUNT(*) as c FROM Bots WHERE Activity < 30")
        stats["low_activity"] = rows[0]["c"] if rows else 0
    except Exception:
        pass
    return stats


# ── Log reading ──────────────────────────────────────────────────

def read_log_tail(filename: str, lines: int = 500) -> str:
    """Read the last N lines of a log file."""
    filepath = os.path.join(LOG_DIR, os.path.basename(filename))
    if not os.path.exists(filepath):
        return ""
    try:
        result = subprocess.run(["tail", f"-{lines}", filepath],
                                capture_output=True, text=True, timeout=5)
        return result.stdout
    except Exception:
        return ""


def search_log(filename: str, pattern: str, lines: int = 200) -> str:
    """Search a log file with grep. Pattern is treated as a fixed string."""
    filepath = os.path.join(LOG_DIR, os.path.basename(filename))
    if not os.path.exists(filepath):
        return ""
    # Limit pattern length to prevent abuse
    pattern = pattern[:200]
    try:
        # Use -F (fixed string) to avoid regex injection / ReDoS
        result = subprocess.run(["grep", "-i", "-F", "--color=never", "-m", str(lines), pattern, filepath],
                                capture_output=True, text=True, timeout=10)
        return result.stdout
    except Exception:
        return ""


def get_log_files() -> list[dict]:
    """List available log files with metadata."""
    files = []
    for f in sorted(glob.glob(f"{LOG_DIR}/*.log")):
        stat = os.stat(f)
        files.append({
            "name": os.path.basename(f),
            "size_kb": round(stat.st_size / 1024, 1),
            "modified": datetime.fromtimestamp(stat.st_mtime, tz=timezone.utc).isoformat(),
        })
    return files


# ── Routes ───────────────────────────────────────────────────────

@app.route("/")
def index():
    """Dashboard home page."""
    game_stats = get_game_stats()
    bot_stats = get_bot_stats()
    log_files = get_log_files()

    # Service status
    try:
        result = subprocess.run(["systemctl", "is-active", "goaltactics.service"],
                                capture_output=True, text=True, timeout=5)
        service_status = result.stdout.strip()
    except Exception:
        service_status = "unknown"

    # Backup count
    backup_count = len(glob.glob(f"{BACKUP_DIR}/goaltactics_*.db.gz"))

    return render_template("index.html",
                           game_stats=game_stats,
                           bot_stats=bot_stats,
                           log_files=log_files,
                           service_status=service_status,
                           backup_count=backup_count)


@app.route("/logs")
def logs_page():
    """Log viewer page."""
    log_files = get_log_files()
    selected = request.args.get("file", "")
    search = request.args.get("search", "")
    lines = int(request.args.get("lines", 200))

    content = ""
    if selected:
        if search:
            content = search_log(selected, search, lines)
        else:
            content = read_log_tail(selected, lines)

    return render_template("logs.html",
                           log_files=log_files,
                           selected=selected,
                           search=search,
                           lines=lines,
                           content=content)


@app.route("/bots")
def bots_page():
    """Bot inspector page."""
    page = int(request.args.get("page", 1))
    per_page = 50
    search = request.args.get("search", "")
    sort_by = request.args.get("sort", "BotId")
    sort_dir = request.args.get("dir", "ASC")

    # Validate sort column
    valid_sorts = ["BotId", "TeamName", "ManagerName", "Activity", "Risk",
                   "YouthFocus", "SocialScore", "StarsDaily"]
    if sort_by not in valid_sorts:
        sort_by = "BotId"
    if sort_dir not in ("ASC", "DESC"):
        sort_dir = "ASC"

    offset = (page - 1) * per_page

    if search:
        where = "WHERE TeamName LIKE ? OR ManagerName LIKE ?"
        params = (f"%{search}%", f"%{search}%")
        count_rows = db_query(BOT_DB_PATH,
            f"SELECT COUNT(*) as c FROM Bots {where}", params)
        total = count_rows[0]["c"] if count_rows else 0
        bots = db_query(BOT_DB_PATH,
            f"""SELECT BotId, TeamName, ManagerName, Activity, Risk, YouthFocus,
                       SocialScore, StarsDaily, Timezone, NextOnline, LastOffline
                FROM Bots {where}
                ORDER BY {sort_by} {sort_dir}
                LIMIT ? OFFSET ?""",
            (*params, per_page, offset))
    else:
        count_rows = db_query(BOT_DB_PATH, "SELECT COUNT(*) as c FROM Bots")
        total = count_rows[0]["c"] if count_rows else 0
        bots = db_query(BOT_DB_PATH,
            f"""SELECT BotId, TeamName, ManagerName, Activity, Risk, YouthFocus,
                       SocialScore, StarsDaily, Timezone, NextOnline, LastOffline
                FROM Bots
                ORDER BY {sort_by} {sort_dir}
                LIMIT ? OFFSET ?""",
            (per_page, offset))

    total_pages = max(1, (total + per_page - 1) // per_page)

    return render_template("bots.html",
                           bots=bots,
                           page=page,
                           total_pages=total_pages,
                           total=total,
                           search=search,
                           sort_by=sort_by,
                           sort_dir=sort_dir)


@app.route("/bots/<int:bot_id>")
def bot_detail(bot_id: int):
    """Detailed view of a single bot."""
    bot = db_query(BOT_DB_PATH,
        "SELECT * FROM Bots WHERE BotId = ?", (bot_id,))
    if not bot:
        return "Bot not found", 404
    bot = bot[0]

    # Get relationships
    relationships = db_query(BOT_DB_PATH,
        """SELECT br.*, b.TeamName as TargetTeamName
           FROM BotRelationships br
           LEFT JOIN Bots b ON b.BotId = br.TargetBotId
           WHERE br.BotId = ?""", (bot_id,))

    # Get schedule
    schedule = db_query(BOT_DB_PATH,
        "SELECT * FROM BotSchedule WHERE BotId = ?", (bot_id,))

    # Get groups
    groups = db_query(BOT_DB_PATH,
        "SELECT * FROM BotGroups WHERE BotId = ?", (bot_id,))

    # Search for this bot in logs using Python (avoids subprocess for user-derived input)
    bot_logs = ""
    log_file = os.path.join(LOG_DIR, "bots.log")
    if os.path.exists(log_file):
        try:
            needle = f"Bot {bot_id}"
            matches = []
            with open(log_file, encoding="utf-8", errors="replace") as f:
                for line in f:
                    if needle in line:
                        matches.append(line.rstrip("\n"))
                        if len(matches) >= 100:
                            break
            bot_logs = "\n".join(matches)
        except Exception:
            pass

    return render_template("bot_detail.html",
                           bot=bot,
                           relationships=relationships,
                           schedule=schedule,
                           groups=groups,
                           bot_logs=bot_logs)


@app.route("/analytics")
def analytics_page():
    """Analytics dashboard."""
    game_stats = get_game_stats()
    bot_stats = get_bot_stats()

    # Get state snapshots for trend data
    saves = sorted(glob.glob(f"{SAVES_DIR}/state_*.json"), reverse=True)[:50]
    trend_data = []
    for s in reversed(saves):
        try:
            with open(s) as f:
                data = json.load(f)
            trend_data.append(data)
        except Exception:
            pass

    # League standings
    league_data = db_query(DB_PATH, """
        SELECT t.Name as TeamName, ls.Points, ls.GoalsFor, ls.GoalsAgainst, ls.Wins, ls.Draws, ls.Losses
        FROM LeagueStandings ls
        JOIN Teams t ON t.Id = ls.TeamId
        ORDER BY ls.Points DESC
        LIMIT 20
    """)

    # Recent matches
    recent_matches = db_query(DB_PATH, """
        SELECT lm.ScheduledDateUtc, t1.Name as HomeTeam, t2.Name as AwayTeam,
               lm.HomeGoals, lm.AwayGoals
        FROM LeagueMatches lm
        JOIN Teams t1 ON t1.Id = lm.HomeTeamId
        JOIN Teams t2 ON t2.Id = lm.AwayTeamId
        WHERE lm.IsPlayed = 1
        ORDER BY lm.ScheduledDateUtc DESC
        LIMIT 20
    """)

    return render_template("analytics.html",
                           game_stats=game_stats,
                           bot_stats=bot_stats,
                           trend_data=json.dumps(trend_data),
                           league_data=league_data,
                           recent_matches=recent_matches)


@app.route("/backups")
def backups_page():
    """Backup management page."""
    backups = sorted(glob.glob(f"{BACKUP_DIR}/goaltactics_*.db.gz"), reverse=True)
    backup_list = []
    for b in backups[:100]:
        stat = os.stat(b)
        backup_list.append({
            "name": os.path.basename(b),
            "size_kb": round(stat.st_size / 1024, 1),
            "created": datetime.fromtimestamp(stat.st_mtime, tz=timezone.utc).isoformat(),
        })

    return render_template("backups.html",
                           backups=backup_list,
                           total=len(backups))


# ── API endpoints for AJAX ───────────────────────────────────────

@app.route("/api/logs/<filename>")
def api_log_content(filename: str):
    """Return log content as JSON for AJAX requests."""
    search = request.args.get("search", "")
    lines = int(request.args.get("lines", 200))

    if search:
        content = search_log(filename, search, lines)
    else:
        content = read_log_tail(filename, lines)

    return jsonify({"content": content, "file": filename})


@app.route("/api/stats")
def api_stats():
    """Return current stats as JSON."""
    return jsonify({
        "game": get_game_stats(),
        "bots": get_bot_stats(),
    })


@app.route("/api/health")
def api_health():
    """Health check endpoint."""
    try:
        result = subprocess.run(["curl", "-sf", "-m", "3", "http://127.0.0.1:5195/health"],
                                capture_output=True, text=True, timeout=5)
        api_healthy = result.returncode == 0
    except Exception:
        api_healthy = False

    return jsonify({
        "admin_panel": True,
        "api": api_healthy,
        "database": os.path.exists(DB_PATH),
        "bot_database": os.path.exists(BOT_DB_PATH),
    })


# ── Main ─────────────────────────────────────────────────────────

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=3000, debug=False)
