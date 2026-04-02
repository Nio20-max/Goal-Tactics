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
import urllib.request
import urllib.error
from datetime import datetime, timezone
from pathlib import Path

from flask import Flask, render_template, request, jsonify, Response, session, redirect, url_for

app = Flask(__name__)
app.secret_key = os.environ.get("GT_ADMIN_SECRET", "gt-admin-dev-secret")

# ── Configuration ────────────────────────────────────────────────

DATA_ROOT   = os.environ.get("GT_DATA_ROOT", "/mnt/website/goal_tactics")
DB_PATH     = f"{DATA_ROOT}/data/goaltactics.db"
BOT_DB_PATH = f"{DATA_ROOT}/data/bots.db"
SNAPSHOT_DIR = f"{DATA_ROOT}/simulations/snapshots"
SNAPSHOT_DB_PATH = os.environ.get("GT_SNAPSHOT_DB_PATH", f"{SNAPSHOT_DIR}/goaltactics_snapshot.db")
BOT_SNAPSHOT_DB_PATH = os.environ.get("GT_BOT_SNAPSHOT_DB_PATH", f"{SNAPSHOT_DIR}/bots_snapshot.db")
LOG_DIR     = f"{DATA_ROOT}/logs"
BACKUP_DIR  = f"{DATA_ROOT}/backup"
SAVES_DIR   = f"{DATA_ROOT}/saves"
API_BASE_URL = os.environ.get("GT_API_BASE_URL", "https://gt.nikolai-linschmann.de")
BOOTSTRAP_STATUS_PATH = os.environ.get("GT_BOOTSTRAP_STATUS_PATH", f"{DATA_ROOT}/simulations/historical-bootstrap-status.json")


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


def snapshot_db_path() -> str:
    """Prefer snapshot DB if available. Falls back to live DB."""
    if os.path.exists(SNAPSHOT_DB_PATH):
        return SNAPSHOT_DB_PATH
    return DB_PATH


def snapshot_bot_db_path() -> str:
    """Prefer snapshot bot DB if available. Falls back to active bot DB."""
    if os.path.exists(BOT_SNAPSHOT_DB_PATH):
        return BOT_SNAPSHOT_DB_PATH
    return BOT_DB_PATH


def db_query_snapshot(sql: str, params: tuple = ()) -> list[dict]:
    """Query from snapshot or live fallback DB for game data."""
    return db_query(snapshot_db_path(), sql, params)


def db_query_snapshot_bots(sql: str, params: tuple = ()) -> list[dict]:
    """Query from snapshot or live fallback bot DB."""
    return db_query(snapshot_bot_db_path(), sql, params)


def api_post_json(path: str, payload: dict, bearer_token: str | None = None) -> dict:
    """POST JSON to GoalTactics API and return decoded JSON object."""
    url = f"{API_BASE_URL.rstrip('/')}{path}"
    body = json.dumps(payload).encode("utf-8")
    headers = {"Content-Type": "application/json"}
    if bearer_token:
        headers["Authorization"] = f"Bearer {bearer_token}"

    req = urllib.request.Request(
        url,
        data=body,
        headers=headers,
        method="POST",
    )

    try:
        with urllib.request.urlopen(req, timeout=15) as response:
            raw = response.read().decode("utf-8", errors="replace")
        data = json.loads(raw) if raw else {}
        return data if isinstance(data, dict) else {}
    except urllib.error.HTTPError as ex:
        try:
            raw = ex.read().decode("utf-8", errors="replace")
            data = json.loads(raw) if raw else {}
            if isinstance(data, dict):
                return data
        except Exception:
            pass
        return {"success": False, "message": f"HTTP {ex.code}"}
    except Exception as ex:
        return {"success": False, "message": str(ex)}


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


def get_bootstrap_status() -> dict:
    """Read historical bootstrap progress/status emitted by bots runtime."""
    status = {
        "exists": False,
        "phase": "unknown",
        "completed": False,
        "progress_percent": 0.0,
        "current_season": 0,
        "current_matchday": 0,
        "target_seasons": 0,
        "matchdays_per_season": 0,
        "completed_seasons": 0,
        "total_sessions": 0,
        "total_success": 0,
        "total_auth_failures": 0,
        "total_bots": 0,
        "anchor_season": 0,
        "anchor_day_one_utc": "",
        "virtual_date_utc": "",
        "observed_live_season": 0,
        "observed_live_matchday": 0,
        "updated_at_utc": "",
    }

    if not os.path.exists(BOOTSTRAP_STATUS_PATH):
        return status

    try:
        with open(BOOTSTRAP_STATUS_PATH, encoding="utf-8") as f:
            data = json.load(f)

        status["exists"] = True
        status["phase"] = data.get("Phase", data.get("phase", "unknown"))
        status["completed"] = bool(data.get("Completed", data.get("completed", False)))
        status["current_season"] = int(data.get("CurrentSeason", data.get("current_season", 0)) or 0)
        status["current_matchday"] = int(data.get("CurrentMatchday", data.get("current_matchday", 0)) or 0)
        status["target_seasons"] = int(data.get("TargetSeasons", data.get("target_seasons", 0)) or 0)
        status["matchdays_per_season"] = int(data.get("MatchdaysPerSeason", data.get("matchdays_per_season", 0)) or 0)
        status["completed_seasons"] = int(data.get("CompletedSeasons", data.get("completed_seasons", 0)) or 0)
        status["total_sessions"] = int(data.get("TotalSessions", data.get("total_sessions", 0)) or 0)
        status["total_success"] = int(data.get("TotalSuccess", data.get("total_success", 0)) or 0)
        status["total_auth_failures"] = int(data.get("TotalAuthFailures", data.get("total_auth_failures", 0)) or 0)
        status["total_bots"] = int(data.get("TotalBots", data.get("total_bots", 0)) or 0)
        status["anchor_season"] = int(data.get("AnchorSeason", data.get("anchor_season", 0)) or 0)
        status["anchor_day_one_utc"] = str(data.get("AnchorDayOneUtc", data.get("anchor_day_one_utc", "")) or "")
        status["virtual_date_utc"] = str(data.get("VirtualDateUtc", data.get("virtual_date_utc", "")) or "")
        status["observed_live_season"] = int(data.get("ObservedLiveSeason", data.get("observed_live_season", 0)) or 0)
        status["observed_live_matchday"] = int(data.get("ObservedLiveMatchday", data.get("observed_live_matchday", 0)) or 0)
        status["updated_at_utc"] = str(data.get("UpdatedAtUtc", data.get("updated_at_utc", "")) or "")

        target = max(1, status["target_seasons"])
        # Within current season, assume linear progress by matchday.
        md_total = max(1, status["matchdays_per_season"])
        md_done = min(md_total, max(0, status["current_matchday"] - 1))
        progress = (status["completed_seasons"] + (md_done / md_total)) / target
        status["progress_percent"] = round(max(0.0, min(1.0, progress)) * 100.0, 2)
    except Exception:
        return status

    return status


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
    bootstrap_status = get_bootstrap_status()

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
                           bootstrap_status=bootstrap_status,
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


@app.route("/bots/<bot_id>")
def bot_detail(bot_id):
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


@app.route("/snapshot")
def snapshot_page():
    """Show snapshot-based game state and navigation to details."""
    teams = db_query_snapshot(
        "SELECT id, name, country, league_name, fans, strength, wins, losses, members FROM teams ORDER BY name LIMIT 300")
    players_count = db_query_snapshot("SELECT COUNT(*) as c FROM team_players")
    matches = db_query_snapshot(
        "SELECT id, league_id, scheduled_date_utc, home_team_name, away_team_name, home_score, away_score, is_played FROM league_matches ORDER BY scheduled_date_utc DESC LIMIT 200")
    leagues = db_query_snapshot("SELECT id, name, tier, group_number, mount, dismount FROM leagues ORDER BY tier, group_number LIMIT 100")
    league_teams = db_query_snapshot("SELECT league_id, team_id, team_name, points_home + points_away as points FROM league_teams ORDER BY league_id, points DESC LIMIT 300")
    auctions = db_query_snapshot(
        "SELECT id, player_name, player_position, player_strength, player_talent, player_age, minimum_bid, current_bid, current_bidder_team_name, end_date_utc, status FROM auctions ORDER BY end_date_utc ASC LIMIT 200")

    return render_template("snapshot.html",
                           teams=teams,
                           players_count=players_count[0]['c'] if players_count else 0,
                           matches=matches,
                           leagues=leagues,
                           league_teams=league_teams,
                           auctions=auctions)


@app.route("/snapshot/team/<team_id>")
def snapshot_team_detail(team_id):
    team = db_query_snapshot("SELECT * FROM teams WHERE id = ?", (team_id,))
    if not team:
        return "Team not found", 404
    team = team[0]

    players = db_query_snapshot(
        "SELECT id, name, position, age, talent, strength, fitness, matches, goals, yellow_cards, red_cards, market_value FROM team_players WHERE team_id = ? ORDER BY position, strength DESC", (team_id,))

    team_auctions = db_query_snapshot(
        "SELECT id, player_name, player_position, player_strength, current_bid, current_bidder_team_name, end_date_utc, status FROM auctions WHERE seller_team_id = ? OR current_bidder_team_id = ? ORDER BY end_date_utc ASC", (team_id, team_id))

    recent_matches = db_query_snapshot(
        "SELECT id, league_id, scheduled_date_utc, home_team_name, away_team_name, home_score, away_score, is_played FROM league_matches WHERE home_team_name = ? OR away_team_name = ? ORDER BY scheduled_date_utc DESC LIMIT 50", (team['name'], team['name']))

    return render_template("snapshot_team.html",
                           team=team,
                           players=players,
                           team_auctions=team_auctions,
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


@app.route("/chat")
def chat_page():
    """User-facing chat page for global/group/private bot chats."""
    return render_template("chat.html",
                           logged_in=bool(session.get("chat_token")),
                           manager_name=session.get("chat_manager_name", ""))


@app.route("/admin/chat")
def admin_chat_redirect():
    """Legacy route for old website link patterns."""
    return redirect(url_for("chat_page"))


@app.route("/chat/login", methods=["POST"])
def chat_login():
    payload = request.get_json(silent=True) or {}
    username = (payload.get("username") or payload.get("email") or "").strip()
    password = payload.get("password") or ""

    if not username or not password:
        return jsonify({"success": False, "message": "Username/login and password are required."}), 400

    login_payload = {
        "login": username,
        "password": password,
    }
    # If input looks like an email, include the legacy Email field as well.
    if "@" in username:
        login_payload["email"] = username

    result = api_post_json("/api/Login", login_payload)

    if not result.get("success") or not result.get("token"):
        return jsonify({"success": False, "message": result.get("message", "Login failed")}), 401

    session["chat_token"] = result.get("token")
    session["chat_user_id"] = str(result.get("userId") or "")
    session["chat_manager_name"] = result.get("managerName") or username

    return jsonify({"success": True, "managerName": session["chat_manager_name"]})


@app.route("/chat/logout", methods=["POST"])
def chat_logout():
    session.pop("chat_token", None)
    session.pop("chat_user_id", None)
    session.pop("chat_manager_name", None)
    return jsonify({"success": True})


def _chat_auth_payload(extra: dict | None = None) -> dict:
    token = session.get("chat_token")
    data = {"Token": token, "token": token}
    if extra:
        data.update(extra)
    return data


@app.route("/chat/api/contacts", methods=["GET"])
def chat_api_contacts():
    token = session.get("chat_token")
    if not token:
        return jsonify({"success": False, "message": "Not logged in"}), 401

    result = api_post_json("/api/GetChatContacts", _chat_auth_payload(), token)
    return jsonify(result)


@app.route("/chat/api/history", methods=["GET"])
def chat_api_history():
    token = session.get("chat_token")
    if not token:
        return jsonify({"success": False, "message": "Not logged in"}), 401

    channel = (request.args.get("channel") or "global").strip().lower()
    target = (request.args.get("targetUserId") or "").strip()

    payload = _chat_auth_payload({"channel": channel})
    if target:
        payload["targetUserId"] = target

    result = api_post_json("/api/GetChatHistory", payload, token)
    return jsonify(result)


@app.route("/chat/api/send", methods=["POST"])
def chat_api_send():
    token = session.get("chat_token")
    if not token:
        return jsonify({"success": False, "message": "Not logged in"}), 401

    payload_in = request.get_json(silent=True) or {}
    message = (payload_in.get("message") or "").strip()
    channel = (payload_in.get("channel") or "global").strip().lower()
    target = (payload_in.get("targetUserId") or "").strip()

    if not message:
        return jsonify({"success": False, "message": "Message required"}), 400

    payload = _chat_auth_payload({
        "message": message,
        "channel": channel,
    })
    if target:
        payload["targetUserId"] = target

    result = api_post_json("/api/PostChatMessage", payload, token)
    return jsonify(result)


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
        "bootstrap": get_bootstrap_status(),
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
