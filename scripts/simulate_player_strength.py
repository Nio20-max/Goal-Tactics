#!/usr/bin/env python3
"""Simulate player strength progression using Goaltactics training formulas.

Based on:
- TrainingProgressService.cs (CalculateDailyMainGain, CalculateDailyTotalGain, CalculateIndividualGain)
- PlayerValueCalculator.cs (CalculateStrength)
- LegacyAppCompatibility.cs (BuildSkills, BuildBonusSkills, MainSkillIndex)
- TrainingProgressJob.cs daily application logic (main/sub split, individual, camp experience)

Usage example:
    python scripts/simulate_player_strength.py --scout-age 17 --talent 8 --position MID --training-center-level 12 --max-age 35
"""

import argparse
from dataclasses import dataclass
from typing import List, Optional


def main_skill_index(position: str) -> int:
    position = position.upper()
    return {
        "GK": 1,
        "DEF": 0,
        "MID": 3,
        "FWD": 2,
    }.get(position, 3)


def build_bonus_skills(position: str) -> List[int]:
    position = position.upper()
    return {
        "GK": [1, 13, 13, 12],
        "DEF": [0, 13, 12, 11],
        "MID": [11, 10, 9, 8],
        "FWD": [6, 5, 4, 3],
    }.get(position, [0, 1])


def clamp(value: float, mn: float, mx: float) -> float:
    return max(mn, min(mx, value))


def build_skills(strength: float, position: str, talent: int, age: int, bonus_skill_indices: Optional[List[int]] = None) -> List[float]:
    # LegacyAppCompatibility.BuildSkills
    primary_skill = main_skill_index(position)
    bonus_skills = bonus_skill_indices or build_bonus_skills(position)
    age_factor = max(0.85, 1.18 - (max(16, age) - 16) / 60)
    talent_factor = 0.92 + (talent / 50.0)
    base_skill = max(18.0, strength * 0.48 * age_factor * talent_factor)

    skills = []
    for i in range(14):
        if i == primary_skill:
            weight = 1.95
        elif i in bonus_skills:
            weight = 1.28
        else:
            weight = 0.62
        skills.append(max(20.0, round(base_skill * weight, 10)))
    return skills


def clamp_skill(skill: float) -> float:
    return clamp(skill, 1.0, 700.0)


def ask_int(prompt: str, default: int, min_value: int, max_value: int) -> int:
    while True:
        value = input(f"{prompt} [{default}]: ").strip()
        if value == "":
            return default
        try:
            iv = int(value)
        except ValueError:
            print("Please enter a valid number.")
            continue
        if iv < min_value or iv > max_value:
            print(f"Value must be between {min_value} and {max_value}.")
            continue
        return iv


def ask_str(prompt: str, default: str, options: Optional[List[str]] = None) -> str:
    while True:
        value = input(f"{prompt} [{default}]: ").strip()
        if value == "":
            return default
        if options and value.upper() not in options:
            print(f"Choose one of: {', '.join(options)}")
            continue
        return value.upper()


def calculate_strength(
    skills: List[float],
    position: str,
    fitness: int,
    age: int,
    talent: int,
    bonus_skill_indices: Optional[List[int]] = None,
    strength_multiplier: float = 1.0,
    main_weight: float = 0.55,
    bonus_weight: float = 0.25,
    overall_weight: float = 0.20,
) -> float:
    # PlayerValueCalculator.CalculateStrength
    if not skills or len(skills) < 14:
        return 1.0

    main_idx = main_skill_index(position)
    bonus_idx = bonus_skill_indices or build_bonus_skills(position)

    main = clamp_skill(skills[main_idx])
    bonus_vals = [clamp_skill(skills[i]) for i in bonus_idx if 0 <= i < len(skills) and i != main_idx]
    bonus_avg = sum(bonus_vals) / len(bonus_vals) if bonus_vals else 0.0
    overall_avg = sum(clamp_skill(x) for x in skills) / len(skills)

    fit_factor = 0.80 + clamp(fitness, 0, 100) / 500.0
    age_factor = 0.98 if age <= 20 else 1.02 if age <= 24 else 1.00 if age <= 30 else 0.97 if age <= 34 else 0.94
    talent_factor = 0.95 + clamp(talent, 1, 10) * 0.01

    base_strength = (main_weight * main) + (bonus_weight * bonus_avg) + (overall_weight * overall_avg)
    strength = base_strength * fit_factor * age_factor * talent_factor * strength_multiplier
    strength = round(strength, 2)
    return clamp(strength, 1.0, 700.0)


def calculate_daily_main_gain(age: int, talent: int, training_center_level: int) -> float:
    # TrainingProgressService.CalculateDailyMainGain
    level = clamp(training_center_level, 1, 20)
    base_gain = 0.10 + (0.02 * talent) + (0.03 * level)
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
        age_bonus = 0.00
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


def calculate_individual_gain(age: int, talent: int, fitness: int) -> float:
    # TrainingProgressService.CalculateIndividualGain
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

    fitness_factor = 0.70 + (clamp(fitness, 0, 100) / 250.0)
    base_gain = 0.20 + (0.03 * talent)
    return round(base_gain * age_factor * fitness_factor, 3)


def calculate_daily_total_gain(age: int, talent: int, fitness: int, training_center_level: int, has_individual: bool, has_camp: bool) -> float:
    # TrainingProgressService.CalculateDailyTotalGain
    main = calculate_daily_main_gain(age, talent, training_center_level)
    sub = round(main * 0.18, 3)
    individual = calculate_individual_gain(age, talent, fitness) if has_individual else 0.0
    camp = 1.5 if has_camp else 0.0
    return round(main + sub + individual + camp, 3)


@dataclass
class SimulationResult:
    age: float
    day_index: int
    strength: float
    fitness: float
    experience: float
    position_main_skill: float
    training_main_skill_index: int
    training_main_skill_value: float


def generate_scouted_strength(position: str, talent: int, is_premium: bool = False, seed: Optional[int] = None) -> float:
    import random
    rng = random.Random(seed)
    base_str = {
        "GK": 68.0,
        "DEF": 62.0,
        "MID": 63.0,
        "FWD": 64.0,
    }.get(position.upper(), 60.0)
    bonus = rng.randint(-5, 14)
    tier_bonus = rng.randint(2, 7) if talent >= 8 else 0
    strength = base_str + bonus + tier_bonus
    return clamp(strength, 50.0, 90.0)


def simulate_player(
    start_age: int,
    talent: int,
    position: str,
    initial_strength: Optional[float],
    training_center_level: int,
    initial_fitness: int,
    max_age: int,
    days_per_year: int = 30,
    use_scout_style: bool = False,
    fixed_main_training: bool = False,
    gain_multiplier: float = 1.0,
    strength_multiplier: float = 1.0,
    main_weight: float = 0.55,
    bonus_weight: float = 0.25,
    overall_weight: float = 0.20,
) -> List[SimulationResult]:
    # Start initial strength determination.
    if initial_strength is None:
        if use_scout_style:
            initial_strength = generate_scouted_strength(position, talent, is_premium=False, seed=42)
        else:
            initial_strength = max(1.0, 20.0 + (talent * 3.0) + max(0, start_age - 16) * 2.0)

    bonus_skills = build_bonus_skills(position)
    skills = build_skills(initial_strength, position, talent, start_age, bonus_skills)
    fitness = clamp(initial_fitness, 0, 100)
    experience = max(10.0, (initial_strength * 1.4) + max(0, start_age - 16) * 11.0)

    results: List[SimulationResult] = []

    age_year = start_age
    day_index = 0

    main_pos_skill_idx = main_skill_index(position)
    current_trained_skill_idx = day_index % 14  # current main training focus at simulation start
    initial_strength = calculate_strength(
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
    results.append(SimulationResult(
        age=float(age_year),
        day_index=day_index,
        strength=initial_strength,
        fitness=fitness,
        experience=experience,
        position_main_skill=clamp_skill(skills[main_pos_skill_idx]),
        training_main_skill_index=current_trained_skill_idx,
        training_main_skill_value=clamp_skill(skills[current_trained_skill_idx])
    ))

    total_days = int((max_age - start_age) * days_per_year)
    for day_index in range(1, total_days + 1):
        age_year = start_age + (day_index - 1) // days_per_year
        age_float = start_age + day_index / days_per_year

        has_individual = True
        has_camp = True

        daily_total_gain = calculate_daily_total_gain(age_year, talent, int(fitness), training_center_level, has_individual, False) * gain_multiplier

        if fixed_main_training:
            main_idx = main_skill_index(position)
            sub_idx = (main_idx + 1) % 14
        else:
            # Team training rotates through all 14 skills daily
            main_idx = day_index % 14
            sub_idx = (day_index + 1) % 14

        skills[main_idx] = clamp_skill(skills[main_idx] + (daily_total_gain * 0.65))
        skills[sub_idx] = clamp_skill(skills[sub_idx] + (daily_total_gain * 0.35))

        # Individual training on main skill
        ind_gain = calculate_individual_gain(age_year, talent, int(fitness))
        skills[main_idx] = clamp_skill(skills[main_idx] + ind_gain)

        # Camp is experience-only for experience camp
        if has_camp:
            experience += 1.5

        # fitness recovery exactly as in engine: max(1, trainingCenterLevel/5)
        fitness += max(1, training_center_level // 5)
        if fitness > 100:
            fitness = 100

        # Recalculate strength daily using updated skills
        current_strength = calculate_strength(
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

        current_trained_skill_idx = day_index % 14
        results.append(SimulationResult(
            age=round(age_float, 3),
            day_index=day_index,
            strength=current_strength,
            fitness=fitness,
            experience=experience,
            position_main_skill=clamp_skill(skills[main_pos_skill_idx]),
            training_main_skill_index=current_trained_skill_idx,
            training_main_skill_value=clamp_skill(skills[current_trained_skill_idx])
        ))

    return results


def print_age_summary(results: List[SimulationResult]):
    print("Age,Day,Strength,Fitness,Experience,PositionMainSkill,TrainingMainSkillIndex,TrainingMainSkillValue")
    for r in results:
        print(f"{r.age},{r.day_index},{r.strength:.2f},{r.fitness:.1f},{r.experience:.1f},{r.position_main_skill:.2f},{r.training_main_skill_index},{r.training_main_skill_value:.2f}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Simulate player strength growth by age with training/camp rules")
    parser.add_argument("--scout-age", type=int, default=17, help="Age when player is discovered/scouted")
    parser.add_argument("--talent", type=int, default=6, help="Player talent (1-10)")
    parser.add_argument("--position", type=str, default="MID", help="Position (GK, DEF, MID, FWD)")
    parser.add_argument("--initial-strength", type=float, default=None, help="Initial strength when scouted (optional, auto-derived if missing)")
    parser.add_argument("--training-center-level", type=int, default=12, help="Training center level (1-20)")
    parser.add_argument("--initial-fitness", type=int, default=80, help="Starting today's fitness 0-100")
    parser.add_argument("--max-age", type=int, default=35, help="Last age to simulate (e.g., 35)")
    parser.add_argument("--days-per-year", type=int, default=30, help="Days per age year for simulation (matchday season=30)")
    parser.add_argument("--scout-style", action="store_true", help="Use realistic scouted player generation (Matchday 1 style)")
    parser.add_argument("--interactive", action="store_true", help="Prompt for stats interactively when running the script")
    parser.add_argument("--fixed-main-training", action="store_true", help="Keep main training always on player position main skill (best case)")
    parser.add_argument("--gain-multiplier", type=float, default=1.0, help="Multiply total training gains for experiments (default 1.0)")
    parser.add_argument("--strength-multiplier", type=float, default=1.0, help="Multiply strength formula output for experiments (default 1.0)")
    parser.add_argument("--main-weight", type=float, default=0.55, help="Relative weight for main skill in strength formula")
    parser.add_argument("--bonus-weight", type=float, default=0.25, help="Relative weight for bonus skill average in strength formula")
    parser.add_argument("--overall-weight", type=float, default=0.20, help="Relative weight for overall skill average in strength formula")

    args = parser.parse_args()

    if args.interactive:
        start_age = ask_int("Scout age", args.scout_age, 16, 35)
        talent = ask_int("Talent (1-10)", args.talent, 1, 10)
        position = ask_str("Position (GK, DEF, MID, FWD)", args.position, ["GK", "DEF", "MID", "FWD"])
        initial_strength = None
        strength_choice = input("Use scouted strength formula? [Y/n]: ").strip().lower()
        if strength_choice == "n":
            initial_strength = float(input("Initial strength (numeric): ").strip())
        training_center_level = ask_int("Training center level", args.training_center_level, 1, 20)
        initial_fitness = ask_int("Initial fitness", args.initial_fitness, 0, 100)
        max_age = ask_int("Max age to simulate", args.max_age, start_age + 1, 50)
        days_per_year = ask_int("Days per season", args.days_per_year, 1, 365)
        use_scout_style = True
    else:
        start_age = args.scout_age
        talent = args.talent
        position = args.position
        initial_strength = args.initial_strength
        training_center_level = args.training_center_level
        initial_fitness = args.initial_fitness
        max_age = args.max_age
        days_per_year = args.days_per_year
        use_scout_style = args.scout_style

    sim = simulate_player(
        start_age=start_age,
        talent=talent,
        position=position,
        initial_strength=initial_strength,
        training_center_level=training_center_level,
        initial_fitness=initial_fitness,
        max_age=max_age,
        days_per_year=days_per_year,
        use_scout_style=use_scout_style,
        fixed_main_training=args.fixed_main_training,
        gain_multiplier=args.gain_multiplier,
        strength_multiplier=args.strength_multiplier,
        main_weight=args.main_weight,
        bonus_weight=args.bonus_weight,
        overall_weight=args.overall_weight,
    )

    print_age_summary(sim)
