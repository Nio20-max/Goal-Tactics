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
import urllib.request
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
TMP_DIR     = f"{DATA_ROOT}/tmp"
INSTALL_ROOT = "/opt/goaltactics"
SERVICE_NAME = "goaltactics.service"
ADMIN_PANEL_SERVICE = "goaltactics-admin-panel.service"
DISABLE_BOTS_FLAG_PATH = f"{TMP_DIR}/disable_bots"

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

PRE_SIM_MAX_AGE_YEARS = {
    "light": 8.5,
    "medium": 8.5,
    "heavy": 30.0,
}

# Pre-simulation progression target: mirror notebook A4 semantics.
A4_MAIN_WEIGHT = 0.55
A4_BONUS_WEIGHT = 0.25
A4_OVERALL_WEIGHT = 0.20
A4_STRENGTH_MULTIPLIER = 1.4

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


def wait_for_api_health(timeout_seconds: int = 120, poll_seconds: int = 2) -> bool:
    deadline = time.time() + timeout_seconds
    while time.time() < deadline:
        try:
            with urllib.request.urlopen("http://127.0.0.1:5195/health", timeout=5) as response:
                if response.status == 200:
                    return True
        except Exception:
            pass
        time.sleep(poll_seconds)
    return False


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
    intensity = normalize_intensity(intensity)
    mod = PRE_SIM_INTENSITY_MODIFIERS[intensity]
    max_age = PRE_SIM_MAX_AGE_YEARS.get(intensity, 8.5)
    # Increase baseline to reflect more seasons run in stable bots. High activity means deeper history.
    base_years = (1.0 + (4.1 * act) + rng.uniform(1.0, 3.6)) * mod["age_mult"]
    return min(max_age, max(2.0, base_years))


def facility_level_for_age(age_years: float, activity: int, youth_focus: int, intensity: str = "medium") -> int:
    intensity = normalize_intensity(intensity)
    mod = PRE_SIM_INTENSITY_MODIFIERS[intensity]
    max_age = PRE_SIM_MAX_AGE_YEARS.get(intensity, 8.5)
    age_signal = _clamp(age_years / max_age, 0.0, 1.0)
    activity_signal = max(0, min(100, activity)) / 100.0
    youth_signal = max(0, min(100, youth_focus)) / 100.0

    # Infrastructure progression should reflect both club maturity and development intent.
    infra_signal = 0.20 + (age_signal * 0.55 * mod["infra_mult"]) + (((activity_signal * 0.45) + (youth_signal * 0.55)) * 0.25)
    return max(1, min(20, int(round(1 + (19 * _clamp(infra_signal, 0.0, 1.0))))))


def training_quality_multiplier(activity: int, youth_focus: int, intensity: str = "medium") -> float:
    mod = PRE_SIM_INTENSITY_MODIFIERS[normalize_intensity(intensity)]
    activity_signal = max(0, min(100, activity)) / 100.0
    youth_signal = max(0, min(100, youth_focus)) / 100.0

    # Activity approximates routine consistency, youth focus approximates development effort.
    base_quality = 0.82 + (activity_signal * 0.18) + (youth_signal * 0.20)
    return round(_clamp(base_quality * mod["training_mult"], 0.70, 1.45), 3)


def build_stadium_state(age_years: float, activity: int, youth_focus: int, league_tier: int, intensity: str = "medium") -> tuple[int, int, int, int]:
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
    level = facility_level_for_age(age_years, activity, youth_focus, intensity=intensity)
    return (level, vip, sit, stand)


def project_strength_from_training_curve(
    age: int,
    talent: int,
    training_center_level: int,
    activity: int,
    youth_focus: int,
    rng: random.Random,
    intensity: str = "medium",
) -> float:
    age = max(16, min(35, age))
    talent = max(4, min(10, talent))
    activity = max(0, min(100, activity))
    youth_focus = max(0, min(100, youth_focus))
    training_center_level = max(1, min(20, training_center_level))

    # Start age and training quality should depend on scouting behavior, not hardcoded elite paths.
    min_scout_age, max_scout_age = _select_scout_age_range(activity, youth_focus)
    start_age = rng.randint(min_scout_age, min(max_scout_age, max(16, age)))
    seed = rng.randint(1, 10_000_000)
    base_strength = _generate_scouted_strength("MID", talent, seed)
    base_strength = max(50.0, min(90.0, base_strength))

    initial_fitness = int(max(50, min(100, 72 + (activity / 4.0) + rng.randint(-8, 8))))
    days_per_year = {
        "light": 24,
        "medium": 30,
        "heavy": 36,
    }[normalize_intensity(intensity)]
    gain_mult = training_quality_multiplier(activity, youth_focus, intensity=intensity)

    strength, _, _, _ = _simulate_strength_progression(
        start_age=start_age,
        target_age=age,
        talent=talent,
        position="MID",
        training_center_level=training_center_level,
        initial_strength=base_strength,
        initial_fitness=initial_fitness,
        days_per_year=days_per_year,
        fixed_main_training=True,
        gain_multiplier=gain_mult,
        strength_multiplier=A4_STRENGTH_MULTIPLIER,
        main_weight=A4_MAIN_WEIGHT,
        bonus_weight=A4_BONUS_WEIGHT,
        overall_weight=A4_OVERALL_WEIGHT,
    )
    return round(max(1.0, min(700.0, strength)), 2)


def _player_training_focus(position: str) -> str:
    return {
        "GK": "keeping",
        "DEF": "defence",
        "MID": "playmaking",
        "FWD": "shots",
    }.get(position, "playmaking")


def _clamp(value: float, mn: float, mx: float) -> float:
    return max(mn, min(mx, value))


def _main_skill_index(position: str) -> int:
    return {
        "GK": 1,
        "DEF": 0,
        "MID": 3,
        "FWD": 2,
    }.get(position.upper(), 3)


def _build_bonus_skills(position: str) -> list[int]:
    return {
        "GK": [1, 13, 13, 12],
        "DEF": [0, 13, 12, 11],
        "MID": [11, 10, 9, 8],
        "FWD": [6, 5, 4, 3],
    }.get(position.upper(), [0, 1])


def _clamp_skill(skill: float) -> float:
    return _clamp(skill, 1.0, 700.0)


def _build_skills(strength: float, position: str, talent: int, age: int, bonus_skill_indices: list[int] | None = None) -> list[float]:
    # Mirrors LegacyAppCompatibility.BuildSkills behavior used by the attached simulator.
    primary_skill = _main_skill_index(position)
    bonus_skills = bonus_skill_indices or _build_bonus_skills(position)
    age_factor = max(0.85, 1.18 - (max(16, age) - 16) / 60)
    talent_factor = 0.92 + (talent / 50.0)
    base_skill = max(18.0, strength * 0.48 * age_factor * talent_factor)

    skills: list[float] = []
    for idx in range(14):
        if idx == primary_skill:
            weight = 1.95
        elif idx in bonus_skills:
            weight = 1.28
        else:
            weight = 0.62
        skills.append(max(20.0, round(base_skill * weight, 10)))
    return skills


def _calculate_strength_from_skills(
    skills: list[float],
    position: str,
    fitness: int,
    age: int,
    talent: int,
    bonus_skill_indices: list[int] | None = None,
    strength_multiplier: float = 1.0,
    main_weight: float = 0.55,
    bonus_weight: float = 0.25,
    overall_weight: float = 0.20,
) -> float:
    if not skills or len(skills) < 14:
        return 1.0

    main_idx = _main_skill_index(position)
    bonus_idx = bonus_skill_indices or _build_bonus_skills(position)

    main = _clamp_skill(skills[main_idx])
    bonus_vals = [_clamp_skill(skills[i]) for i in bonus_idx if 0 <= i < len(skills) and i != main_idx]
    bonus_avg = sum(bonus_vals) / len(bonus_vals) if bonus_vals else 0.0
    overall_avg = sum(_clamp_skill(x) for x in skills) / len(skills)

    fit_factor = 0.80 + _clamp(fitness, 0, 100) / 500.0
    age_factor = 0.98 if age <= 20 else 1.02 if age <= 24 else 1.00 if age <= 30 else 0.97 if age <= 34 else 0.94
    talent_factor = 0.95 + _clamp(talent, 1, 10) * 0.01

    base_strength = (main_weight * main) + (bonus_weight * bonus_avg) + (overall_weight * overall_avg)
    strength = base_strength * fit_factor * age_factor * talent_factor * strength_multiplier
    return _clamp(round(strength, 2), 1.0, 700.0)


def _generate_scouted_strength(position: str, talent: int, seed: int) -> float:
    rng = random.Random(seed)
    base_str = {
        "GK": 68.0,
        "DEF": 62.0,
        "MID": 63.0,
        "FWD": 64.0,
    }.get(position.upper(), 60.0)
    bonus = rng.randint(-5, 14)
    tier_bonus = rng.randint(2, 7) if talent >= 8 else 0
    return _clamp(base_str + bonus + tier_bonus, 50.0, 90.0)


def _simulate_strength_progression(
    start_age: int,
    target_age: int,
    talent: int,
    position: str,
    training_center_level: int,
    initial_strength: float,
    initial_fitness: int,
    days_per_year: int = 30,
    fixed_main_training: bool = True,
    gain_multiplier: float = 1.0,
    strength_multiplier: float = A4_STRENGTH_MULTIPLIER,
    main_weight: float = A4_MAIN_WEIGHT,
    bonus_weight: float = A4_BONUS_WEIGHT,
    overall_weight: float = A4_OVERALL_WEIGHT,
) -> tuple[float, list[float], float, float]:
    start_age = max(16, min(35, start_age))
    target_age = max(start_age, min(35, target_age))
    training_center_level = max(1, min(20, int(training_center_level)))
    gain_multiplier = max(0.1, min(2.0, float(gain_multiplier)))

    bonus_skills = _build_bonus_skills(position)
    skills = _build_skills(initial_strength, position, talent, start_age, bonus_skills)
    fitness = _clamp(initial_fitness, 0, 100)
    experience = max(10.0, (initial_strength * 1.4) + max(0, start_age - 16) * 11.0)

    strength = _calculate_strength_from_skills(
        skills,
        position,
        int(fitness),
        start_age,
        talent,
        bonus_skills,
        strength_multiplier=strength_multiplier,
        main_weight=main_weight,
        bonus_weight=bonus_weight,
        overall_weight=overall_weight,
    )

    total_days = int((target_age - start_age) * days_per_year)
    for day_index in range(1, total_days + 1):
        age_year = start_age + (day_index - 1) // days_per_year

        # Applied model: changing team training focus + individual main-skill + 1.5 experience camp.
        main_gain = daily_main_training_gain(age_year, talent, training_center_level)
        sub_gain = round(main_gain * 0.18, 3)
        individual = individual_training_gain(age_year, talent, int(fitness))
        daily_total_gain = (main_gain + sub_gain + individual) * gain_multiplier

        if fixed_main_training:
            main_idx = _main_skill_index(position)
            sub_idx = (main_idx + 1) % 14
        else:
            # Rotating team training by skill index.
            main_idx = day_index % 14
            sub_idx = (day_index + 1) % 14

        skills[main_idx] = _clamp_skill(skills[main_idx] + (daily_total_gain * 0.65))
        skills[sub_idx] = _clamp_skill(skills[sub_idx] + (daily_total_gain * 0.35))

        # Individual training always boosts the currently trained main skill.
        skills[main_idx] = _clamp_skill(skills[main_idx] + individual)

        # Camp choice is fixed to +1.5 experience.
        experience += 1.5

        # Fitness gain mirrors backend rule: max(1, level/5)
        fitness = min(100.0, fitness + max(1, training_center_level // 5))

        strength = _calculate_strength_from_skills(
            skills,
            position,
            int(fitness),
            age_year,
            talent,
            bonus_skills,
            strength_multiplier=strength_multiplier,
            main_weight=main_weight,
            bonus_weight=bonus_weight,
            overall_weight=overall_weight,
        )

    return strength, skills, fitness, experience


def _select_scout_age_range(activity: int, youth_focus: int) -> tuple[int, int]:
    score = max(0, min(100, activity)) + max(0, min(100, youth_focus))
    if score >= 155:
        return (16, 21)
    if score >= 120:
        return (17, 23)
    if score >= 90:
        return (18, 25)
    return (20, 28)


def _simulate_player_history(
    team_age_years: float,
    activity: int,
    youth_focus: int,
    target_age: int,
    position: str,
    training_center_level: int,
    intensity: str,
    rng: random.Random,
) -> tuple[int, int, float, int, int, list[float], float, float]:
    total_seasons = max(1, int(round(team_age_years)))
    min_scout_age, max_scout_age = _select_scout_age_range(activity, youth_focus)

    # Scouting recency depends on activity + youth focus.
    base_scout_threshold = min(0.96, 0.24 + (activity / 220.0) + (youth_focus / 260.0))
    if rng.random() < base_scout_threshold:
        seasons_since_scout = rng.randint(1, max(1, total_seasons // 2))
        scouted_season = max(1, total_seasons - seasons_since_scout + 1)
        scout_age = rng.randint(min_scout_age, min(max_scout_age, 21))
    else:
        seasons_since_scout = rng.randint(max(1, total_seasons // 2), total_seasons)
        scouted_season = max(1, total_seasons - seasons_since_scout + 1)
        scout_age = rng.randint(min_scout_age, max_scout_age)

    base_age = scout_age + seasons_since_scout
    current_age = int(round((0.45 * target_age) + (0.55 * base_age)))
    current_age = max(16, min(35, current_age))

    base_talent = 6
    if current_age <= 21:
        base_talent += 1
    elif current_age >= 31:
        base_talent -= 1
    talent = max(4, min(10, base_talent + rng.randint(-2, 2)))

    seed = rng.randint(1, 10_000_000)
    initial_strength = _generate_scouted_strength(position, talent, seed)
    initial_fitness = int(_clamp(78 + (activity / 5.0) + rng.randint(-6, 6), 50, 100))

    days_per_year = {
        "light": 24,
        "medium": 30,
        "heavy": 36,
    }[normalize_intensity(intensity)]
    gain_mult = training_quality_multiplier(activity, youth_focus, intensity=intensity)

    strength, skills, fitness, experience = _simulate_strength_progression(
        start_age=scout_age,
        target_age=current_age,
        talent=talent,
        position=position,
        training_center_level=training_center_level,
        initial_strength=initial_strength,
        initial_fitness=initial_fitness,
        days_per_year=days_per_year,
        fixed_main_training=True,
        gain_multiplier=gain_mult,
        strength_multiplier=A4_STRENGTH_MULTIPLIER,
        main_weight=A4_MAIN_WEIGHT,
        bonus_weight=A4_BONUS_WEIGHT,
        overall_weight=A4_OVERALL_WEIGHT,
    )

    return current_age, talent, strength, scouted_season, seasons_since_scout, skills, fitness, experience


def _assign_league_tiers_by_strength(cur: sqlite3.Cursor, ranked_team_strengths: list[tuple[str, int]]) -> None:
    if not ranked_team_strengths:
        return

    tier_rows = cur.execute("SELECT DISTINCT tier FROM leagues ORDER BY tier ASC").fetchall()
    tiers = [int(r[0]) for r in tier_rows] if tier_rows else [1, 2, 3, 4]
    tier_name_rows = cur.execute("SELECT tier, MIN(name) FROM leagues GROUP BY tier").fetchall()
    tier_names = {int(t): n for t, n in tier_name_rows}

    total = len(ranked_team_strengths)
    sorted_rows = sorted(ranked_team_strengths, key=lambda x: x[1], reverse=True)
    tier_count = len(tiers)

    for rank, (team_id, _) in enumerate(sorted_rows):
        bucket = min(tier_count - 1, int((rank * tier_count) / max(1, total)))
        tier = tiers[bucket]
        league_name = tier_names.get(tier, f"Tier {tier}")
        cur.execute(
            "UPDATE teams SET league_tier = ?, league_name = ? WHERE id = ?",
            (tier, league_name, team_id),
        )


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

    # Enforce at least 2 seasons for maturity and avoid unrealistic brand-new team profiles.
    team_age_seasons = max(2, int(round(age_years)))

    # Historical player pool should be bounded for business rule: max 50 players per team.
    players_per_season = max(15, int(15 + (activity * 0.05) + (youth_focus * 0.08)))
    target_pool_size = max(20, min(50, int(team_age_seasons * players_per_season * 0.4)))

    # Keep a realistic active roster that fits within 50-team max.
    active_roster_size = max(14, min(24, 14 + int(team_age_seasons * 0.7) + (youth_focus // 35)))
    active_targets = {
        "GK": 3,
        "DEF": 9,
        "MID": 9,
        "FWD": max(3, active_roster_size - 21),
    }

    # Position distribution based on bot needs/profile.
    gk_ratio = 0.08
    def_ratio = 0.33 - (youth_focus / 2500.0)
    mid_ratio = 0.32 + (youth_focus / 2200.0)
    fwd_ratio = max(0.15, 1.0 - (gk_ratio + def_ratio + mid_ratio))

    pool_targets = {
        "GK": max(2, int(target_pool_size * gk_ratio)),
        "DEF": max(5, int(target_pool_size * def_ratio)),
        "MID": max(5, int(target_pool_size * mid_ratio)),
        "FWD": max(3, int(target_pool_size * fwd_ratio)),
    }

    position_counts = {"GK": 0, "DEF": 0, "MID": 0, "FWD": 0}
    players: list[dict] = []
    now_utc = datetime.now(timezone.utc)

    for idx in range(target_pool_size):
        targets = active_targets if idx < active_roster_size else pool_targets
        need_scores = {
            pos: (targets.get(pos, 0) - position_counts[pos]) + rng.uniform(-0.35, 0.35)
            for pos in ["GK", "DEF", "MID", "FWD"]
        }
        position = max(need_scores, key=need_scores.get)
        position_counts[position] += 1

        youth_bias = min(0.80, 0.26 + (youth_focus / 220.0) + (activity / 420.0))
        veteran_bias = min(0.45, 0.16 + (activity / 350.0) - (youth_focus / 700.0))
        core_bias = 1.0 - youth_bias - veteran_bias
        core_bias = max(0.15, min(core_bias, 0.70))
        veteran_bias = max(0.08, min(veteran_bias, 0.50))

        r = rng.random()
        if r < youth_bias:
            target_age = rng.randint(16, 21)
        elif r < youth_bias + core_bias:
            target_age = rng.randint(22, 29)
        else:
            target_age = rng.randint(30, 35)

        age, talent, strength, scouted_season, training_seasons, skills_arr, fitness, experience = _simulate_player_history(
            team_age_years=age_years,
            activity=activity,
            youth_focus=youth_focus,
            target_age=target_age,
            position=position,
            training_center_level=training_center_level,
            intensity=intensity,
            rng=rng,
        )

        first = FIRST_NAMES[(rng.randrange(len(FIRST_NAMES)) + idx) % len(FIRST_NAMES)]
        last = LAST_NAMES[(rng.randrange(len(LAST_NAMES)) + idx * 3) % len(LAST_NAMES)]
        market_value = _estimate_market_value(strength, age, talent)

        contract_days = rng.randint(200, 1200)
        contract_end = _utc_iso(now_utc + timedelta(days=contract_days))
        individual_until = _utc_iso(now_utc + timedelta(days=365))
        player_id = uuid.uuid4().hex

        # Scouting flags are not surfaced as a special elite mode anymore.
        is_scouted = 0 if idx < active_roster_size else 1
        scouting_ready_at = None if is_scouted else _utc_iso(now_utc + timedelta(days=rng.randint(2, 12)))

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
            "fitness": int(fitness),
            "matches": int(30 * team_age_seasons),
            "goals": 0,
            "yellow_cards": 0,
            "red_cards": 0,
            "individual_training_skill": _player_training_focus(position),
            "individual_training_until_utc": individual_until,
            "contract_end_utc": contract_end,
            "is_scouted": is_scouted,
            "scouting_ready_at_utc": scouting_ready_at,
            "head": "01_head-A01",
            "body": "01_body-A00",
            "gloves": "01_Gloves01",
            "shoes": "01_Shoes01",
            "is_premium_scout": 0,
            "market_value": market_value,
            "skill_0": round(skills_arr[0], 2),
            "skill_1": round(skills_arr[1], 2),
            "skill_2": round(skills_arr[2], 2),
            "skill_3": round(skills_arr[3], 2),
            "skill_4": round(skills_arr[4], 2),
            "skill_5": round(skills_arr[5], 2),
            "skill_6": round(skills_arr[6], 2),
            "skill_7": round(skills_arr[7], 2),
            "skill_8": round(skills_arr[8], 2),
            "skill_9": round(skills_arr[9], 2),
            "skill_10": round(skills_arr[10], 2),
            "skill_11": round(skills_arr[11], 2),
            "skill_12": round(skills_arr[12], 2),
            "skill_13": round(skills_arr[13], 2),
            "suspension_matches_remaining": 0,
            "experience": round(max(0.0, experience), 2),
            "sim_scouted_season": scouted_season,
            "sim_training_seasons": training_seasons,
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
    age_years_list: list[float] = []
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

        ranked_team_strengths: list[tuple[str, int]] = []
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
            age_years_list.append(age_years)

            created_at = now_utc - timedelta(days=int(age_years * 365.0))
            idle_hours = int((100 - max(0, min(100, activity))) * 0.9)
            last_activity = now_utc - timedelta(hours=idle_hours)

            level, vip, sit, stand = build_stadium_state(age_years, activity, youth_focus, league_tier, intensity=intensity)
            training_level = max(1, min(20, level))

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

            cur.execute("DELETE FROM team_players WHERE team_id = ?", (team_id,))
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
            ranked_team_strengths.append((team_id, team_strength))

            summary.updated_teams += 1

        _assign_league_tiers_by_strength(cur, ranked_team_strengths)

        con.commit()
    finally:
        con.close()

    if age_years_list:
        total_teams = len(age_years_list)
        brackets = [
            ((0.0, 1.0), "0-1"),
            ((1.0, 2.0), "1-2"),
            ((2.0, 3.0), "2-3"),
            ((3.0, 5.0), "3-5"),
            ((5.0, 10.0), "5-10"),
            ((10.0, float('inf')), ">10"),
        ]
        print("  Club age distribution (years) at pre-sim:")
        for (low, high), label in brackets:
            count = sum(1 for a in age_years_list if low <= a < high)
            percent = (count / total_teams) * 100
            print(f"    {label}: {count}/{total_teams} ({percent:.1f}%)")

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
    os.makedirs(TMP_DIR, exist_ok=True)
    if create_bots:
        if os.path.exists(DISABLE_BOTS_FLAG_PATH):
            os.remove(DISABLE_BOTS_FLAG_PATH)
    else:
        with open(DISABLE_BOTS_FLAG_PATH, "w", encoding="utf-8") as f:
            f.write("1\n")

    if create_bots:
        print("  Starting service (bots will auto-register)...")
    else:
        print("  Starting service (bots DISABLED — start bots manually later)...")

    run_cmd(["systemctl", "start", SERVICE_NAME], check=False)
    print("  Service started. Database will be recreated automatically.")
    print()
    if create_bots:
        print("  Bots will register themselves over the next few minutes.")
        print("  Pre-simulation is NOT automatic. Use bot option 23 to run it manually when needed.")
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

    print("  Waiting for API health before registration...")
    if not wait_for_api_health(timeout_seconds=120, poll_seconds=2):
        print("  API is not healthy yet. Please retry in a minute.")
        return

    # Run the bot client with the new count target — it will register additional bots
    # Register-only mode ensures the process exits after bot creation and cannot loop endlessly.
    print(f"  Starting bot registration process for {count} new bots...")
    result = None
    for attempt in range(1, 4):
        result = run_cmd([
            "/usr/bin/dotnet", f"{INSTALL_ROOT}/bots/GoalTacticsBots.dll",
            f"--api-url=http://127.0.0.1:5195",
            f"--db-path={BOT_DB_PATH}",
            f"--bot-count={new_target}",
            "--register-only=true",
            "--poll-interval=999999"
        ], check=False, capture=True)

        if result.stdout:
            print(f"  Attempt {attempt} output:")
            for line in result.stdout.strip().split("\n")[-10:]:
                print(f"    {line}")

        if result.returncode == 0:
            break

        print(f"  Registration attempt {attempt} failed (exit code {result.returncode}).")
        if result.stderr:
            for line in result.stderr.strip().split("\n")[-6:]:
                print(f"    {line}")

        if attempt < 3:
            print("  Waiting for API recovery before retry...")
            if not wait_for_api_health(timeout_seconds=60, poll_seconds=2):
                print("  API still unhealthy; aborting retries.")
                break

    # Final count summary helps operators spot partial registration quickly.
    latest = db_query(BOT_DB_PATH, "SELECT COUNT(*) as c FROM Bots")
    latest_count = latest[0]["c"] if latest else 0
    print(f"  Bot registration finished. Current bot count: {latest_count}")


def run_bot_presimulation_now():
    """Run bot pre-simulation against currently registered bot teams."""
    header("Pre-Simulate Bot Teams")

    if not os.path.exists(BOT_DB_PATH):
        print("  Bot DB not found.")
        return
    if not os.path.exists(DB_PATH):
        print("  Main DB not found.")
        return

    intensity = choose_pre_sim_intensity()
    if not confirm(f"Run bot pre-simulation now with intensity '{intensity}'?"):
        print("  Cancelled.")
        return

    print("  Running pre-simulation...")
    summary = pre_simulate_bot_teams(max_wait_seconds=180, poll_seconds=5, intensity=intensity)
    print("  Pre-simulation summary:")
    print(f"    Intensity:             {intensity}")
    print(f"    Bots in bot DB:        {summary.total_bots}")
    print(f"    Bot teams matched:     {summary.matched_teams}")
    print(f"    Teams pre-simulated:   {summary.updated_teams}")
    print(f"    Missing team matches:  {summary.skipped_missing_team}")
    print(f"    Players regenerated:   {summary.players_replaced}")


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
║    23. Run bot pre-simulation now            ║
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
            "23": run_bot_presimulation_now,
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
