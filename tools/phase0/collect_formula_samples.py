#!/usr/bin/env python3
"""Interactive collector for historical Goal Tactics formula samples.

Stores user-provided observations in JSON so Phase 0 candidate models can be fitted
against real examples.
"""

from __future__ import annotations

import json
from datetime import datetime, timezone
from pathlib import Path

OUTPUT_PATH = Path(__file__).with_name("formula_samples.json")


def ask(prompt: str) -> str:
    return input(prompt).strip()


def ask_int(prompt: str) -> int:
    while True:
        raw = ask(prompt)
        try:
            return int(raw)
        except ValueError:
            print("Please enter an integer value.")


def ask_float(prompt: str) -> float:
    while True:
        raw = ask(prompt)
        try:
            return float(raw.replace(",", "."))
        except ValueError:
            print("Please enter a numeric value.")


def ask_yes_no(prompt: str) -> bool:
    while True:
        raw = ask(f"{prompt} [y/n]: ").lower()
        if raw in {"y", "yes"}:
            return True
        if raw in {"n", "no"}:
            return False
        print("Please answer y or n.")


def load_samples() -> dict:
    if OUTPUT_PATH.exists():
        return json.loads(OUTPUT_PATH.read_text(encoding="utf-8"))
    return {
        "createdAt": datetime.now(timezone.utc).isoformat(),
        "entries": {
            "matchSnapshots": [],
            "attendanceSnapshots": [],
            "trainingSnapshots": [],
            "contractSnapshots": [],
            "auctionSnapshots": [],
            "injuryCardSnapshots": [],
        },
    }


def save_samples(payload: dict) -> None:
    payload["updatedAt"] = datetime.now(timezone.utc).isoformat()
    OUTPUT_PATH.write_text(json.dumps(payload, indent=2, ensure_ascii=True), encoding="utf-8")


def add_match_snapshot(entries: dict) -> None:
    row = {
        "team1Strength": ask_float("Team 1 effective strength: "),
        "team2Strength": ask_float("Team 2 effective strength: "),
        "team1Score": ask_int("Team 1 score: "),
        "team2Score": ask_int("Team 2 score: "),
        "team1Breakdown": ask("Team 1 breakdown notes: "),
        "team2Breakdown": ask("Team 2 breakdown notes: "),
        "notes": ask("Extra notes: "),
    }
    entries["matchSnapshots"].append(row)


def add_attendance_snapshot(entries: dict) -> None:
    row = {
        "league": ask("League name/level: "),
        "standingPlaces": ask_int("Standing places: "),
        "seatPlaces": ask_int("Seat places: "),
        "vipBoxes": ask_int("VIP boxes: "),
        "runningCost": ask_int("Daily running cost: "),
        "earnings": ask_int("Match earnings: "),
        "notes": ask("Extra notes: "),
    }
    entries["attendanceSnapshots"].append(row)


def add_training_snapshot(entries: dict) -> None:
    row = {
        "player": ask("Player name/id: "),
        "trainingType": ask("Training type (team/individual/camp/tactic): "),
        "beforeStrength": ask_float("Before strength: "),
        "afterStrength": ask_float("After strength: "),
        "days": ask_int("Days elapsed: "),
        "costStars": ask_int("Cost stars (0 if none): "),
        "notes": ask("Extra notes: "),
    }
    entries["trainingSnapshots"].append(row)


def add_contract_snapshot(entries: dict) -> None:
    row = {
        "player": ask("Player name/id: "),
        "age": ask_int("Age: "),
        "strength": ask_float("Strength: "),
        "salary": ask_float("Current salary: "),
        "budgetCost": ask_int("Budget renewal cost: "),
        "premiumCost": ask_int("Premium renewal cost: "),
        "result": ask("Result text/resolution: "),
        "notes": ask("Extra notes: "),
    }
    entries["contractSnapshots"].append(row)


def add_auction_snapshot(entries: dict) -> None:
    row = {
        "currentBid": ask_int("Current bid: "),
        "bidIncrement": ask_int("Bid increment: "),
        "nextBid": ask_int("Next accepted bid: "),
        "finalSettlement": ask_int("Final settlement (if known): "),
        "notes": ask("Extra notes: "),
    }
    entries["auctionSnapshots"].append(row)


def add_injury_card_snapshot(entries: dict) -> None:
    row = {
        "injuryDays": ask_int("Injury duration (days, 0 if none): "),
        "redCardSuspensionDays": ask_int("Red-card suspension days: "),
        "yellowCardRuleNote": ask("Yellow-card rule note: "),
        "notes": ask("Extra notes: "),
    }
    entries["injuryCardSnapshots"].append(row)


def main() -> None:
    payload = load_samples()
    entries = payload["entries"]

    actions = {
        "1": ("Add match snapshot", add_match_snapshot),
        "2": ("Add attendance snapshot", add_attendance_snapshot),
        "3": ("Add training snapshot", add_training_snapshot),
        "4": ("Add contract snapshot", add_contract_snapshot),
        "5": ("Add auction snapshot", add_auction_snapshot),
        "6": ("Add injury/card snapshot", add_injury_card_snapshot),
    }

    while True:
        print("\nGoal Tactics Phase 0 sample collector")
        for key, (label, _) in actions.items():
            print(f"{key}. {label}")
        print("7. Save and exit")

        choice = ask("Select action: ")
        if choice == "7":
            save_samples(payload)
            print(f"Saved to {OUTPUT_PATH}")
            return

        action = actions.get(choice)
        if action is None:
            print("Unknown selection.")
            continue

        _, handler = action
        handler(entries)
        if ask_yes_no("Save now"):
            save_samples(payload)
            print(f"Saved to {OUTPUT_PATH}")


if __name__ == "__main__":
    main()
