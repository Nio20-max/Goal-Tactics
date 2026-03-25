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
import hashlib
import random
import uuid
from dataclasses import dataclass
from datetime import datetime, timezone, timedelta
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

INITIAL_SQUAD_POSITIONS = ["GK", "GK", "DEF", "DEF", "DEF", "DEF", "DEF", "DEF", "MID", "MID", "MID", "MID", "MID", "MID", "FWD", "FWD", "FWD", "FWD"]
FIRST_NAMES = [
    "Manuel", "Lukas", "Jonas", "David", "Mika", "Tobias", "Felix", "Marco", "Adrian", "Dominik",
    "Sebastian", "Florian", "Jan", "Leon", "Patrick", "Simon", "Max", "Philipp", "Julian", "Vincent",
    "Benjamin", "Moritz", "Fabian", "Nico", "Samuel", "Luis", "Tom", "Mats", "Noah", "Finn"
]
LAST_NAMES = [
    "Neuer", "Schneider", "Vogel", "Mertens", "Lindner", "Baumann", "Reiter", "Hartmann", "Keller", "Schuster",
    "Brandt", "Scholz", "Bergmann", "Fischer", "Mueller", "Weber", "Meier", "Wagner", "Becker", "Hoffmann",
    "Koch", "Richter", "Klein", "Wolf", "Schroeder", "Neumann", "Zimmermann", "Jaeger", "Kaiser", "Schwarz"
]
ORIGINS = ["Germany", "Austria", "Switzerland", "Slovenia", "Ireland", "Lithuania", "France", "Spain", "Italy", "Netherlands", "Belgium", "Portugal", "Sweden", "Brazil", "Argentina"]


@dataclass
class BotPreSimSummary:
    total_bots: int = 0
    matched_teams: int = 0
    updated_teams: int = 0
    skipped_missing_team: int = 0
    players_replaced: int = 0


PRE_SIM_INTENSITY_MODIFIERS = {
    "light": {
        "age_mult": 0.75,
        "infra_mult": 0.65,
        "training_mult": 0.82,
        "talent_bonus": 0,
    },
    "medium": {
        "age_mult": 1.0,
        "infra_mult": 1.0,
        "training_mult": 1.0,
        "talent_bonus": 0,
    },
    "heavy": {
        "age_mult": 1.35,
        "infra_mult": 1.32,
        "training_mult": 1.2,
        "talent_bonus": 1,
    },
}

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


def _stable_rng(seed_text: str) -> random.Random:
    digest = hashlib.sha256(seed_text.encode("utf-8")).digest()
    return random.Random(int.from_bytes(digest[:8], "big", signed=False))


def _utc_iso(dt: datetime) -> str:
    return dt.astimezone(timezone.utc).replace(microsecond=0).strftime("%Y-%m-%dT%H:%M:%SZ")


def normalize_intensity(intensity: str) -> str:
    key = (intensity or "medium").strip().lower()
    return key if key in PRE_SIM_INTENSITY_MODIFIERS else "medium"


def choose_pre_sim_intensity() -> str:
    print("  Choose pre-simulation intensity:")
    print("    1) light  - conservative progression")
    print("    2) medium - balanced progression")
    print("    3) heavy  - aggressive progression")
    choice = input("  Intensity [2]: ").strip()
    mapping = {
        "": "medium",
        "1": "light",
        "2": "medium",
        "3": "heavy",
        "light": "light",
        "medium": "medium",
        "heavy": "heavy",
    }
    return mapping.get(choice.lower(), "medium")


def seat_caps_for_tier(league_tier: int) -> tuple[int, int, int]:
    if league_tier == 1:
        return (2800, 35000, 60000)
    if league_tier == 2:
        return (2300, 28500, 48000)
    if league_tier == 3:
        return (1900, 24000, 38000)
    return (1700, 20000, 30000)


def daily_main_training_gain(age: int, talent: int, training_center_level: int) -> float:
    level = max(1, min(20, int(training_center_level)))
    base_gain = 0.10 + (0.02 * max(1, min(10, int(talent)))) + (0.03 * level)

    if age <= 16:
        age_bonus = 0.18
    elif age == 17:
        age_bonus = 0.17
    elif age == 18:
        age_bonus = 0.16
    elif age == 19:
        age_bonus = 0.14
    elif age == 20:
        age_bonus = 0.12
    elif age == 21:
        age_bonus = 0.10
    elif age == 22:
        age_bonus = 0.08
    elif age == 23:
        age_bonus = 0.06
    elif age == 24:
        age_bonus = 0.04
    elif age == 25:
        age_bonus = 0.02
    elif age == 26:
        age_bonus = 0.0
    elif age == 27:
        age_bonus = -0.03
    elif age == 28:
        age_bonus = -0.06
    elif age == 29:
        age_bonus = -0.10
    elif age == 30:
        age_bonus = -0.14
    elif age == 31:
        age_bonus = -0.18
    elif age == 32:
        age_bonus = -0.22
    elif age == 33:
        age_bonus = -0.26
    else:
        age_bonus = -0.32

    return max(0.02, round(base_gain + age_bonus, 3))


def individual_training_gain(age: int, talent: int, fitness: int) -> float:
    if age <= 18:
        age_factor = 1.25
    elif age <= 22:
        age_factor = 1.10
    elif age <= 27:
        age_factor = 0.95
    elif age <= 30:
        age_factor = 0.75
    elif age <= 33:
        age_factor = 0.55
    else:
        age_factor = 0.35

    fitness_factor = 0.70 + (max(0, min(100, fitness)) / 250.0)
    base_gain = 0.20 + (0.03 * max(1, min(10, talent)))
    return round(base_gain * age_factor * fitness_factor, 3)


def derive_team_age_years(activity: int, rng: random.Random, intensity: str = "medium") -> float:
    act = max(0, min(100, activity)) / 100.0
    mod = PRE_SIM_INTENSITY_MODIFIERS[normalize_intensity(intensity)]
    # Low-activity bots are often younger; high-activity bots have a larger historical footprint.
    base_years = (0.15 + (3.6 * act) + rng.uniform(0.0, 2.8)) * mod["age_mult"]
    return min(7.5, max(0.1, base_years))


def facility_level_for_age(age_years: float, activity: int) -> int:
    if age_years >= 1.0:
        return 20
    activity_factor = 0.55 + (max(0, min(100, activity)) / 220.0)
    return max(1, min(20, int(round(1 + (age_years * 19 * activity_factor)))))


def build_stadium_state(age_years: float, activity: int, league_tier: int, intensity: str = "medium") -> tuple[int, int, int, int]:
    mod = PRE_SIM_INTENSITY_MODIFIERS[normalize_intensity(intensity)]
    vip_cap, sit_cap, stand_cap_by_tier = seat_caps_for_tier(league_tier)
    stand_cap = min(60000, stand_cap_by_tier)

    if age_years <= 1.0:
        growth = max(0.0, age_years)
        vip = 200 + int(growth * (80 + activity * 2) * mod["infra_mult"])
        sit = 2500 + int(growth * (900 + activity * 20) * mod["infra_mult"])
        stand = 2300 + int(growth * (1400 + activity * 45) * mod["infra_mult"])
    else:
        growth_years = age_years - 1.0
        vip = 200 + int(growth_years * (140 + activity * 5) * mod["infra_mult"])
        sit = 2500 + int(growth_years * (1400 + activity * 55) * mod["infra_mult"])
        stand = 2300 + int(growth_years * (2600 + activity * 160) * mod["infra_mult"])

    vip = max(200, min(vip_cap, vip))
    sit = max(2500, min(sit_cap, sit))
    stand = max(2300, min(stand_cap, stand))
    return (20 if age_years >= 1.0 else facility_level_for_age(age_years, activity), vip, sit, stand)


def project_strength_from_training_curve(
    age: int,
    talent: int,
    training_center_level: int,
    activity: int,
    youth_focus: int,
    rng: random.Random,
    intensity: str = "medium",
    elite_profile: bool = False,
) -> float:
    age = max(16, min(35, age))
    talent = max(9 if elite_profile else 4, min(10, talent))
    activity = max(0, min(100, activity))
    youth_focus = max(0, min(100, youth_focus))
    training_center_level = max(1, min(20, training_center_level))
    mod = PRE_SIM_INTENSITY_MODIFIERS[normalize_intensity(intensity)]

    start_age = 16 if youth_focus >= 55 else 17

    # Assume bots initially scouted quality players before long-term development.
    scouting_quality = 0.45 + (activity / 220.0) + (youth_focus / 180.0)
    scouted_base_strength = 300.0 + (talent * 14.0) + (scouting_quality * 40.0) if elite_profile else 50.0 + (talent * 2.6) + (scouting_quality * 6.0)
    strength = scouted_base_strength + rng.uniform(-1.8, 1.8)

    training_factor = (
        0.0044 * (0.95 + (activity / 170.0) + (youth_focus / 230.0)) * mod["training_mult"]
        if elite_profile
        else 0.0098 * (0.85 + (activity / 180.0) + (youth_focus / 260.0)) * mod["training_mult"]
    )

    for year_age in range(start_age, age):
        main = daily_main_training_gain(year_age, talent, training_center_level)
        sub = main * 0.18

        # Virtual development assumes regular individual plans and recurring camps.
        fitness = int(max(82, min(100, 86 + (training_center_level // 2) + rng.randint(-4, 4))))
        individual = individual_training_gain(year_age, talent, fitness)
        if elite_profile:
            # Elite top teams are assumed to run individual programs from age 16 continuously.
            individual_coverage = 1.0
            camp_coverage = max(0.10, min(0.34, 0.10 + (activity / 900.0) + (youth_focus / 700.0)))
        else:
            individual_coverage = max(0.30, min(0.96, 0.38 + (activity / 210.0) + (youth_focus / 260.0)))
            camp_coverage = max(0.02, min(0.26, 0.03 + (activity / 1000.0) + (youth_focus / 850.0)))

        daily_effective = main + sub + (individual * individual_coverage) + (1.5 * camp_coverage)
        yearly_growth = 365.0 * daily_effective * training_factor
        strength += yearly_growth

    peak_cap = (
        610.0 + ((talent - 9) * 24.0) + ((activity - 85) * 0.8) + ((youth_focus - 80) * 0.65)
        if elite_profile
        else 53.0 + (talent * 4.0) + (activity * 0.12) + (youth_focus * 0.05)
    )
    if age <= 20:
        peak_cap -= 35.0 if elite_profile else 5.0
    elif age >= 31:
        peak_cap -= min(95.0, (age - 30) * 18.0) if elite_profile else min(8.0, (age - 30) * 1.4)

    peak_cap = max(420.0, min(600.0, peak_cap)) if elite_profile else max(62.0, min(97.0, peak_cap))
    strength = min(strength, peak_cap)

    if age >= 30:
        strength -= (age - 29) * (16.0 if elite_profile else 0.95)

    if elite_profile:
        return round(max(360.0, min(600.0, strength)), 2)
    return round(max(48.0, min(97.0, strength)), 2)


def _player_training_focus(position: str) -> str:
    return {
        "GK": "keeping",
        "DEF": "defence",
        "MID": "playmaking",
        "FWD": "shots",
    }.get(position, "playmaking")


def _skills_for_strength(position: str, strength: float, rng: random.Random) -> dict[str, float]:
    base = strength * 0.90
    primary = {"GK": [1], "DEF": [0, 6], "MID": [3, 4, 5], "FWD": [2, 8, 9]}.get(position, [3, 4])
    secondary = {"GK": [0, 6], "DEF": [8, 9], "MID": [6, 9], "FWD": [4, 7]}.get(position, [9])

    out: dict[str, float] = {}
    for idx in range(14):
        value = base + rng.uniform(-12.0, 12.0)
        if idx in primary:
            value += strength * 0.16
        elif idx in secondary:
            value += strength * 0.07
        out[f"skill_{idx}"] = round(max(40.0, value), 2)
    return out


def _position_base_strength(position: str) -> float:
    return {
        "GK": 1.6,
        "DEF": 1.1,
        "MID": 1.2,
        "FWD": 1.3,
    }.get(position, 1.0)


def _estimate_market_value(strength: float, age: int, talent: int) -> float:
    age_factor = 1.28 if age <= 21 else 1.15 if age <= 25 else 1.0 if age <= 29 else 0.82 if age <= 32 else 0.67
    raw = (strength ** 2) * 860.0 * age_factor + (talent * 125000.0)
    return round(max(250000.0, raw), 2)


def _generate_squad(
    team_id: str,
    team_name: str,
    age_years: float,
    activity: int,
    youth_focus: int,
    training_center_level: int,
    intensity: str = "medium",
) -> list[dict]:
    rng = _stable_rng(f"{team_id}:{team_name}:{activity}:{youth_focus}:{age_years:.3f}")

    mod = PRE_SIM_INTENSITY_MODIFIERS[normalize_intensity(intensity)]
    elite_profile = activity >= 85 and youth_focus >= 80 and age_years >= 2.0 and intensity == "heavy"
    young_slots = max(2, min(9, 2 + (youth_focus // 16) + (activity // 45) + (1 if intensity == "heavy" else 0)))
    veteran_slots = max(1, min(5, int(age_years) + (0 if youth_focus >= 65 else 1)))
    prime_slots = max(0, 18 - young_slots - veteran_slots)

    ages: list[int] = []
    for _ in range(young_slots):
        ages.append(rng.randint(17, 22))
    for _ in range(prime_slots):
        ages.append(rng.randint(23, 28))
    for _ in range(veteran_slots):
        ages.append(rng.randint(29, 34))
    rng.shuffle(ages)

    players: list[dict] = []
    now_utc = datetime.now(timezone.utc)
    for idx, position in enumerate(INITIAL_SQUAD_POSITIONS):
        age = ages[idx % len(ages)]
        if elite_profile:
            talent = 9 if rng.random() < 0.35 else 10
        else:
            base_talent = 4 + (activity // 23) + (2 if age_years >= 2.0 else 0)
            if age <= 21:
                base_talent += youth_focus // 25
            elif age >= 31:
                base_talent -= 1
            talent = max(4, min(10, base_talent + int(mod["talent_bonus"]) + rng.randint(-1, 1)))

        projected = project_strength_from_training_curve(
            age,
            talent,
            training_center_level,
            activity,
            youth_focus,
            rng,
            intensity=intensity,
            elite_profile=elite_profile,
        )
        if elite_profile:
            strength = round(max(420.0, min(600.0, projected + rng.uniform(-9.0, 9.0))), 2)
        else:
            strength = round(max(48.0, min(97.0, projected + _position_base_strength(position) + rng.uniform(-1.4, 1.4))), 2)

        first = FIRST_NAMES[(rng.randrange(len(FIRST_NAMES)) + idx) % len(FIRST_NAMES)]
        last = LAST_NAMES[(rng.randrange(len(LAST_NAMES)) + idx * 3) % len(LAST_NAMES)]
        market_value = _estimate_market_value(strength, age, talent)

        contract_days = rng.randint(200, 1200)
        contract_end = _utc_iso(now_utc + timedelta(days=contract_days))
        individual_until = _utc_iso(now_utc + timedelta(days=365))
        player_id = uuid.uuid4().hex
        skills = _skills_for_strength(position, strength, rng)

        players.append({
            "id": player_id,
            "team_id": team_id,
            "name": f"{first} {last}",
            "origin": ORIGINS[(rng.randrange(len(ORIGINS)) + idx) % len(ORIGINS)],
            "position": position,
            "shirt_number": idx + 1,
            "age": age,
            "talent": talent,
            "strength": strength,
            "fitness": rng.randint(84, 100),
            "matches": int(max(0, age_years * rng.uniform(6.0, 11.0))),
            "goals": 0,
            "yellow_cards": 0,
            "red_cards": 0,
            "individual_training_skill": _player_training_focus(position),
            "individual_training_until_utc": individual_until,
            "contract_end_utc": contract_end,
            "is_scouted": 0,
            "scouting_ready_at_utc": None,
            "head": "01_head-A01",
            "body": "01_body-A00",
            "gloves": "01_Gloves01",
            "shoes": "01_Shoes01",
            "is_premium_scout": 0,
            "market_value": market_value,
            "skill_0": skills["skill_0"],
            "skill_1": skills["skill_1"],
            "skill_2": skills["skill_2"],
            "skill_3": skills["skill_3"],
            "skill_4": skills["skill_4"],
            "skill_5": skills["skill_5"],
            "skill_6": skills["skill_6"],
            "skill_7": skills["skill_7"],
            "skill_8": skills["skill_8"],
            "skill_9": skills["skill_9"],
            "skill_10": skills["skill_10"],
            "skill_11": skills["skill_11"],
            "skill_12": skills["skill_12"],
            "skill_13": skills["skill_13"],
            "suspension_matches_remaining": 0,
            "experience": round(max(0.0, (strength * 0.9) + (age * 1.2) + rng.uniform(-6.0, 6.0)), 2),
        })

    return players


def pre_simulate_bot_teams(max_wait_seconds: int = 300, poll_seconds: int = 5, intensity: str = "medium") -> BotPreSimSummary:
    summary = BotPreSimSummary()
    intensity = normalize_intensity(intensity)

    if not os.path.exists(BOT_DB_PATH):
        print("  Bot database not found, skipping pre-simulation.")
        return summary
    if not os.path.exists(DB_PATH):
        print("  Main database not found, skipping pre-simulation.")
        return summary

    waited = 0
    bots: list[dict] = []
    while waited <= max_wait_seconds:
        bots = db_query(BOT_DB_PATH, "SELECT BotId, TeamName, Activity, YouthFocus FROM Bots")
        if bots:
            bot_ids = [b["BotId"] for b in bots if b.get("BotId")]
            placeholders = ",".join(["?"] * len(bot_ids))
            matched = db_query(DB_PATH, f"SELECT COUNT(*) as c FROM teams WHERE user_id IN ({placeholders})", tuple(bot_ids)) if bot_ids else []
            matched_count = matched[0]["c"] if matched else 0
            if matched_count >= max(1, int(len(bot_ids) * 0.8)) or waited >= max_wait_seconds:
                break

        if waited >= max_wait_seconds:
            break

        time.sleep(poll_seconds)
        waited += poll_seconds

    summary.total_bots = len(bots)
    if not bots:
        print("  No bots found in bot DB, skipping pre-simulation.")
        return summary

    by_bot_id = {b["BotId"]: b for b in bots if b.get("BotId")}
    bot_ids = list(by_bot_id.keys())
    placeholders = ",".join(["?"] * len(bot_ids))
    teams = db_query(
        DB_PATH,
        f"""
        SELECT t.id as team_id, t.user_id, t.name as team_name, t.league_tier
        FROM teams t
        WHERE t.user_id IN ({placeholders})
        """,
        tuple(bot_ids),
    )
    summary.matched_teams = len(teams)
    summary.skipped_missing_team = max(0, summary.total_bots - summary.matched_teams)

    if not teams:
        print("  Bot teams are not registered yet in the main DB, skipping pre-simulation.")
        return summary

    con = sqlite3.connect(DB_PATH)
    try:
        now_utc = datetime.now(timezone.utc)
        cur = con.cursor()

        for team in teams:
            user_id = team["user_id"]
            team_id = team["team_id"]
            league_tier = int(team.get("league_tier") or 4)
            bot = by_bot_id.get(user_id)
            if bot is None:
                continue

            activity = int(bot.get("Activity") or 50)
            youth_focus = int(bot.get("YouthFocus") or 50)
            rng = _stable_rng(f"presim:{user_id}:{team_id}")
            age_years = derive_team_age_years(activity, rng, intensity=intensity)

            created_at = now_utc - timedelta(days=int(age_years * 365.0))
            idle_hours = int((100 - max(0, min(100, activity))) * 0.9)
            last_activity = now_utc - timedelta(hours=idle_hours)

            level, vip, sit, stand = build_stadium_state(age_years, activity, league_tier, intensity=intensity)
            training_level = level if age_years >= 1.0 else max(level, 5)

            cur.execute(
                """
                UPDATE users
                SET created_at = ?, last_login_at = ?, last_activity_at = ?
                WHERE id = ?
                """,
                (_utc_iso(created_at), _utc_iso(last_activity), _utc_iso(last_activity), user_id),
            )

            cur.execute(
                """
                UPDATE team_resources
                SET office_level = ?,
                    training_center_level = ?,
                    medical_center_level = ?,
                    youth_academy_level = ?,
                    fan_shop_level = ?,
                    parking_level = ?,
                    stadium_vip_seats = ?,
                    stadium_sit_seats = ?,
                    stadium_stand_seats = ?,
                    last_economy_tick_utc = ?,
                    last_training_tick_utc = ?
                WHERE team_id = ?
                """,
                (level, training_level, level, level, level, level, vip, sit, stand, _utc_iso(now_utc), _utc_iso(now_utc), team_id),
            )

            cur.execute("DELETE FROM team_players WHERE team_id = ? AND is_scouted = 0", (team_id,))
            squad = _generate_squad(
                team_id,
                team.get("team_name") or "Bot Team",
                age_years,
                activity,
                youth_focus,
                training_level,
                intensity=intensity,
            )
            summary.players_replaced += len(squad)

            for p in squad:
                cur.execute(
                    """
                    INSERT INTO team_players (
                        id, team_id, name, origin, position, shirt_number, age, talent, strength, fitness,
                        matches, goals, yellow_cards, red_cards, individual_training_skill, individual_training_until_utc,
                        contract_end_utc, is_scouted, scouting_ready_at_utc, head, body, gloves, shoes,
                        is_premium_scout, market_value,
                        skill_0, skill_1, skill_2, skill_3, skill_4, skill_5, skill_6,
                        skill_7, skill_8, skill_9, skill_10, skill_11, skill_12, skill_13,
                        suspension_matches_remaining, experience
                    ) VALUES (
                        :id, :team_id, :name, :origin, :position, :shirt_number, :age, :talent, :strength, :fitness,
                        :matches, :goals, :yellow_cards, :red_cards, :individual_training_skill, :individual_training_until_utc,
                        :contract_end_utc, :is_scouted, :scouting_ready_at_utc, :head, :body, :gloves, :shoes,
                        :is_premium_scout, :market_value,
                        :skill_0, :skill_1, :skill_2, :skill_3, :skill_4, :skill_5, :skill_6,
                        :skill_7, :skill_8, :skill_9, :skill_10, :skill_11, :skill_12, :skill_13,
                        :suspension_matches_remaining, :experience
                    )
                    """,
                    p,
                )

            top11 = sorted((x["strength"] for x in squad), reverse=True)[:11]
            team_strength = int(round(sum(top11) / max(1, len(top11))))
            team_market_value = round(sum(x["market_value"] for x in squad), 2)
            fans = int(120 + age_years * 1200 + activity * 45)

            cur.execute(
                "UPDATE teams SET strength = ?, market_value = ?, fans = ?, members = ? WHERE id = ?",
                (team_strength, team_market_value, fans, max(100, fans // 2), team_id),
            )
            cur.execute("UPDATE league_teams SET strength = ? WHERE team_id = ?", (str(team_strength), team_id))

            summary.updated_teams += 1

        con.commit()
    finally:
        con.close()

    return summary


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

    pre_simulate_bots = False
    pre_sim_intensity = "medium"
    if create_bots:
        pre_simulate_bots = confirm("Pre-simulate bot teams after reset (fictional team age, stadium growth, trained squad)?")
        if pre_simulate_bots:
            pre_sim_intensity = choose_pre_sim_intensity()

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
        if pre_simulate_bots:
            print(f"  Running bot pre-simulation ({pre_sim_intensity}) (waiting for registrations first)...")
            summary = pre_simulate_bot_teams(max_wait_seconds=300, poll_seconds=5, intensity=pre_sim_intensity)
            print("  Pre-simulation summary:")
            print(f"    Intensity:             {pre_sim_intensity}")
            print(f"    Bots in bot DB:        {summary.total_bots}")
            print(f"    Bot teams matched:     {summary.matched_teams}")
            print(f"    Teams pre-simulated:   {summary.updated_teams}")
            print(f"    Missing team matches:  {summary.skipped_missing_team}")
            print(f"    Players regenerated:   {summary.players_replaced}")
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
    # A very high poll interval ensures it exits after registration instead of entering the main loop
    print(f"  Starting bot registration process for {count} new bots...")
    result = run_cmd([
        "/usr/bin/dotnet", f"{INSTALL_ROOT}/bots/GoalTacticsBots.dll",
        f"--api-url=http://127.0.0.1:5195",
        f"--db-path={BOT_DB_PATH}",
        f"--bot-count={new_target}",
        "--poll-interval=999999"
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
    # Parse CLI flags (e.g., --no-bots to change default reset behavior)
    create_bots_default = "--no-bots" not in sys.argv

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
            "10": lambda: reset_database(create_bots=create_bots_default),
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
