#!/usr/bin/env python3
"""
GoalTactics Admin Panel — Interactive CLI for server management.

Usage:
    python3 admin.py
    python3 admin.py --no-bots   (skip bot creation on DB reset)

Requires: python3, sqlite3 (standard library), systemd on the host.
"""

import json
import os
import sqlite3
import subprocess
import sys
import time
import glob
import shutil
from datetime import datetime, timezone
from pathlib import Path

# ── Paths ────────────────────────────────────────────────────────

DATA_ROOT   = "/mnt/website/goal_tactics"
DB_PATH     = f"{DATA_ROOT}/data/goaltactics.db"
BOT_DB_PATH = f"{DATA_ROOT}/data/bots.db"
LOG_DIR     = f"{DATA_ROOT}/logs"
BACKUP_DIR  = f"{DATA_ROOT}/backup"
SAVES_DIR   = f"{DATA_ROOT}/saves"
INSTALL_ROOT = "/opt/goaltactics"
SERVICE_NAME = "goaltactics.service"
ADMIN_PANEL_SERVICE = "goaltactics-admin-panel.service"

# ── Helpers ──────────────────────────────────────────────────────

def run_cmd(cmd: list[str], check: bool = True, capture: bool = False) -> subprocess.CompletedProcess:
    """Run a shell command, optionally capturing output."""
    return subprocess.run(cmd, check=check, capture_output=capture, text=True)


def confirm(prompt: str) -> bool:
    """Ask for yes/no confirmation."""
    ans = input(f"{prompt} [y/N]: ").strip().lower()
    return ans in ("y", "yes")


def header(title: str) -> None:
    """Print a formatted section header."""
    print(f"\n{'='*60}")
    print(f"  {title}")
    print(f"{'='*60}\n")


def print_table(rows: list[dict], columns: list[str]) -> None:
    """Print a simple table from list of dicts."""
    if not rows:
        print("  (no data)")
        return
    widths = {c: max(len(c), *(len(str(r.get(c, ""))) for r in rows)) for c in columns}
    hdr = " | ".join(c.ljust(widths[c]) for c in columns)
    sep = "-+-".join("-" * widths[c] for c in columns)
    print(f"  {hdr}")
    print(f"  {sep}")
    for r in rows:
        line = " | ".join(str(r.get(c, "")).ljust(widths[c]) for c in columns)
        print(f"  {line}")


# ── Database Queries ─────────────────────────────────────────────

def db_query(db_path: str, sql: str, params: tuple = ()) -> list[dict]:
    """Execute a read query and return list of dicts."""
    if not os.path.exists(db_path):
        print(f"  Database not found: {db_path}")
        return []
    con = sqlite3.connect(db_path)
    con.row_factory = sqlite3.Row
    cur = con.execute(sql, params)
    rows = [dict(r) for r in cur.fetchall()]
    con.close()
    return rows


def db_execute(db_path: str, sql: str, params: tuple = ()) -> int:
    """Execute a write query and return rows affected."""
    con = sqlite3.connect(db_path)
    cur = con.execute(sql, params)
    con.commit()
    affected = cur.rowcount
    con.close()
    return affected


# ── Service Management ───────────────────────────────────────────

def service_status():
    """Show status of the GoalTactics service."""
    header("Service Status")
    result = run_cmd(["systemctl", "status", SERVICE_NAME, "--no-pager"], check=False, capture=True)
    print(result.stdout)
    if result.stderr:
        print(result.stderr)


def restart_service():
    """Restart the GoalTactics service."""
    header("Restarting Service")
    if not confirm("Restart the GoalTactics service?"):
        print("  Cancelled.")
        return
    run_cmd(["systemctl", "restart", SERVICE_NAME], check=False)
    print("  Service restart command issued.")
    time.sleep(2)
    service_status()


def stop_service():
    """Stop the GoalTactics service."""
    header("Stopping Service")
    if not confirm("Stop the GoalTactics service?"):
        print("  Cancelled.")
        return
    run_cmd(["systemctl", "stop", SERVICE_NAME], check=False)
    print("  Service stopped.")


def start_service():
    """Start the GoalTactics service."""
    header("Starting Service")
    run_cmd(["systemctl", "start", SERVICE_NAME], check=False)
    print("  Service start command issued.")
    time.sleep(2)
    service_status()


# ── Database Management ──────────────────────────────────────────

def reset_database(create_bots: bool = True):
    """Reset the database (delete and let the API recreate it on startup)."""
    header("Reset Database")
    print("  WARNING: This will DELETE the entire database and restart the service.")
    print(f"  Database path: {DB_PATH}")
    print(f"  Bot database:  {BOT_DB_PATH}")
    print(f"  Create bots after reset: {'YES' if create_bots else 'NO'}")
    print()

    if not confirm("Are you absolutely sure?"):
        print("  Cancelled.")
        return

    if not confirm("Type 'y' again to confirm DESTRUCTIVE database reset"):
        print("  Cancelled.")
        return

    # Stop service
    print("  Stopping service...")
    run_cmd(["systemctl", "stop", SERVICE_NAME], check=False)
    time.sleep(2)

    # Backup current DB before deletion
    if os.path.exists(DB_PATH):
        stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
        backup_path = f"{BACKUP_DIR}/pre_reset_{stamp}.db"
        os.makedirs(BACKUP_DIR, exist_ok=True)
        shutil.copy2(DB_PATH, backup_path)
        print(f"  Pre-reset backup saved: {backup_path}")

        # Remove main DB + WAL/SHM files
        for ext in ("", "-wal", "-shm"):
            p = DB_PATH + ext
            if os.path.exists(p):
                os.remove(p)
        print("  Main database deleted.")

    # Remove bot database
    if os.path.exists(BOT_DB_PATH):
        for ext in ("", "-wal", "-shm"):
            p = BOT_DB_PATH + ext
            if os.path.exists(p):
                os.remove(p)
        print("  Bot database deleted.")

    # Restart service (API will auto-migrate on startup, bots will re-register)
    if create_bots:
        print("  Starting service (bots will auto-register)...")
    else:
        print("  Starting service (bots DISABLED — start bots manually later)...")

    run_cmd(["systemctl", "start", SERVICE_NAME], check=False)
    print("  Service started. Database will be recreated automatically.")
    print()
    if create_bots:
        print("  Bots will register themselves over the next few minutes.")
    else:
        print("  To add bots later, use option 4 from the admin menu.")


# ── Bot Management ───────────────────────────────────────────────

def show_bots():
    """Show all registered bots."""
    header("Registered Bots")
    rows = db_query(BOT_DB_PATH, """
        SELECT BotId, TeamName, ManagerName, Activity, Risk, YouthFocus, SocialScore, StarsDaily
        FROM Bots ORDER BY BotId LIMIT 100
    """)
    print(f"  Total bots: {len(rows)} (showing up to 100)\n")
    print_table(rows, ["BotId", "TeamName", "ManagerName", "Activity", "Risk", "SocialScore"])


def add_bots():
    """Add more bots to the system."""
    header("Add Bots")
    try:
        count = int(input("  How many bots to add? "))
    except ValueError:
        print("  Invalid number.")
        return

    if count <= 0 or count > 500:
        print("  Please enter a number between 1 and 500.")
        return

    # Read current bot count
    current = db_query(BOT_DB_PATH, "SELECT COUNT(*) as c FROM Bots")
    current_count = current[0]["c"] if current else 0
    new_target = current_count + count

    print(f"  Current bots: {current_count}")
    print(f"  New target: {new_target}")

    if not confirm(f"  Add {count} bots (new target: {new_target})?"):
        print("  Cancelled.")
        return

    # Run the bot client with the new count target — it will register additional bots
    print(f"  Starting bot registration process for {count} new bots...")
    result = run_cmd([
        "/usr/bin/dotnet", f"{INSTALL_ROOT}/bots/GoalTacticsBots.dll",
        f"--api-url=http://127.0.0.1:5195",
        f"--db-path={BOT_DB_PATH}",
        f"--bot-count={new_target}",
        "--poll-interval=999999"  # Don't enter main loop, just register
    ], check=False, capture=True)

    if result.stdout:
        for line in result.stdout.strip().split("\n")[-10:]:
            print(f"    {line}")
    print(f"  Bot registration complete.")


def remove_bots():
    """Remove bots from the system."""
    header("Remove Bots")
    current = db_query(BOT_DB_PATH, "SELECT COUNT(*) as c FROM Bots")
    current_count = current[0]["c"] if current else 0
    print(f"  Current bot count: {current_count}")

    try:
        count = int(input("  How many bots to remove? (0 = all): "))
    except ValueError:
        print("  Invalid number.")
        return

    if count == 0:
        count = current_count
        if not confirm(f"  Remove ALL {current_count} bots?"):
            print("  Cancelled.")
            return
    elif count < 0 or count > current_count:
        print(f"  Invalid. Enter 0–{current_count}.")
        return
    else:
        if not confirm(f"  Remove {count} bots?"):
            print("  Cancelled.")
            return

    # Get bots to remove (highest IDs first)
    bots = db_query(BOT_DB_PATH, "SELECT BotId FROM Bots ORDER BY BotId DESC LIMIT ?", (count,))
    removed = 0
    for bot in bots:
        db_execute(BOT_DB_PATH, "DELETE FROM Bots WHERE BotId = ?", (bot["BotId"],))
        db_execute(BOT_DB_PATH, "DELETE FROM BotSchedule WHERE BotId = ?", (bot["BotId"],))
        db_execute(BOT_DB_PATH, "DELETE FROM BotRelationships WHERE BotId = ? OR TargetBotId = ?",
                   (bot["BotId"], bot["BotId"]))
        removed += 1

    print(f"  Removed {removed} bots from bot database.")
    print("  Note: Their user accounts still exist in the main database.")


# ── Analytics ────────────────────────────────────────────────────

def show_analytics():
    """Show game analytics."""
    header("Game Analytics")

    # Main DB stats
    stats = {}
    queries = {
        "Users":          "SELECT COUNT(*) as c FROM Users",
        "Teams":          "SELECT COUNT(*) as c FROM Teams",
        "Players":        "SELECT COUNT(*) as c FROM TeamPlayers WHERE IsScouted = 0",
        "Scouted":        "SELECT COUNT(*) as c FROM TeamPlayers WHERE IsScouted = 1",
        "Matches Played": "SELECT COUNT(*) as c FROM LeagueMatches WHERE IsPlayed = 1",
        "Matches Pending":"SELECT COUNT(*) as c FROM LeagueMatches WHERE IsPlayed = 0",
        "Auctions":       "SELECT COUNT(*) as c FROM Auctions",
        "Chat Messages":  "SELECT COUNT(*) as c FROM ChatMessages",
        "Friend Requests":"SELECT COUNT(*) as c FROM FriendRequests",
        "Active Sessions":"SELECT COUNT(*) as c FROM UserSessions WHERE RevokedAtUtc IS NULL",
    }

    if os.path.exists(DB_PATH):
        for label, sql in queries.items():
            try:
                rows = db_query(DB_PATH, sql)
                stats[label] = rows[0]["c"] if rows else "?"
            except Exception:
                stats[label] = "error"
    else:
        print("  Main database not found.")
        return

    for label, value in stats.items():
        print(f"  {label:20s}: {value}")

    # Bot stats
    print()
    if os.path.exists(BOT_DB_PATH):
        bot_rows = db_query(BOT_DB_PATH, "SELECT COUNT(*) as c FROM Bots")
        print(f"  {'Registered Bots':20s}: {bot_rows[0]['c'] if bot_rows else '?'}")

        # Activity distribution
        high = db_query(BOT_DB_PATH, "SELECT COUNT(*) as c FROM Bots WHERE Activity >= 70")
        mid = db_query(BOT_DB_PATH, "SELECT COUNT(*) as c FROM Bots WHERE Activity >= 30 AND Activity < 70")
        low = db_query(BOT_DB_PATH, "SELECT COUNT(*) as c FROM Bots WHERE Activity < 30")
        print(f"  {'Bots (high activity)':20s}: {high[0]['c'] if high else 0}")
        print(f"  {'Bots (mid activity)':20s}: {mid[0]['c'] if mid else 0}")
        print(f"  {'Bots (low activity)':20s}: {low[0]['c'] if low else 0}")
    else:
        print("  Bot database not found.")

    # Disk usage
    print()
    for label, path in [("Database", DB_PATH), ("Bot DB", BOT_DB_PATH),
                         ("Logs", LOG_DIR), ("Backups", BACKUP_DIR), ("Saves", SAVES_DIR)]:
        if os.path.exists(path):
            if os.path.isfile(path):
                size = os.path.getsize(path)
            else:
                size = sum(f.stat().st_size for f in Path(path).rglob("*") if f.is_file())
            print(f"  {label:20s}: {size / 1024 / 1024:.1f} MB")


# ── Log Viewing ──────────────────────────────────────────────────

def view_logs():
    """View recent log entries."""
    header("Log Viewer")
    log_files = sorted(glob.glob(f"{LOG_DIR}/*.log"))
    if not log_files:
        print("  No log files found.")
        return

    print("  Available log files:")
    for i, f in enumerate(log_files, 1):
        size = os.path.getsize(f) if os.path.exists(f) else 0
        print(f"    {i}. {os.path.basename(f)} ({size / 1024:.1f} KB)")

    print(f"    {len(log_files) + 1}. View ALL logs (last 50 lines each)")
    print()

    try:
        choice = int(input("  Select log file number: "))
    except ValueError:
        print("  Invalid choice.")
        return

    if choice == len(log_files) + 1:
        for f in log_files:
            print(f"\n  ── {os.path.basename(f)} (last 50 lines) ──")
            result = run_cmd(["tail", "-50", f], check=False, capture=True)
            print(result.stdout)
        return

    if choice < 1 or choice > len(log_files):
        print("  Invalid choice.")
        return

    log_file = log_files[choice - 1]
    try:
        lines = int(input("  How many lines to show? [50]: ").strip() or "50")
    except ValueError:
        lines = 50

    result = run_cmd(["tail", f"-{lines}", log_file], check=False, capture=True)
    print(f"\n  ── {os.path.basename(log_file)} (last {lines} lines) ──")
    print(result.stdout)


def tail_logs():
    """Follow logs in real-time."""
    header("Live Log Tail")
    log_files = sorted(glob.glob(f"{LOG_DIR}/*.log"))
    if not log_files:
        print("  No log files found.")
        return

    print("  Following all logs. Press Ctrl+C to stop.\n")
    try:
        run_cmd(["tail", "-f"] + log_files, check=False)
    except KeyboardInterrupt:
        print("\n  Stopped tailing.")


# ── Backup Management ────────────────────────────────────────────

def list_backups():
    """List available backups."""
    header("Available Backups")
    backups = sorted(glob.glob(f"{BACKUP_DIR}/goaltactics_*.db.gz"), reverse=True)
    if not backups:
        print("  No backups found.")
        return

    print(f"  Total backups: {len(backups)}\n")
    for i, b in enumerate(backups[:20], 1):
        size = os.path.getsize(b) if os.path.exists(b) else 0
        name = os.path.basename(b)
        print(f"    {i:3d}. {name} ({size / 1024:.1f} KB)")

    if len(backups) > 20:
        print(f"\n    ... and {len(backups) - 20} more")


def restore_backup():
    """Restore a database backup."""
    header("Restore Backup")
    backups = sorted(glob.glob(f"{BACKUP_DIR}/goaltactics_*.db.gz"), reverse=True)
    if not backups:
        print("  No backups found.")
        return

    print("  Recent backups:")
    for i, b in enumerate(backups[:10], 1):
        print(f"    {i}. {os.path.basename(b)}")

    try:
        choice = int(input("\n  Select backup number to restore: "))
    except ValueError:
        print("  Invalid choice.")
        return

    if choice < 1 or choice > min(10, len(backups)):
        print("  Invalid choice.")
        return

    backup_file = backups[choice - 1]
    print(f"\n  Will restore: {os.path.basename(backup_file)}")
    if not confirm("  This will REPLACE the current database. Continue?"):
        print("  Cancelled.")
        return

    print("  Stopping service...")
    run_cmd(["systemctl", "stop", SERVICE_NAME], check=False)
    time.sleep(2)

    print("  Restoring...")
    result = run_cmd([f"{INSTALL_ROOT}/bin/restore-goaltactics.sh", backup_file], check=False, capture=True)
    print(result.stdout)
    if result.returncode != 0:
        print(f"  ERROR: {result.stderr}")
        return

    print("  Starting service...")
    run_cmd(["systemctl", "start", SERVICE_NAME], check=False)
    print("  Restore complete. Service restarted.")


def create_backup_now():
    """Trigger an immediate backup."""
    header("Create Backup Now")
    if not os.path.exists(DB_PATH):
        print("  Database not found.")
        return

    stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    out_db = f"{BACKUP_DIR}/goaltactics_{stamp}.db"

    print(f"  Creating backup: goaltactics_{stamp}.db.gz")
    run_cmd([f"{INSTALL_ROOT}/bin/backup-goaltactics.sh"], check=False)
    print("  Backup complete.")


# ── Admin Panel Web ──────────────────────────────────────────────

def manage_admin_panel():
    """Manage the web admin panel service."""
    header("Admin Panel Web Service")
    result = run_cmd(["systemctl", "is-active", ADMIN_PANEL_SERVICE], check=False, capture=True)
    status = result.stdout.strip()
    print(f"  Admin panel status: {status}")
    print()
    print("  1. Start admin panel")
    print("  2. Stop admin panel")
    print("  3. Restart admin panel")
    print("  4. View admin panel logs")
    print("  0. Back")

    try:
        choice = input("\n  Choice: ").strip()
    except (EOFError, KeyboardInterrupt):
        return

    if choice == "1":
        run_cmd(["systemctl", "start", ADMIN_PANEL_SERVICE], check=False)
        print("  Admin panel started.")
    elif choice == "2":
        run_cmd(["systemctl", "stop", ADMIN_PANEL_SERVICE], check=False)
        print("  Admin panel stopped.")
    elif choice == "3":
        run_cmd(["systemctl", "restart", ADMIN_PANEL_SERVICE], check=False)
        print("  Admin panel restarted.")
    elif choice == "4":
        result = run_cmd(["journalctl", "-u", ADMIN_PANEL_SERVICE, "-n", "50", "--no-pager"],
                         check=False, capture=True)
        print(result.stdout)


# ── Saves Viewer ─────────────────────────────────────────────────

def view_saves():
    """View saved state snapshots."""
    header("State Snapshots")
    saves = sorted(glob.glob(f"{SAVES_DIR}/state_*.json"), reverse=True)
    if not saves:
        print("  No state snapshots found.")
        return

    print(f"  Total snapshots: {len(saves)} (showing latest 10)\n")
    for i, s in enumerate(saves[:10], 1):
        try:
            with open(s) as f:
                data = json.load(f)
            ts = data.get("timestamp", "?")
            users = data.get("total_users", "?")
            teams = data.get("total_teams", "?")
            players = data.get("total_players", "?")
            matches = data.get("matches_played", "?")
            print(f"    {i}. {ts} — Users:{users} Teams:{teams} Players:{players} Matches:{matches}")
        except Exception as e:
            print(f"    {i}. {os.path.basename(s)} — (error reading: {e})")


# ── Health Check ─────────────────────────────────────────────────

def health_check():
    """Run a comprehensive health check."""
    header("Health Check")

    checks = []

    # Check systemd service
    result = run_cmd(["systemctl", "is-active", SERVICE_NAME], check=False, capture=True)
    checks.append(("Service", result.stdout.strip() == "active", result.stdout.strip()))

    # Check API health endpoint
    try:
        result = run_cmd(["curl", "-sf", "-m", "5", "http://127.0.0.1:5195/health"],
                         check=False, capture=True)
        checks.append(("API Health", result.returncode == 0, result.stdout.strip()[:80]))
    except Exception as e:
        checks.append(("API Health", False, str(e)))

    # Check database
    checks.append(("Database", os.path.exists(DB_PATH),
                    f"{os.path.getsize(DB_PATH) / 1024:.0f} KB" if os.path.exists(DB_PATH) else "missing"))

    # Check bot database
    checks.append(("Bot Database", os.path.exists(BOT_DB_PATH),
                    f"{os.path.getsize(BOT_DB_PATH) / 1024:.0f} KB" if os.path.exists(BOT_DB_PATH) else "missing"))

    # Check log directory
    log_count = len(glob.glob(f"{LOG_DIR}/*.log"))
    checks.append(("Log Files", log_count > 0, f"{log_count} files"))

    # Check backups
    backup_count = len(glob.glob(f"{BACKUP_DIR}/goaltactics_*.db.gz"))
    checks.append(("Backups", backup_count > 0, f"{backup_count} snapshots"))

    # Check disk space
    try:
        stat = os.statvfs(DATA_ROOT)
        free_gb = (stat.f_bavail * stat.f_frsize) / (1024**3)
        checks.append(("Disk Space", free_gb > 1.0, f"{free_gb:.1f} GB free"))
    except Exception:
        checks.append(("Disk Space", False, "unable to check"))

    # Print results
    for name, ok, detail in checks:
        status = "✓ OK" if ok else "✗ FAIL"
        print(f"  [{status:6s}] {name:20s}: {detail}")


# ── Main Menu ────────────────────────────────────────────────────

MENU = """
╔══════════════════════════════════════════════╗
║        GoalTactics Admin Panel               ║
╠══════════════════════════════════════════════╣
║  SERVICE                                     ║
║    1.  Service status                        ║
║    2.  Restart service                       ║
║    3.  Stop service                          ║
║    4.  Start service                         ║
║    5.  Health check                          ║
║                                              ║
║  DATABASE                                    ║
║    10. Reset database (with bots)            ║
║    11. Reset database (without bots)         ║
║    12. Show analytics                        ║
║    13. View state snapshots                  ║
║                                              ║
║  BOTS                                        ║
║    20. Show bots                             ║
║    21. Add bots                              ║
║    22. Remove bots                           ║
║                                              ║
║  LOGS                                        ║
║    30. View logs                             ║
║    31. Tail logs (live)                      ║
║                                              ║
║  BACKUPS                                     ║
║    40. List backups                          ║
║    41. Create backup now                     ║
║    42. Restore backup                        ║
║                                              ║
║  WEB ADMIN                                   ║
║    50. Manage admin panel web service        ║
║                                              ║
║    0.  Exit                                  ║
╚══════════════════════════════════════════════╝
"""


def main():
    no_bots = "--no-bots" in sys.argv

    while True:
        print(MENU)
        try:
            choice = input("  Enter option: ").strip()
        except (EOFError, KeyboardInterrupt):
            print("\n  Goodbye!")
            break

        actions = {
            "0":  lambda: sys.exit(0),
            "1":  service_status,
            "2":  restart_service,
            "3":  stop_service,
            "4":  start_service,
            "5":  health_check,
            "10": lambda: reset_database(create_bots=True),
            "11": lambda: reset_database(create_bots=False),
            "12": show_analytics,
            "13": view_saves,
            "20": show_bots,
            "21": add_bots,
            "22": remove_bots,
            "30": view_logs,
            "31": tail_logs,
            "40": list_backups,
            "41": create_backup_now,
            "42": restore_backup,
            "50": manage_admin_panel,
        }

        action = actions.get(choice)
        if action:
            try:
                action()
            except Exception as e:
                print(f"\n  ERROR: {e}")
        else:
            print("  Invalid option. Please try again.")

        input("\n  Press Enter to continue...")


if __name__ == "__main__":
    main()
