#!/usr/bin/env python3
"""Run deep pre-sim validation in subprocess-style loops.

This script validates:
- Strength progression parity against scripts/simulate_player_strength.py
- 20 stress runs with 100 synthetic bot teams each
- team pool size constraints (20-50 players per team)
"""

from __future__ import annotations

import random
import statistics
import sys
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SCRIPTS = ROOT / "scripts"

sys.path.append(str(SCRIPTS))

import admin  # noqa: E402
import simulate_player_strength as sim  # noqa: E402


@dataclass
class StressSummary:
    run: int
    teams: int
    min_players_per_team: int
    max_players_per_team: int
    avg_players_per_team: float
    avg_age: float
    avg_talent: float
    max_strength: float
    min_strength: float


def progression_parity_tests(samples: int = 120) -> tuple[int, float, float]:
    rng = random.Random(20260327)
    diffs: list[float] = []

    for _ in range(samples):
        start_age = rng.randint(16, 23)
        target_age = rng.randint(start_age, 35)
        talent = rng.randint(4, 10)
        position = rng.choice(["GK", "DEF", "MID", "FWD"])
        initial_strength = rng.uniform(50.0, 90.0)
        initial_fitness = rng.randint(70, 95)
        training_level = rng.randint(6, 20)
        gain_multiplier = rng.uniform(0.75, 1.40)

        a_strength, _, _, _ = admin._simulate_strength_progression(
            start_age=start_age,
            target_age=target_age,
            talent=talent,
            position=position,
            training_center_level=training_level,
            initial_strength=initial_strength,
            initial_fitness=initial_fitness,
            days_per_year=30,
            fixed_main_training=True,
            gain_multiplier=gain_multiplier,
            strength_multiplier=admin.A4_STRENGTH_MULTIPLIER,
            main_weight=admin.A4_MAIN_WEIGHT,
            bonus_weight=admin.A4_BONUS_WEIGHT,
            overall_weight=admin.A4_OVERALL_WEIGHT,
        )

        s_results = sim.simulate_player(
            start_age=start_age,
            talent=talent,
            position=position,
            initial_strength=initial_strength,
            training_center_level=training_level,
            initial_fitness=initial_fitness,
            max_age=target_age,
            days_per_year=30,
            use_scout_style=False,
            fixed_main_training=True,
            gain_multiplier=gain_multiplier,
            strength_multiplier=admin.A4_STRENGTH_MULTIPLIER,
            main_weight=admin.A4_MAIN_WEIGHT,
            bonus_weight=admin.A4_BONUS_WEIGHT,
            overall_weight=admin.A4_OVERALL_WEIGHT,
        )
        s_strength = s_results[-1].strength

        diffs.append(abs(a_strength - s_strength))

    return samples, max(diffs), statistics.mean(diffs)


def run_stress_once(run: int, teams: int = 100) -> StressSummary:
    rng = random.Random(20260327 + run)

    players_per_team: list[int] = []
    ages: list[int] = []
    talents: list[int] = []
    strengths: list[float] = []

    for i in range(teams):
        activity = rng.randint(15, 100)
        youth_focus = rng.randint(15, 100)
        team_rng = random.Random((run * 1_000_003) + i)
        age_years = admin.derive_team_age_years(activity, team_rng, intensity="heavy")
        training_level = admin.facility_level_for_age(age_years, activity, youth_focus, intensity="heavy")

        squad = admin._generate_squad(
            team_id=f"run{run:02d}_team{i:03d}",
            team_name=f"StressTeam{run:02d}_{i:03d}",
            age_years=age_years,
            activity=activity,
            youth_focus=youth_focus,
            training_center_level=training_level,
            intensity="heavy",
        )

        players_per_team.append(len(squad))
        ages.extend(int(p["age"]) for p in squad)
        talents.extend(int(p["talent"]) for p in squad)
        strengths.extend(float(p["strength"]) for p in squad)

    return StressSummary(
        run=run,
        teams=teams,
        min_players_per_team=min(players_per_team),
        max_players_per_team=max(players_per_team),
        avg_players_per_team=statistics.mean(players_per_team),
        avg_age=statistics.mean(ages),
        avg_talent=statistics.mean(talents),
        max_strength=max(strengths),
        min_strength=min(strengths),
    )


def main() -> int:
    print("[presim-runner] progression parity checks...")
    samples, max_diff, mean_diff = progression_parity_tests(samples=120)
    print(f"[presim-runner] parity: samples={samples} max_diff={max_diff:.4f} mean_diff={mean_diff:.4f}")

    if max_diff > 0.05:
        print("[presim-runner] ERROR: progression mismatch exceeds tolerance (0.05)")
        return 1

    print("[presim-runner] 20x stress runs with 100 bot teams...")
    summaries: list[StressSummary] = []
    for run in range(1, 21):
        summary = run_stress_once(run, teams=100)
        summaries.append(summary)
        print(
            f"[run {run:02d}] teams={summary.teams} players/team min={summary.min_players_per_team} "
            f"max={summary.max_players_per_team} avg={summary.avg_players_per_team:.1f} "
            f"age_avg={summary.avg_age:.2f} talent_avg={summary.avg_talent:.2f} "
            f"strength_range={summary.min_strength:.2f}-{summary.max_strength:.2f}"
        )

        if summary.min_players_per_team < 20 or summary.max_players_per_team > 50:
            print(
                f"[presim-runner] ERROR: run {run:02d} has out-of-range team size "
                f"({summary.min_players_per_team}-{summary.max_players_per_team})"
            )
            return 2

    avg_of_avg_players = statistics.mean(s.avg_players_per_team for s in summaries)
    max_strength = max(s.max_strength for s in summaries)
    min_strength = min(s.min_strength for s in summaries)

    print("[presim-runner] OK")
    print(
        f"[presim-runner] aggregate avg(players/team)={avg_of_avg_players:.1f} "
        f"global_strength_range={min_strength:.2f}-{max_strength:.2f}"
    )

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
