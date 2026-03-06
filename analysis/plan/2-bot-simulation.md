# Phase 2 - Bot Programming And Simulation

This phase builds bots for two separate purposes:

- offline accelerated simulation that validates mechanics before human launch
- live-world population bots that behave like real clubs across gameplay, economy, chat, and social systems

Bots are not an afterthought. They are part of the rebuilt game design and must be treated as full actors in the same authoritative backend as human clubs.

## 2.1 Goals of this phase

- populate leagues, GT Ladder, transfer market, friendlies, and chat even when human concurrency is low
- stress-test backend logic with long-running season simulations
- detect broken formulas before launch by observing large-sample outcomes
- provide an explicit baseline for post-launch live-ops tuning

## 2.2 Required projects and files

Create these bot-specific files in addition to the backend files from Phase 1:

- `src/GoalTactics.Bots/GoalTactics.Bots.csproj`
- `src/GoalTactics.Bots/Program.cs`
- `src/GoalTactics.Bots/DependencyInjection.cs`
- `src/GoalTactics.Bots/Config/BotOptions.cs`
- `src/GoalTactics.Bots/Config/BotPersonalityOptions.cs`
- `src/GoalTactics.Bots/Config/SimulationOptions.cs`
- `src/GoalTactics.Bots/Runtime/BotHostService.cs`
- `src/GoalTactics.Bots/Runtime/BotWorldClock.cs`
- `src/GoalTactics.Bots/Runtime/BotRegistry.cs`
- `src/GoalTactics.Bots/Runtime/BotActionScheduler.cs`
- `src/GoalTactics.Bots/Runtime/BotCooldownTracker.cs`
- `src/GoalTactics.Bots/Models/BotClubProfile.cs`
- `src/GoalTactics.Bots/Models/BotIntent.cs`
- `src/GoalTactics.Bots/Models/BotPerceptionSnapshot.cs`
- `src/GoalTactics.Bots/Models/BotSeasonReport.cs`
- `src/GoalTactics.Bots/Profiles/NewManagerBotProfile.cs`
- `src/GoalTactics.Bots/Profiles/ConservativeBotProfile.cs`
- `src/GoalTactics.Bots/Profiles/AggressiveTraderBotProfile.cs`
- `src/GoalTactics.Bots/Profiles/YouthFocusedBotProfile.cs`
- `src/GoalTactics.Bots/Profiles/LadderGrinderBotProfile.cs`
- `src/GoalTactics.Bots/Profiles/SocialBotProfile.cs`
- `src/GoalTactics.Bots/Services/BotTeamSetupService.cs`
- `src/GoalTactics.Bots/Services/BotLineupPlanner.cs`
- `src/GoalTactics.Bots/Services/BotTrainingPlanner.cs`
- `src/GoalTactics.Bots/Services/BotScoutingPlanner.cs`
- `src/GoalTactics.Bots/Services/BotTransferPlanner.cs`
- `src/GoalTactics.Bots/Services/BotFinancePlanner.cs`
- `src/GoalTactics.Bots/Services/BotSponsorPlanner.cs`
- `src/GoalTactics.Bots/Services/BotLadderPlanner.cs`
- `src/GoalTactics.Bots/Services/BotFriendlyPlanner.cs`
- `src/GoalTactics.Bots/Services/BotChatPlanner.cs`
- `src/GoalTactics.Bots/Services/BotMessageGenerator.cs`
- `src/GoalTactics.Bots/Services/BotActionExecutor.cs`
- `src/GoalTactics.Bots/Services/BotSimulationRunner.cs`
- `src/GoalTactics.Bots/Services/BotMetricsCollector.cs`
- `src/GoalTactics.Bots/Fixtures/BotNameCatalog.json`
- `src/GoalTactics.Bots/Fixtures/BotChatTemplates.json`
- `src/GoalTactics.Bots/Fixtures/BotClubThemes.json`
- `src/GoalTactics.Bots/Fixtures/BotCountryDistribution.json`
- `tests/GoalTactics.SimulationTests/Bots/*.cs`
- `docs/rebuild/bots/live-bot-behavior.md`
- `docs/rebuild/bots/simulation-metrics.md`
- `docs/rebuild/bots/chat-moderation-rules.md`

## 2.3 Bot classes and personalities

At minimum implement these bot archetypes:

- `NewManagerBot`
  - protects weaker leagues from feeling empty
  - buys cautiously
  - uses affordable training and standard scouting more than premium features
- `ConservativeBot`
  - values cash reserves and contract safety
  - rarely overbids in auctions
  - prioritizes sponsor stability and lineup completeness
- `AggressiveTraderBot`
  - turns over squad pieces frequently
  - lists players on the transfer market often
  - enters auctions late and overbids more often
- `YouthFocusedBot`
  - emphasizes scouting and player development
  - accepts weaker short-term results in exchange for long-term growth
- `LadderGrinderBot`
  - spends more on GT Ladder activity
  - restores stamina when projected reward value is positive
- `SocialBot`
  - participates in chat, likes, friend requests, and friendlies at a higher rate

Every live bot should have:

- a stable personality seed
- a language or locale preference
- a daily active-time window
- a budget risk tolerance
- a transfer appetite
- a social activity score
- a tactical preference distribution

## 2.4 Exact live-world bot behavior required

The live bot system must make bots look like real clubs instead of scripted test agents. The following behaviors are mandatory.

### Club setup

- create clubs with plausible manager names and team names
- choose country and visual identity from controlled reference data
- set initial squad and lineup using the same rules as humans
- receive tutorial completion or onboarding shortcuts only through server-supported flows

### Daily club loop

Every active bot should repeatedly:

- open the club overview and inspect resources
- check incomplete lineups for upcoming matches
- inspect injuries, suspensions, and expiring contracts
- review sponsor offers and finance state
- inspect scouting timers and transfer opportunities
- read chat and social events

### Match preparation

Before lineup lock a bot must:

- choose the best available formation from its tactical preference model
- select starters using position fit, current fitness, cards, injuries, and role suitability
- set captain, penalty, corner, and free-kick takers
- pick a tactic based on opponent strength, home or away context, and tactic bonus state
- save the lineup once, then optionally revisit it if a player becomes injured or suspended before lock

### Training behavior

Bots must:

- keep team training active unless the economy is critically weak
- renew individual training selectively on high-value players
- use camps based on budget, club strategy, and overlap restrictions
- adapt training focus when a squad has obvious positional weakness

### Scouting behavior

Bots must:

- use normal scouting on cooldown when economically reasonable
- use premium scouting based on personality and stars reserve
- evaluate prospects by age, position scarcity, talent, strength, wage projection, and resale potential
- recruit, reject, or defer consistently with their club strategy

### Transfer-market behavior

Bots must:

- list surplus players when squad depth exceeds need or salaries become inefficient
- search market filters aligned to their strategic gaps
- estimate a target value for each watched player
- place bids with timing variance, not always immediately
- respect cash limits, contract burden, and squad-size constraints
- favorite auctions and revisit them later

### Sponsor and finance behavior

Bots must:

- negotiate only when the expected value exceeds the negotiate cost
- accept sponsor offers according to cash need, stars need, and training-card needs
- avoid spiraling into insolvency by reserving money for contracts and mandatory upkeep

### Ladder behavior

Bots must:

- decide whether to challenge based on stamina, opponent strength, and expected point delta
- restore stamina when the projected ladder value outweighs the star cost
- vary play frequency so the ladder does not look machine-regular

### Social behavior

Bots must:

- send and accept friend requests within rate limits
- issue and accept friendly challenges with realistic cadence
- like clubs occasionally based on rivalry, friendship, or chat familiarity
- participate in public chat using constrained template-driven generation
- respect moderation rules and never produce abusive or repetitive spam

## 2.5 Chat behavior rules

Because live bots will participate in chat, the bot system needs a separate quality bar.

Mandatory constraints:

- use template pools and variable substitution, not unconstrained freeform generation in production
- add cooldowns per bot and per channel
- cap repeated phrases and consecutive messages
- bind messages to game context such as match results, league movement, auctions, sponsor wins, or friendly invitations
- keep message length short and game-appropriate
- pass every bot message through the same moderation and profanity filters as humans

Example message categories to support:

- match reaction
- ladder reaction
- transfer-market commentary
- greeting and banter
- friendly invitation follow-up
- sponsor or scouting reaction

## 2.6 Simulation harness behavior

The simulation harness must run the same backend logic as production, but with a controllable clock.

Capabilities required:

- seed any number of bot clubs
- fast-forward time without waiting for wall-clock delays
- execute scheduled jobs deterministically when required
- run full seasons and multi-season worlds
- persist snapshots at configurable intervals
- export metrics and anomaly reports as JSON and CSV

Recommended commands:

```bash
dotnet run --project src/GoalTactics.Bots -- mode=seed botCount=200
dotnet run --project src/GoalTactics.Bots -- mode=simulate seasons=50 botCount=500 snapshotEvery=1
dotnet run --project src/GoalTactics.Bots -- mode=live enableChat=true enableFriendlies=true
```

## 2.7 Metrics and assertions

The bot phase must produce hard metrics, not just qualitative impressions.

Track at least:

- goals per match
- win, draw, and loss distribution
- home advantage magnitude
- percentage of matches with incomplete lineups
- injury rate and average injury duration
- card rate and suspension frequency
- player strength growth by age bucket
- tactic bonus growth over time
- scouting acceptance rate
- average auction bid count
- auction price versus player strength and age
- team insolvency rate
- contract expiration rate
- sponsor acceptance and renegotiation rate
- ladder participation rate
- daily reward claim rate for bots if enabled
- chat message rate and unique-message ratio
- friend request acceptance rate
- friendly challenge acceptance rate

Define assertion bands for each metric in `docs/rebuild/bots/simulation-metrics.md` and fail simulation runs that leave those bands.

## 2.8 Bot decision algorithms that must be explicit

The plan is not complete unless these decision functions are written down before implementation:

- lineup selection scoring function
- tactic selection scoring function
- scouting recruit threshold
- auction target valuation formula
- contract-renewal threshold
- healing decision threshold
- sponsor acceptance expected-value function
- ladder challenge risk threshold
- chat participation probability curve
- friendly invite acceptance logic

Each function should use Phase 0 mechanics outputs, not parallel ad hoc heuristics.

## 2.9 Tests for this phase

Write tests for:

- deterministic bot decisions under fixed seeds
- no illegal API actions from bots
- no overspending below minimum reserve thresholds unless the personality explicitly allows it
- chat throttling and moderation compliance
- auction races under concurrent bidding
- season simulation stability over 100 plus seasons
- live-world bot reconnect behavior after API or hub restart

## 2.10 Exit criteria

Phase 2 is complete only when:

- the simulation harness can run multiple seasons without manual intervention
- live bots can operate through the same APIs and hubs as humans
- bots participate in gameplay, economy, social, and chat systems without obvious machine patterns
- balance metrics stay within agreed bands or produce actionable tuning reports
- bot actions never bypass server validation or hidden admin shortcuts