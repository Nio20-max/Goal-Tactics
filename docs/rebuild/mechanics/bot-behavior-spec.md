# Bot Behavior Spec (Phase 0)

## Phase 0 Step Log
1. Combined Phase 2 plan requirements with recovered gameplay systems.
2. Applied user decision that bots must also participate in chat/social systems.
3. Linked bot actions to recovered API/hub contracts.

## Exact from client/docs
Bots need coverage for the same subsystems humans use:
- team management
- lineup/tactics
- training and scouting
- transfer market
- league and ladder
- friends/friendlies
- chat
- sponsor and finance loops

## Exact from decompiled logic
- Bid viability is constrained by `money >= bid + bidIncrement`.
- Lineup strength and position mapping logic are deterministic and usable for bot planners.

## Behavior contract (implementation target)
- Bots must call only public APIs and hubs (no hidden admin paths).
- Bots must respect lineup lock.
- Bots must maintain legal squad and contract states.
- Bots must produce realistic, non-spam chat cadence.
- Bots must make transfer decisions by budget and role need.

## Fallback model selected after testing
- Personality weights and activity cadence are tunable.
- Initial profiles:
  - conservative
  - aggressive trader
  - youth-focused
  - ladder-focused
  - social-heavy

## Simulated walkthrough
Example daily bot cycle:
1. Check resources and contracts.
2. Save lineup if next match unlocked and not complete.
3. Renew one individual training if EV positive.
4. Scout if cooldown finished and budget allows.
5. Check one watched auction and bid if under target value.
6. Post one contextual chat message and process friend/friendly actions.

What this accomplishes:
- keeps leagues and chat active at low human concurrency.
- stress-tests economy and transfer market continuously.
