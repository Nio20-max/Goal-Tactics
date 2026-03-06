#!/usr/bin/env python3
"""Run Phase 0 formula simulations and fit checks.

This script reads known samples and prints step-by-step calculations for each
mechanic where formulas are available or being reconstructed.
"""

from __future__ import annotations

import json
import math
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable

ROOT = Path(__file__).resolve().parents[2]
SAMPLES_PATH = ROOT / "tools" / "phase0" / "formula_samples.json"


@dataclass
class BidFitResult:
    current_bid: int
    observed_increment: int
    predicted_increment: int
    abs_error: int


def load_samples() -> dict:
    return json.loads(SAMPLES_PATH.read_text(encoding="utf-8"))


def section(title: str) -> None:
    print("\n" + "=" * 92)
    print(title)
    print("=" * 92)


def simulate_bid_increment(samples: dict) -> None:
    section("A) Transfer market bid increment formula")
    rows = [
        s
        for s in samples["entries"].get("auctionSnapshots", [])
        if s.get("currentBid", 0) > 0 and s.get("bidIncrement", 0) > 0
    ]

    print("Hypothesis: increment = clamp(round(current_bid * r), min=5000, max=150000)")
    print("We test r in [2.5%, 3.0%, 3.5%] and pick best MAE.")

    best_r = None
    best_mae = None
    for r in (0.025, 0.03, 0.035):
        errors = []
        for row in rows:
            pred = max(5000, min(150000, int(round(row["currentBid"] * r))))
            errors.append(abs(pred - row["bidIncrement"]))
        mae = sum(errors) / max(1, len(errors))
        print(f"  r={r:.3f} -> MAE={mae:.2f}")
        if best_mae is None or mae < best_mae:
            best_mae = mae
            best_r = r

    assert best_r is not None
    print(f"\nSelected best-fit rate: r={best_r:.3f} with MAE={best_mae:.2f}")

    fits: list[BidFitResult] = []
    for row in rows:
        pred = max(5000, min(150000, int(round(row["currentBid"] * best_r))))
        fits.append(
            BidFitResult(
                current_bid=row["currentBid"],
                observed_increment=row["bidIncrement"],
                predicted_increment=pred,
                abs_error=abs(pred - row["bidIncrement"]),
            )
        )

    print("\nDetailed per-sample steps:")
    for idx, fit in enumerate(fits, start=1):
        raw = fit.current_bid * best_r
        clamped = max(5000, min(150000, int(round(raw))))
        print(
            f"  Sample {idx}: bid={fit.current_bid:,}"
            f" -> raw={raw:,.2f}"
            f" -> rounded/clamped={clamped:,}"
            f" | observed={fit.observed_increment:,}"
            f" | abs_error={fit.abs_error:,}"
        )

    print("\nReasonableness check:")
    cap_trigger = int(150000 / best_r)
    print(f"  - Cap starts around bid >= {cap_trigger:,} (predicted).")
    print("  - This is consistent with user report that increments cap around high bids (~5M).")


def simulate_stadium_economy() -> None:
    section("B) Stadium earnings and running-cost formulas")
    rates = {
        4: {"vip": 212, "sit": 16, "stand": 8},
        3: {"vip": 269, "sit": 21, "stand": 10},
        2: {"vip": 343, "sit": 27, "stand": 13},
        1: {"vip": 436, "sit": 34, "stand": 17},
    }
    running_cost_rates = {
        "vip": 21.2,  # inferred from +10 VIP => +212 daily
        "stand": 0.85,  # inferred from +100 stand => +85 daily
        "sit": 1.7,  # solved from full sample equation
    }

    league = 3
    standing = 19500
    seats = 24000
    vip = 1900

    print("Given sample: league 3, standing=19500, seats=24000, vip=1900")
    print("Known payout rates league 3: vip=269, sit=21, stand=10")

    earn_vip = vip * rates[league]["vip"]
    earn_seat = seats * rates[league]["sit"]
    earn_stand = standing * rates[league]["stand"]
    total_earnings = earn_vip + earn_seat + earn_stand

    print(f"  VIP earnings:    {vip} * 269 = {earn_vip:,}")
    print(f"  Seat earnings:   {seats} * 21 = {earn_seat:,}")
    print(f"  Stand earnings:  {standing} * 10 = {earn_stand:,}")
    print(f"  Total earnings:  {total_earnings:,}")

    run_vip = vip * running_cost_rates["vip"]
    run_seat = seats * running_cost_rates["sit"]
    run_stand = standing * running_cost_rates["stand"]
    total_running = int(round(run_vip + run_seat + run_stand))

    print("\nRunning-cost reconstruction:")
    print(f"  VIP running:     {vip} * 21.2 = {run_vip:,.1f}")
    print(f"  Seat running:    {seats} * 1.7 = {run_seat:,.1f}")
    print(f"  Stand running:   {standing} * 0.85 = {run_stand:,.1f}")
    print(f"  Total running:   {total_running:,}")

    print("\nReasonableness check:")
    print("  - Reconstructed earnings exactly match provided sample (1,210,100).")
    print("  - Reconstructed running costs match provided sample (97,655).")
    print("  - Per-unit deltas also match your provided increments.")

    print("\nStanding occupancy fallback model (needed because standing seats are unlimited):")
    print("  max_filled_stands = (seats + vip * 10) * league_ratio * (1 + 0.35 * form_index)")
    print("  where form_index is in [-1, +1] and league_ratio is calibrated by league.")

    league_ratio = {4: 0.36, 3: 0.45, 2: 0.55, 1: 0.68}
    for form_label, form_idx in (("poor form", -0.6), ("neutral", 0.0), ("great form", 0.7)):
        max_filled = int(round((seats + vip * 10) * league_ratio[league] * (1 + 0.35 * form_idx)))
        actual_filled = min(standing, max_filled)
        print(
            f"  League {league}, {form_label}: max_filled={max_filled:,}, "
            f"actual_filled={actual_filled:,}, stand_earnings={actual_filled * rates[league]['stand']:,}"
        )

    print("  -> This keeps stands unbounded in construction but bounded in occupancy.")


def poisson_pmf(k: int, lam: float) -> float:
    return math.exp(-lam) * lam**k / math.factorial(k)


def simulate_match_model(samples: dict) -> None:
    section("C) Match result formula candidate (strength -> goals)")
    rows = samples["entries"].get("matchSnapshots", [])
    if not rows:
        print("No match samples found; skipping.")
        return

    print("Candidate model:")
    print("  lambda_home = base * exp(scale * ((s1 - s2) / 1000))")
    print("  lambda_away = base * exp(scale * ((s2 - s1) / 1000))")

    best = None
    for base in [0.9, 1.0, 1.1, 1.2, 1.3]:
        for scale in [0.15, 0.2, 0.25, 0.3, 0.35]:
            ll = 0.0
            valid = True
            for row in rows:
                s1 = row["team1Strength"]
                s2 = row["team2Strength"]
                g1 = row["team1Score"]
                g2 = row["team2Score"]
                d = (s1 - s2) / 1000.0
                l1 = base * math.exp(scale * d)
                l2 = base * math.exp(-scale * d)
                p = poisson_pmf(g1, l1) * poisson_pmf(g2, l2)
                if p <= 0:
                    valid = False
                    break
                ll += math.log(p)
            if valid and (best is None or ll > best["ll"]):
                best = {"base": base, "scale": scale, "ll": ll}

    assert best is not None
    print(
        f"Best grid fit: base={best['base']:.2f}, scale={best['scale']:.2f}, "
        f"log_likelihood={best['ll']:.4f}"
    )

    print("\nDetailed per-sample prediction steps:")
    for idx, row in enumerate(rows, start=1):
        s1 = row["team1Strength"]
        s2 = row["team2Strength"]
        d = (s1 - s2) / 1000.0
        l1 = best["base"] * math.exp(best["scale"] * d)
        l2 = best["base"] * math.exp(-best["scale"] * d)
        exp_total = l1 + l2
        print(f"  Sample {idx}: s1={s1:.1f}, s2={s2:.1f}, delta_k={d:.4f}")
        print(f"    -> lambda_home={l1:.4f}, lambda_away={l2:.4f}, total_xg={exp_total:.4f}")
        print(f"    -> observed score {row['team1Score']}:{row['team2Score']}")

    print("\nReasonableness check:")
    print("  - Model predicts low-scoring outcomes often, matching current small sample set.")
    print("  - Sample count is too small for final freeze; keep as fallback candidate only.")


def simulate_training_growth() -> None:
    section("D) Training/fitness growth candidate")
    print("Known constraints:")
    print("  - Newly scouted players can start fitness < 100.")
    print("  - Fitness recovers to 100 and then stays there.")
    print("  - At training center level 20, daily fitness increase is +4.")
    print("  - Facility max level is 20 and constrained by office level.")
    print("  - Max player strength target (user observed): 700.")

    print("\nCandidate formula:")
    print("  fitness_gain_per_day = 0.2 * training_center_level")
    print("  new_fitness = min(100, old_fitness + fitness_gain_per_day)")

    old_fitness = 72.0
    level = 20
    gain = 0.2 * level
    print(f"\nSimulation: old_fitness={old_fitness}, level={level}")
    for day in range(1, 10):
        old_fitness = min(100.0, old_fitness + gain)
        print(f"  Day {day}: +{gain:.1f} -> fitness={old_fitness:.1f}")
        if old_fitness >= 100.0:
            print("  Fitness cap reached (100). Further gains stop.")
            break

    print("\nReasonableness check:")
    print("  - Exactly satisfies the known level-20 daily increase (+4).")
    print("  - Gives linear and transparent progression to cap.")
    print("  - Age/talent effect for non-fitness skill growth still unresolved (needs samples).")

    print("\nFallback non-fitness growth model (provisional):")
    print(
        "  daily_strength_gain = base_gain * (tc_level/20) * talent_factor * age_factor * fitness_factor"
    )
    print("  talent_factor = 1 + 0.08 * (talent - 5)")
    print("  age_factor tiers use old-age marker at 34 from decompiled constants")
    print("  fitness_factor = 0.6 + 0.4 * (fitness/100)")
    print("  strength is capped at 700 (user-observed cap)")

    def age_factor(age: int) -> float:
        if age <= 20:
            return 1.20
        if age <= 24:
            return 1.00
        if age <= 29:
            return 0.85
        if age <= 33:
            return 0.65
        return 0.45

    test_players = [
        {"name": "Youth A", "age": 18, "talent": 8, "fitness": 92, "strength": 480.0},
        {"name": "Prime B", "age": 27, "talent": 6, "fitness": 100, "strength": 620.0},
        {"name": "Veteran C", "age": 34, "talent": 7, "fitness": 100, "strength": 660.0},
    ]
    base_gain = 0.20
    tc_level = 20
    for p in test_players:
        t_factor = 1 + 0.08 * (p["talent"] - 5)
        a_factor = age_factor(p["age"])
        f_factor = 0.6 + 0.4 * (p["fitness"] / 100)
        gain = base_gain * (tc_level / 20) * t_factor * a_factor * f_factor
        new_strength = min(700.0, p["strength"] + gain)
        print(
            f"  {p['name']}: age={p['age']}, talent={p['talent']}, fitness={p['fitness']}"
            f" -> gain/day={gain:.4f}, next_strength={new_strength:.4f}"
        )


def simulate_contract_cost(samples: dict) -> None:
    section("F) Contract renewal cost fallback model")
    rows = [r for r in samples["entries"].get("contractSnapshots", []) if r.get("salary", 0) > 0]
    if not rows:
        print("No contract salary samples found; skipping.")
        return

    print("No direct renewal-price samples available, so this is a provisional formula.")
    print("Candidate:")
    print("  budget_cost = salary * 0.45 + strength * 650 + age_penalty")
    print("  age_penalty = max(0, age - 30) * 12000")
    print("  premium_cost_stars = round(budget_cost / 55)")

    for idx, row in enumerate(rows, start=1):
        salary = float(row["salary"])
        strength = float(row["strength"])
        age = int(row["age"])
        age_penalty = max(0, age - 30) * 12000
        budget_cost = int(round(salary * 0.45 + strength * 650 + age_penalty))
        premium_cost = int(round(budget_cost / 55))
        print(
            f"  Player {idx} (age={age}, str={strength:.2f}, salary={salary:,.0f})"
            f" -> budget={budget_cost:,}, premium_stars={premium_cost:,}"
        )

    print("\nReasonableness check:")
    print("  - Higher salary and strength increase renewal cost monotonically.")
    print("  - Age >= 31 adds extra pressure, matching old-age progression concerns.")
    print("  - Must be replaced if real renewal price samples become available.")


def simulate_auction_timer_rule() -> None:
    section("E) Auction time extension rule")
    print("Rule from user evidence:")
    print("  If remaining auction time < 20s when a valid bid lands, set remaining time = 20s.")

    remaining = [45, 19, 11, 3]
    print("\nSimulation sequence:")
    for idx, t in enumerate(remaining, start=1):
        after_bid = 20 if t < 20 else t
        print(f"  Bid {idx}: before={t}s -> after={after_bid}s")

    print("\nReasonableness check:")
    print("  - Prevents last-millisecond sniping.")
    print("  - Aligns with observed 'jump back to 20 seconds' behavior.")


def main() -> None:
    samples = load_samples()
    simulate_bid_increment(samples)
    simulate_stadium_economy()
    simulate_match_model(samples)
    simulate_training_growth()
    simulate_auction_timer_rule()
    simulate_contract_cost(samples)


if __name__ == "__main__":
    main()
