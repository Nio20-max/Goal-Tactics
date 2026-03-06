# Request / Response Catalog (Phase 0)

## Phase 0 Step Log
1. Parsed recovered contract summary and DTO surfaces.
2. Pulled key DTO fields from decompiled C# classes for mechanics-relevant payloads.
3. Tagged each contract line as transport-only or mechanics-bearing.

## Exact from client/docs
Core envelopes:
- `RequestObject`: includes token/signature/locale/platform style metadata depending on service path.
- `ResponseObject`: `Status`, `ErrorMessage`, `Message`, `Punishment`.

Mechanics-bearing response DTO families:
- `MatchLineupResponse`: `Players`, `Systems`, `Tactics`, `FormationData`, `IsLocked`, role bonuses.
- `ScoutingResponse`: costs, cooldown timestamps, players.
- `StadiumResponse`: buildings, visitors, earnings, grass, speedup cost.
- `TrainingData`: team/tactic/camp/individual training blocks.
- `SquadResponse`: player list plus rename/origin/shirt/upgrade costs and transfer limits.
- `LadderChallengeResponse`: stamina, stamina restore cost, match cost, win/loss points.
- `TransfermarketDetailsResponse`: `BidCost`, `Player`, `AuctionPlayer`, `MyTeamId`.

## Exact from decompiled logic
Additional class-level fields recovered:
- `JsonCosts`: includes `YouthCosts`, `YouthBudgetCosts`, `SpecialScoutSpeedupCosts`, `PlaceBid`, `VideoAdReward`, `RenewPlayerContract`, `NegotiatedSponsorOffer`, `UpdateCamps`.
- `JsonParameters`: includes `HomeBonus`, `SkillBonus`, `CaptainBonus`, `PenaltyBonus`, `CornerBonus`, `FreekickBonus`, `InjuryFactor`, and mood/form bounds.
- `JsonMoodModifier`: threshold `Mood` + numeric `Modifier`.

## Fallback model selected after testing
- None for transport schema. Fallback only applies to server mechanics that consume these values.

## Catalog usage rule
- Backend implementation must not rename public DTO members.
- Server can add internal fields but cannot remove or alter current expected fields without client migration.
