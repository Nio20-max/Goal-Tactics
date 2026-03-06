# Phase 0 - Contract And Mechanics Recovery

This phase writes down the exact game that is being rebuilt before backend implementation starts. The goal is to eliminate avoidable ambiguity in API behavior, formulas, timers, validation rules, and client expectations.

## 0.1 Scope locked for this rebuild

- Rebuild the shipped game first.
- Target the newer backend only: `/api/*`, `/chat`, and `/auc`.
- Update the app to stop depending on the legacy `/GameEngine/*` surface.
- Recover exact formulas from decompiled logic wherever possible.
- If a formula cannot be recovered exactly, run candidate-model tests before implementation and freeze the chosen model in a signed mechanics spec.

## 0.2 Deliverables of this phase

Create these files before Phase 1 begins:

- `docs/rebuild/current-state-overview.md`
- `docs/rebuild/api/new-backend-route-inventory.md`
- `docs/rebuild/api/request-response-catalog.md`
- `docs/rebuild/api/error-status-catalog.md`
- `docs/rebuild/realtime/chat-hub-spec.md`
- `docs/rebuild/realtime/auction-hub-spec.md`
- `docs/rebuild/mechanics/match-engine.md`
- `docs/rebuild/mechanics/team-strength.md`
- `docs/rebuild/mechanics/training.md`
- `docs/rebuild/mechanics/scouting.md`
- `docs/rebuild/mechanics/transfer-market.md`
- `docs/rebuild/mechanics/league-and-ladder.md`
- `docs/rebuild/mechanics/stadium-and-finance.md`
- `docs/rebuild/mechanics/sponsors-rewards-and-shop.md`
- `docs/rebuild/mechanics/injuries-cards-and-contracts.md`
- `docs/rebuild/mechanics/bot-behavior-spec.md`
- `docs/rebuild/client/legacy-to-new-api-mapping.md`
- `docs/rebuild/data/database-schema.md`
- `docs/rebuild/data/reference-data.md`
- `docs/rebuild/open-questions/resolved-decisions.md`

Each file must distinguish three labels explicitly:

- `Exact from client/docs`
- `Exact from decompiled logic`
- `Fallback model selected after testing`

## 0.3 Exact new-backend route inventory to freeze

The new backend route inventory must include every route below with request type, response type, auth requirement, idempotency notes, rate-limit notes, and database side effects.

### Authentication and common

- `POST /api/Login` -> `AuthRequest` -> `AuthResponse`
- `POST /api/VerifyLogin` -> `TextRequest` -> `AuthResponse`
- `POST /api/Register` -> `RegisterRequest` -> `RegisterResponse`
- `GET /api/Ping` -> `ResponseObject`
- `POST /api/GetCountries` -> `RequestObject` -> `CountriesResponse`
- `POST /api/GetSeasonInfo` -> `RequestObject` -> `TextResponse`
- `GET /api/GetVersion` -> `string`

### Chat

- `POST /api/Typing` -> `ChatInfo` -> `ResponseObject`
- `POST /api/Post` -> `ChatInfo` -> `ResponseObject`
- `POST /api/GetChatHistory` -> `RequestObject` -> `ChatData`

### Friends and social

- `POST /api/GetFriends` -> `SearchRequest` -> `FriendsResponse`
- `POST /api/GetChallenges` -> `RequestObject` -> `ChallengesResponse`
- `POST /api/ReplyChallenge` -> `ChallengeReplyRequest` -> `ChallengesResponse`
- `POST /api/SendChallenge` -> `IdRequest` -> `ChallengesResponse`
- `POST /api/Like` -> `IdRequest` -> `ResponseObject`
- `POST /api/Unlike` -> `IdRequest` -> `ResponseObject`
- `POST /api/Accept` -> `IdRequest` -> `FriendsResponse`
- `POST /api/Decline` -> `IdRequest` -> `FriendsResponse`
- `POST /api/GetFlagCollection` -> `RequestObject` -> `FlagCollectionResponse`

### Ladder, league, lineups, live

- `POST /api/GetLadder` -> `IdRequest` -> `LadderResponse`
- `POST /api/GetLadderChallenge` -> `LadderChallengeRequest` -> `LadderChallengeResponse`
- `POST /api/RestoreStamina` -> `RequestObject` -> `TextResponse`
- `POST /api/RunMatch` -> `LadderChallengeRequest` -> `LadderMatchResponse`
- `POST /api/GetGoalGetters` -> `IdRequest` -> `GoalGettersResponse`
- `POST /api/GetLeagueTable` -> `IdRequest` -> `LeagueTableResponse`
- `POST /api/GetMatches` -> `IdRequest` -> `MatchesResponse`
- `POST /api/GetLineups` -> `RequestObject` -> `LineupsResponse`
- `POST /api/GetMatchLineup` -> `LineupRequest` -> `MatchLineupResponse`
- `POST /api/SaveLineup` -> `SaveLineupRequest` -> `ResponseObject`
- `POST /api/GetMatchDetails` -> `IdRequest` -> `MatchDetailsResponse`

### Team, news, mail, finance

- `POST /api/GetTeamInfo` -> `IdRequest` -> `TeamDataResponse`
- `POST /api/GetMyTeamInfo` -> `IRequestObject` -> `TeamDataResponse`
- `POST /api/GetMyTeamExtendedInfo` -> `IRequestObject` -> `ExtendedTeamDataResponse`
- `POST /api/GetClubNews` -> `IdRequest` -> `ClubNewsResponse`
- `POST /api/GetMyResources` -> `IRequestObject` -> `ResourcesResponse`
- `POST /api/GetMyMail` -> `IRequestObject` -> `MailResponse`
- `POST /api/MarkAsRead` -> `IdRequest` -> `ResponseObject`
- `POST /api/MarkAllAsRead` -> `IRequestObject` -> `ResponseObject`
- `POST /api/DeleteMail` -> `IdRequest` -> `ResponseObject`
- `POST /api/DeleteAllRead` -> `IRequestObject` -> `ResponseObject`
- `POST /api/GetAccomplishments` -> `IRequestObject` -> `AccomplishmentsResponse`
- `POST /api/GetFinanceHistory` -> `IRequestObject` -> `FinanceHistoryResponse`
- `POST /api/GetFinances` -> `IRequestObject` -> `FinancesResponse`
- `POST /api/ChangeTeamName` -> `RenameRequest` -> `ResponseObject`

### Scouting, shop, sponsors, squad, stadium, training, transfer, tutorial, user

- `POST /api/GetPlayers` under scouting -> `RequestObject` -> `ScoutingResponse`
- `POST /api/Instruct` -> `ScoutingRequest` -> `ScoutingResponse`
- `POST /api/Recruit` -> `IdRequest` -> `ScoutingResponse`
- `POST /api/Speedup` under scouting -> `OrderRequest` -> `ResponseObject`
- `POST /api/GetProducts` -> `IRequestObject` -> `ProductsResponse`
- `POST /api/BuyProduct` -> `ProductRequest` -> `ResponseObject`
- `POST /api/GetEquipment` -> `EquipmentRequest` -> `EquipmentResponse`
- `POST /api/BuyEquipment` -> `EquipmentRequest` -> `ResponseObject`
- `POST /api/UseEquipment` -> `EquipmentRequest` -> `ResponseObject`
- `POST /api/VerifyPurchase` -> `VerifyPurchaseRequest` -> `ResponseObject`
- `POST /api/GetSponsors` -> `RequestObject` -> `SponsorsResponse`
- `POST /api/Accept` under sponsors -> `IdRequest` -> `SponsorResponse`
- `POST /api/Negotiate` -> `OrderRequest` -> `SponsorResponse`
- `POST /api/GetPlayers` under squad -> `RequestObject` -> `SquadResponse`
- `POST /api/GetTeamPlayers` -> `IdRequest` -> `TeamPlayersResponse`
- `POST /api/GetTrainingProgress` -> `IdRequest` -> `TrainingProgressResponse`
- `POST /api/GetPlayerStatistics` -> `IdRequest` -> `PlayerStatisticsResponse`
- `POST /api/RenamePlayer` -> `RenameRequest` -> `TextResponse`
- `POST /api/ChangeOrigin` -> `OriginRequest` -> `TextResponse`
- `POST /api/ChangeShirt` -> `NumberRequest` -> `ResponseObject`
- `POST /api/SellPlayer` -> `IdRequest` -> `ResponseObject`
- `POST /api/FirePlayer` -> `IdRequest` -> `ResponseObject`
- `POST /api/SendToTransfermarket` -> `TransfermarketRequest` -> `TransfermarketPlayerResponse`
- `POST /api/ExtendPlayerContract` -> `PlayerContractRequest` -> `PlayerContractResponse`
- `POST /api/GetPlayerContractCost` -> `PlayerContractRequest` -> `PlayerContractResponse`
- `POST /api/UpgradePlayer` -> `UpgradeRequest` -> `UpgradeResponse`
- `POST /api/GetSkillCards` -> `RequestObject` -> `SkillCardsResponse`
- `POST /api/UseSkillCard` -> `UseSkillCardRequest` -> `UpgradeResponse`
- `POST /api/HealPlayer` -> `IdRequest` -> `ResponseObject`
- `POST /api/GetStadium` -> `IdRequest` -> `StadiumResponse`
- `POST /api/RenewGrass` -> `RequestObject` -> `ValueResponse`
- `POST /api/RenameStadium` -> `TextRequest` -> `ResponseObject`
- `POST /api/Build` -> `OrderRequest` -> `TextResponse`
- `POST /api/BuildPlaces` -> `StadiumPlacesRequest` -> `StadiumPlacesResponse`
- `POST /api/Speedup` under stadium -> `IdRequest` -> `ResponseObject`
- `POST /api/GetUnderConstruction` -> `RequestObject` -> `UnderConstructionResponse`
- `POST /api/GetTraining` -> `RequestObject` -> `TrainingData`
- `POST /api/SaveTeamTraining` -> `TeamTrainingInfo` -> `TeamTrainingData`
- `POST /api/SaveTacticTraining` -> `IdRequest` -> `TacticTrainingData`
- `POST /api/BookCamp` -> `TrainingCampBookInfo` -> `TrainingCampData`
- `POST /api/CancelCamp` -> `RequestObject` -> `TrainingCampData`
- `POST /api/UpdateCamps` -> `RequestObject` -> `TrainingCampData`
- `POST /api/StartIndividualTraining` -> `IndividualTrainingInfo` -> `IndividualTrainingData`
- `POST /api/CancelIndividualTraining` -> `IndividualTrainingInfo` -> `IndividualTrainingData`
- `POST /api/RenewIndividualTraining` -> `IndividualTrainingInfo` -> `IndividualTrainingData`
- `POST /api/RenewAllIndividualTrainings` -> `RequestObject` -> `IndividualTrainingData`
- `POST /api/PlaceBid` -> `TransfermarketBid` -> `ResponseObject`
- `POST /api/GetBid` -> legacy `JsonTransfermarket` compatibility read path to remove during app rewrite
- `POST /api/Search` -> `TransfermarketInfo` -> `TransfermarketData`
- `POST /api/GetDetails` -> `TransfermarketDetailsInfo` -> `TransfermarketDetailsResponse`
- `POST /api/GetFavorites` -> `RequestObject` -> `TransfermarketData`
- `POST /api/AddFavorite` -> `TransfermarketBid` -> `ResponseObject`
- `POST /api/RemoveFavorite` -> `TransfermarketBid` -> `ResponseObject`
- `POST /api/GetTutorial` -> `RequestObject` -> `TutorialResponse`
- `POST /api/SkipTutorial` -> `RequestObject` -> `TutorialResponse`
- `POST /api/FinishTutorialStep` -> `RequestObject` -> `TutorialResponse`
- `POST /api/ResetTutorial` -> `TutorialRequest` -> `TutorialResponse`
- `POST /api/ClaimDailyReward` -> `RequestObject` -> `ValueResponse`
- `POST /api/GetHelpshiftUserInfo` -> `RequestObject` -> `HelpshiftUserResponse`
- `POST /api/GetPreferences` -> `RequestObject` -> `PreferencesResponse`
- `POST /api/SavePreferences` -> `PreferencesRequest` -> `ResponseObject`
- `POST /api/UpdateUser` -> `UpdateUserRequest` -> `UpdateUserResponse`
- `POST /api/DeleteAccount` -> `RequestObject` -> `ResponseObject`

## 0.4 Real-time behavior to freeze

Freeze exact hub behavior in dedicated specs:

- `/chat`
  - client subscribes to `Typing(Guid userId, string message)`
  - client subscribes to `Post(Guid userId, ChatMessage payload)`
  - backend must define auth, retention, rate limits, moderation, and replay behavior for reconnects
- `/auc`
  - client subscribes to `Bidded(JsonRealtimeBid payload)`
  - backend must define bid acceptance ordering, conflict resolution, and missed-event recovery after reconnect

## 0.5 Mechanics extraction workstream

For each mechanic below, Phase 0 must answer three questions: what inputs exist, what exact output is produced, and where the result is persisted.

### Match and strength model

Recover or lock:

- team strength formula
- player positional weighting formula
- formation-fit modifiers
- tactic bonus effect
- captain, penalty, corner, and free-kick bonus effect
- fitness impact
- injury and suspension impact
- home advantage
- mood or team-mood effect
- event-generation formula for chances, goals, cards, and injuries
- match report generation rules
- lineup lock threshold behavior

### League and ladder

Recover or lock:

- season calendar and matchday cadence
- league fixture generation
- promotion and relegation rules
- goalscorer ranking rules and tie-breakers
- GT Ladder stamina maximum and depletion formula
- GT Ladder restore behavior
- GT Ladder point win/loss formulas
- challenge matchmaking rules

### Stadium, attendance, and finance

Recover or lock:

- attendance formula from capacity, utilization, fans, members, and match context
- earnings formula from attendance and stadium state
- building upgrade cost curves
- building duration curves
- daily operating cost curves
- grass-quality effect and renewal logic
- finance ledger categories and aggregation windows

### Training, upgrades, and player growth

Recover or lock:

- team-training increment formula and boredom decay around `BoringDate`
- tactic-training growth curve
- individual-training costs and renew costs
- training-camp effects and overlap rules
- skill-card effects and stack rules
- star-upgrade formula, cap, and `MaxUpgradeStrength`
- age-related growth and decline if present in shipped behavior
- player salary and market-value recalculation rules

### Scouting, sponsors, rewards, and shop

Recover or lock:

- scouting player-generation model
- standard scouting cooldown and cost: 10,000 money every 12 hours
- premium scouting cooldown and cost: 2,000 stars every 3 hours
- scouting speedup cost: 150 stars
- recruit and reject outcome handling
- sponsor-offer generation and negotiation behavior
- daily reward formula
- rewarded-ad payout behavior
- product catalog to reward mapping
- purchase-verification replay protection

### Transfer market, contracts, injuries, and cards

Recover or lock:

- allowed auction durations and min hours
- minimum and maximum bid progression
- transfer fee formula
- auction settlement and tie behavior
- favorite tracking behavior
- contract extension cost formula and resolution states
- injury duration distribution and heal behavior
- yellow and red card accumulation and suspension rules

## 0.6 Formula-recovery method

Use this order of operations for every unknown formula:

1. Recover exact logic from decompiled methods, constants, enums, and lookup tables.
2. Cross-check against strings, DTO fields, and existing docs.
3. Create characterization tests from decompiled examples or controlled client inputs.
4. If exact recovery still fails, define 3 to 5 candidate models.
5. Run simulation and snapshot comparison against known outputs from the client and docs.
6. Freeze the best candidate and label it `Fallback model selected after testing`.

No Phase 1 implementation should begin for a mechanic until this flow is complete for that mechanic.

## 0.7 Database design output required from this phase

Before implementation starts, the schema spec must at minimum define:

- every table name
- every column name and type
- every primary key and foreign key
- every enum or lookup table
- every unique constraint
- every index
- every background job that mutates the table
- every API route that reads or writes the table

The Phase 1 file turns that schema into migrations, but the schema itself must be frozen here.

## 0.8 Exit criteria

Phase 0 is complete only when:

- every new-backend route is documented and assigned to an owning service
- every real-time event has a replay and reconnect policy
- every important formula is either exact or frozen through candidate-model testing
- the database schema draft is complete enough to write migrations without guessing
- the bot behavior spec is detailed enough to implement deterministic and human-like modes
- the app rewrite has a legacy-to-new endpoint mapping for every old call site that still exists in the client