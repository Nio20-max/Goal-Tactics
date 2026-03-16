# Bot Human-Like Feature Ideas

## 1. Session Rhythm and Real-Life Patterns
- Add weekday/weekend behavior profiles so login times and action intensity shift naturally.
- Simulate short and long sessions (2-8 min and 15-30 min) instead of uniform activity windows.
- Add interruption events ("had to leave", "back online") so behavior has realistic pauses.

## 2. Emotional and Narrative Memory
- Persist match-level emotions (frustrated, confident, nervous) and let them decay over time.
- Bias decisions after key events: heavy loss triggers defensive choices, winning streak increases risk appetite.
- Store rival and ally narratives per team ("always overbids", "fair trader", "friendly challenger").

## 3. More Human Transfer Strategy
- Introduce transfer shortlists with A/B/C priorities and expiry dates.
- Add fake-outs: occasionally watch/bid on non-primary targets to look less deterministic.
- Add budget envelopes per phase of season (early scouting, mid-season patching, late push).
- Add "regret control": avoid immediate rebids after repeated losses on the same auction.

## 4. Group Coordination That Feels Organic
- Rotate who initiates group chat so one bot does not dominate communication.
- Add disagreement behavior: sometimes bots reject a group suggestion and explain why.
- Add delayed responses in group chat with variable latency (seconds to minutes).
- Add how the bots bid. Like in circles when they bid as a group. For example Bot 1, Bot 2 and Bot 3 bid together. First bot 1 bids. When bot 1 is overbidden bot 2 bids and when bot 2 is overbidden bot 3 bids. Then the circle starts again. In the last second these circles shouldn't count and they should just bid if the player isn't in their team so the player isn't sold to another group. 

## 5. Matchday Preparation Habits
- Add pre-match checklist events (lineup, tactic review, injury check). 
- Add opponent-specific tactical changes based on recent results and team strength bands.

## 6. Long-Term Squad Planning
- Add age curve planning (replace aging starters 1-2 seasons ahead).
- Add academy pipeline goals with yearly talent targets per position.

## 7. Communication Quality Improvements
- Give each bot a stable writing style vector (formal/casual, short/long, calm/hyped).
- Add multilingual phrase templates for varied chat without high token costs.
- Add context-aware chat triggers: congratulate promotions, react to derby matches, comment on big transfers.

## 8. Decision Stability and Anti-Robot Signals
- Use confidence thresholds before action execution (skip low-confidence plans).
- Add controlled randomness with memory so outcomes are varied but still coherent.
- Add "cooldown after mistakes" to avoid repetitive bad actions in short windows.
- Add periodic self-audits that detect repetitive loops and force strategy refresh.

## 9. Better Competitive Strength
- Add objective tracking with KPIs: points pace, squad value growth, stars efficiency, lineup consistency.
- Add scenario planners (relegation fight, title push, rebuild) with different priorities.
- Add exploration budget: try new tactics in low-risk matches and exploit best ones later.
- Add automatic adaptation when league difficulty shifts.

## 10. Safety and Control
- Add hard guardrails per bot for max bid %, min reserve funds, and max risky actions per day.
- Add explainable action logs (why action was chosen) to simplify tuning and debugging.
- Add rollback strategy profiles if model output quality degrades.

## Fastest High-Impact Candidates
- Transfer shortlists + expiry windows.
- Emotional state with decay tied to results.
- Group role system with rotating speaker.
- Matchday checklist and post-match adaptation.
- KPI-based strategy switching (title push/rebuild/relegation fight).
