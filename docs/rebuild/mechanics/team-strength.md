# Team Strength Mechanics (Phase 0)

## Phase 0 Step Log
1. Extracted executable lineup-strength logic from `LineupFormationViewModel.UpdateTotalStrength`.
2. Extracted position-strength mapping from `GetPlayerStrengthByPositionID`.
3. Extracted mood bucket and mood-modifier lookup from helper service methods.
4. Added user-provided bonus component evidence from live match snapshot.

## Exact from decompiled logic
### Formula 1: Lineup total strength
`TotalStrength = sum(GetStrengthForPositionId(player_i, field_i.PositionId))`

Where each field-player pair comes from current saved formation placements.

Source evidence:
- `UpdateTotalStrength()` in decompiled client sums position-specific strengths for each placed player.

### Formula 2: Position-specific strength pick
For each field position id:
- keeper -> `KeeperStrength`
- defender center/bench -> `DefenceCenterStrength`
- defender flank -> `DefenceFlankStrength`
- midfielder center/bench -> `MidCenterStrength`
- midfielder flank -> `MidFlankStrength`
- striker center/bench -> `StrikerCenterStrength`
- striker flank -> `StrikerFlankStrength`

### Formula 3: Mood label buckets
- `[0,20)` Angry
- `[20,40)` Stressed
- `[40,60)` Pleased
- `[60,80)` Happy
- `>=80` Paradisiac

### Formula 4: Mood modifier selection
`MoodModifier = first(JsonDefinitions.MoodModifiers ordered by Mood descending where threshold <= teamMood).Modifier`
Fallback if empty: last modifier or `1.0`.

## Exact from client/docs
- Lineup lock threshold is 60 minutes before match (constant in settings).
- Role bonuses exist in lineup response: captain, penalty, corner, free-kick.

## User empirical evidence integrated
Observed match decomposition example:
- Team 1 included additive components: home bonus, tactic bonus, captain bonus, penalty bonus, corner bonus, free-kick bonus.
- Team 2 had captain/penalty/corner/free-kick bonuses without home/tactic bonus in the reported sample.

This strongly supports an additive component model on top of base lineup strength.

## Fallback model selected after testing
Pending for full backend formula:
`EffectiveTeamStrength = BaseLineupStrength + HomeBonus + TacticBonus + CaptainBonus + PenaltyBonus + CornerBonus + FreekickBonus + MoodAdjustment + OtherContext`

Unknown terms (`OtherContext`) require server-side calibration.

Phase 0 coupling note:
- This effective strength output feeds the match fallback in `match-engine.md` where goal intensity is derived from strength deltas.
- additive component behavior is strongly supported by user-provided match decomposition and decompiled role/mood structures.

## Simulated walkthrough
Example (using provided evidence):
- Base lineup strength: `5631`
- Home bonus: `281.6`
- Tactic bonus: `281.6`
- Captain bonus: `165.2`
- Penalty bonus: `204.8`
- Corner bonus: `194.0`
- Freekick bonus: `132.4`

Computed effective strength:
`5631 + 281.6 + 281.6 + 165.2 + 204.8 + 194.0 + 132.4 = 6890.6`

What this accomplishes:
- Makes each lineup/tactic/role decision numerically visible.
- Allows deterministic pre-match projection and post-match auditing.
