# Strength Progression Formula Analysis (Rewritten)

## 1. Purpose
Provide a clean, concise evaluation of simulation behavior for 20 formula configurations targeting a 500 strength milestone by age 30. We focus on: fixed vs. rotating main training, weight allocation (main/bonus/overall), strength multiplier scaling, and realistic growth behavior.

## 2. Simulation assumptions
- Starting profiles (scout style):
  - `weak_youth`: age 16, talent 6, TC 12, fitness 80
  - `good_youth`: age 16, talent 8, TC 15, fitness 90
  - `elite_youth`: age 18, talent 10, TC 20, fitness 100
- Training schedule: 30 days per year, age increments by 1 every 30 days.
- `simulate_player()` adjusts skills daily (main/sub and individual contributions), then calculates strength with:
  - main/bonus/overall weights, fitness factor, age factor, talent factor, and global multiplier.
- Strength clamped to 1..700.
- Age in reporting now float (e.g., 16.033) to avoid coarse step artifacts.

## 3. Scorecard: what works
### Main lever 1: training mode
- `fixed_main_training=True`: stabilized growth with strong main skill focus. Essential for reaching ~500 by age 30.
- `fixed_main_training=False` (rotating): disperses training across 14 skills; no version reached 500 without very large multiplier, so unsuitable for target.

### Main lever 2: strength multiplier (`strength_multiplier`)
- 1.0: good foundation, 400s for good/elite, >500 for high main weight only.
- 1.2: sweet spot; good_youth reaches ~492 (A3) and exceeds 500 when combined with high-main weights.
- 1.4+: tends to overshoot 500 for multiple archetypes and hits the cap for elite.

### Main lever 3: weighting (main/bonus/overall)
- high main (0.70+)/low overall (0.10) + fixed training yields target range, no multiplier needed (A5, A11).
- balanced weights (0.55/0.25/0.20) with multiplier 1.2 is robust and stable (A3).
- low main (0.40) fails (weak output, A12) despite multiplier.
- bonus bias is not a successful alternative to main focus for 500+ (A9).

## 4. Approach highlights (new format)
| Approach | Mode | Weight key | Mult | age30 (good) | at30 target? | notes |
|---|---|---|---|---|---|---|
| A1 | rotating | 0.55/0.25/0.20 | 1.0 | 121 | no | rotational cost
| A2 | fixed | 0.55/0.25/0.20 | 1.0 | 411 | no | baseline
| A3 | fixed | 0.55/0.25/0.20 | 1.2 | 493 | near | best minimal tune
| A4 | fixed | 0.55/0.25/0.20 | 1.4 | 575 | yes | strong 
| A5 | fixed | 0.7/0.2/0.1 | 1.0 | 502 | yes | main-centric
| A6 | fixed | 0.7/0.2/0.1 | 1.2 | 602 | overshoot |
| A11 | fixed | 0.85/0.1/0.05 | 1.0 | 606 | overshoot |
| A12 | fixed | 0.4/0.3/0.3 | 1.0 | 339 | no |
| A17 | rotating | 0.55/0.25/0.20 | 2.0 | 250 | no |
| A19 | fixed | 0.65/0.2/0.15 | 1.5 | 700 (cap) | overshoot |

## 5. State transition points
- Age factor effect: 16-20 (0.98), 21-24 (1.02), 25-30 (1.00), 31-34 (0.97), 35+ (0.94).
- Growth rate slows clearly after age 30 due age factor and diminishing daily age bonus in `calculate_daily_main_gain`.
- To hit exactly 500 at 30 with reasonable upper limit, use fixed main + moderate strength multiplier (1.1..1.3) or main weight bias.

## 6. Recommendations
1. Best candidate: `A3` (fixed, main=0.55, bonus=0.25, overall=0.20, strMult=1.2).
2. Write guard: reject rotating for target 500 core campaign (you may keep rotating for alternate simulation mode).
3. For “realism” plus safety, add a 25+ age taper factor to formula or cap strength growth at 700 in moves.
4. Document predicted `age30` and `age32` values by archetype in a small summary table and release as both markdown and CSV.

## 7. How to extend
- Add `scripts/find_best_formulas.py` to grid search over:
  - fixed/rotating, main=0.5..0.9, bonus=0.1..0.3, overall=0.05..0.3, multiplier=1.0..1.5
  - minimize error to 500 on good_youth and keep elite <650.
- Add `output.csv` with per-day age, strength, and velocity (Δ strength/day)
- Add plot overlay showing the “500@30,” “550@32” bands for easy visual calibration.

## 8. Validation
- Confirmation test executed with `simulate_player` using new age float output and set behavior. 
- `simulate_player_strength_visualization.ipynb` updated with age-based x-axis and labels on curves.

