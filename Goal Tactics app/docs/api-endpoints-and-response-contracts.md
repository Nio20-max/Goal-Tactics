# Goal Tactics API Endpoints And Response Contracts

This document summarizes the exact API surface recovered from the decompiled Xamarin managed code in `GT.Core.dll`. It combines:

- explicit Refit route attributes from the interfaces in `reverse_engineering/decompiled/GT.Core.actual/store0_idx17.decompiled.cs`
- exact request and response type names from those interfaces
- exact top-level properties from the corresponding request and response DTO classes
- exact base URLs and SignalR hub paths used by the client

## 1. Base URLs, transports, and shared request behavior

Exact base URLs from `GT.Core.URLHelper`:

- Legacy production backend: `https://engine.goaltactics.de/GameEngine/`
- Legacy staging backend: `http://goaltacticswebapp-goaltacticswebappstaging.azurewebsites.net/GameEngine/`
- New production backend: `https://gtwebapp2.azurewebsites.net/`
- New staging backend: `http://gtwebapp2-gtwebapp2staging.azurewebsites.net/`

Exact service usage recovered from the client:

- Legacy `BaseService<T>` descendants target `URLHelper.BaseServiceUrl`.
- New backend services target `URLHelper.NewBackendUrl + "api/"`.
- Real-time auction hub: `URLHelper.NewBackendUrl + "/auc"`
- Real-time chat hub: `URLHelper.NewBackendUrl + "/chat"`

Exact headers used on typed Refit calls:

- `x-goaltactics-version`
- `x-goaltactics-capabilities`

Exact hard-coded capability string:

- `youthlist,htmligm,friendlist,indtrainings`

Exact common legacy request envelope fields in `RequestObject`:

- `Signature`
- `Token`
- `Locale`
- `UtcOffset`
- `Culture`
- `Platform`

Exact common typed response envelope in `ResponseObject`:

- `ErrorMessage`
- `Status`
- `Message`
- `Punishment`

## 2. New backend typed endpoints

### Authentication

`IAuthApi`

- `POST /Login`
  Request: `AuthRequest` with `Login`, `Password`, `AuthId`, `AuthMethod`
  Response: `AuthResponse` with `Token`, `UserId`, `Level`, `IsAdmin`
- `POST /VerifyLogin`
  Request: `TextRequest` with `Text`
  Response: `AuthResponse` with `Token`, `UserId`, `Level`, `IsAdmin`
- `POST /Register`
  Request: `RegisterRequest` with `IsGuest`, `TeamName`, `Email`, `CountryId`
  Response: `RegisterResponse` with `Login`, `Password`
- `Ping`
  Request: none
  Response: `ResponseObject`

### Chat and common utility

`IChatApi`

- `POST /Typing`
  Request: `ChatInfo` with `Message`
  Response: `ResponseObject`
- `POST /Post`
  Request: `ChatInfo` with `Message`
  Response: `ResponseObject`
- `POST /GetChatHistory`
  Request: `RequestObject`
  Response: `ChatData` with `Messages`, `UserId`

`ICommonApi`

- `POST /GetCountries`
  Request: `RequestObject`
  Response: `CountriesResponse` with `Countries`
- `POST /GetSeasonInfo`
  Request: `RequestObject`
  Response: `TextResponse` with `Text`
- `GetVersion`
  Request: none
  Response: plain string

### Friends and social

`IFriendsApi`

- `POST /GetFriends`
  Request: `SearchRequest` with `Text`, `Value`, `Language`
  Response: `FriendsResponse` with `Friends`, `FriendName`
- `POST /GetChallenges`
  Request: `RequestObject`
  Response: `ChallengesResponse` with `Challenges`, `Friends`, `MatchDate`, `EndDate`
- `POST /ReplyChallenge`
  Request: `ChallengeReplyRequest` with `Accept`
  Response: `ChallengesResponse` with `Challenges`, `Friends`, `MatchDate`, `EndDate`
- `POST /SendChallenge`
  Request: `IdRequest` with `Id`
  Response: `ChallengesResponse` with `Challenges`, `Friends`, `MatchDate`, `EndDate`
- `POST /Like`
  Request: `IdRequest` with `Id`
  Response: `ResponseObject`
- `POST /Unlike`
  Request: `IdRequest` with `Id`
  Response: `ResponseObject`
- `POST /Accept`
  Request: `IdRequest` with `Id`
  Response: `FriendsResponse` with `Friends`, `FriendName`
- `POST /Decline`
  Request: `IdRequest` with `Id`
  Response: `FriendsResponse` with `Friends`, `FriendName`
- `POST /GetFlagCollection`
  Request: `RequestObject`
  Response: `FlagCollectionResponse` with `Flags`

### Ladder, league, lineups, and live matches

`ILadderApi`

- `POST /GetLadder`
  Request: `IdRequest` with `Id`
  Response: `LadderResponse` with `Teams`, `EndDate`, `LadderId`
- `POST /GetLadderChallenge`
  Request: `LadderChallengeRequest` with `TeamId`
  Response: `LadderChallengeResponse` with `HomeTeam`, `AwayTeam`, `WinPoints`, `LosePoints`, `Stamina`, `StaminaCost`, `LadderDate`, `MatchCost`
- `POST /RestoreStamina`
  Request: `RequestObject`
  Response: `TextResponse` with `Text`
- `POST /RunMatch`
  Request: `LadderChallengeRequest` with `TeamId`
  Response: `LadderMatchResponse` with `MatchReport`, `Stamina`

`ILeagueApi`

- `POST /GetGoalGetters`
  Request: `IdRequest` with `Id`
  Response: `GoalGettersResponse` with `Players`
- `POST /GetLeagueTable`
  Request: `IdRequest` with `Id`
  Response: `LeagueTableResponse` with `Teams`, `LeagueName`, `Mount`, `Dismount`
- `POST /GetMatches`
  Request: `IdRequest` with `Id`
  Response: `MatchesResponse` with `Matches`, `HomeTrikot`, `AwayTrikot`

`ILineupApi`

- `POST /GetLineups`
  Request: `RequestObject`
  Response: `LineupsResponse` with `Lineups`
- `POST /GetMatchLineup`
  Request: `LineupRequest`
  Response: `MatchLineupResponse` with `Players`, `Systems`, `Tactics`, `FormationData`, `IsLocked`, `HomeShirt`, `CaptainBonus`, `PenaltyBonus`, `CornerBonus`, `FreekickBonus`
- `POST /SaveLineup`
  Request: `SaveLineupRequest`
  Response: `ResponseObject`

`ILiveApi`

- `POST /GetMatchDetails`
  Request: `IdRequest` with `Id`
  Response: `MatchDetailsResponse` with `Report`, `Match`

### Club, team overview, resources, mail, finance

`INewTeamApi`

- `POST /GetTeamInfo`
  Request: `IdRequest` with `Id`
  Response: `TeamDataResponse` with `TeamData`
- `POST /GetMyTeamInfo`
  Request: `IRequestObject`
  Response: `TeamDataResponse` with `TeamData`
- `POST /GetMyTeamExtendedInfo`
  Request: `IRequestObject`
  Response: `ExtendedTeamDataResponse` with `TeamData`, `News`, `Season`, `SeasonStartDate`, `Matchday`, `LastMatch`, `NextMatch`, `RenameTeamCost`
- `POST /GetClubNews`
  Request: `IdRequest` with `Id`
  Response: `ClubNewsResponse` with `News`
- `POST /GetMyResources`
  Request: `IRequestObject`
  Response: `ResourcesResponse` with `Money`, `Medipacks`, `GTStars`
- `POST /GetMyMail`
  Request: `IRequestObject`
  Response: `MailResponse` with `Mails`
- `POST /MarkAsRead`
  Request: `IdRequest` with `Id`
  Response: `ResponseObject`
- `POST /MarkAllAsRead`
  Request: `IRequestObject`
  Response: `ResponseObject`
- `POST /DeleteMail`
  Request: `IdRequest` with `Id`
  Response: `ResponseObject`
- `POST /DeleteAllRead`
  Request: `IRequestObject`
  Response: `ResponseObject`
- `POST /GetAccomplishments`
  Request: `IRequestObject`
  Response: `AccomplishmentsResponse` with `Accomplishments`
- `POST /GetFinanceHistory`
  Request: `IRequestObject`
  Response: `FinanceHistoryResponse` with `FinanceHistory`
- `POST /GetFinances`
  Request: `IRequestObject`
  Response: `FinancesResponse` with `Today`, `Yesterday`, `Todays`, `Yesterdays`
- `POST /ChangeTeamName`
  Request: `RenameRequest`
  Response: `ResponseObject`

Primary team-view contracts recovered from these responses:

- `TeamData`: `Name`, `Logo`, `Country`, `CountryName`, `LeagueId`, `LeagueName`, `HomeTrikot`, `AwayTrikot`, `MarketValue`, `Mood`, `TeamMood`, `Wins`, `Losses`, `Fans`, `Members`, `Strength`, `MatchTrend`, `UserData`
- `ExtendedTeamData`: `LeaguePosition`, `PlayersCount`, `BestVictory`, `WorstDefeat`, `StadiumSize`
- `UserData`: `Name`, `Score`, `Created`, `LastActivity`, `FacebookId`, `AppleId`, `Email`, `Password`, `Rank`
- `MatchData`: `HomeCountry`, `AwayCountry`, `HomeScore`, `AwayScore`, `OpponentTeamId`, `HomeStrength`, `AwayStrength`, `HasLineup`, `HomeTrikot`, `AwayTrikot`, `IsFriendly`

### Scouting, shop, sponsors, squad, stadium, training, transfer market, tutorial, user profile

`IScoutingApi`

- `POST /GetPlayers`
  Request: `RequestObject`
  Response: `ScoutingResponse` with `Players`, `ScoutingCost`, `PremiumScoutingCost`, `SpeedupCost`, `NextScoutingDate`, `NextPremiumScoutingDate`
- `POST /Instruct`
  Request: `ScoutingRequest`
  Response: `ScoutingResponse` with `Players`, `ScoutingCost`, `PremiumScoutingCost`, `SpeedupCost`, `NextScoutingDate`, `NextPremiumScoutingDate`
- `POST /Recruit`
  Request: `IdRequest` with `Id`
  Response: `ScoutingResponse` with `Players`, `ScoutingCost`, `PremiumScoutingCost`, `SpeedupCost`, `NextScoutingDate`, `NextPremiumScoutingDate`
- `POST /Speedup`
  Request: `OrderRequest`
  Response: `ResponseObject`

`IShopApi`

- `POST /GetProducts`
  Request: `IRequestObject`
  Response: `ProductsResponse` with `Products`, `UserData`
- `POST /BuyProduct`
  Request: `ProductRequest`
  Response: `ResponseObject`
- `POST /GetEquipment`
  Request: `EquipmentRequest`
  Response: `EquipmentResponse` with `Shirts`, `Emblems`, `MyShirts`, `MyEmblems`
- `POST /BuyEquipment`
  Request: `EquipmentRequest`
  Response: `ResponseObject`
- `POST /UseEquipment`
  Request: `EquipmentRequest`
  Response: `ResponseObject`
- `POST /VerifyPurchase`
  Request: `VerifyPurchaseRequest`
  Response: `ResponseObject`

Supporting catalog contracts:

- `ProductData`: `Identifier`, `Image`, `Money`, `Medipacks`, `GTStars`, `Cost`, `Action`, `Section`, `StorePrice`, `CurrencyCode`, `Icon`
- `EquipmentData`: `Id`, `Image`, `Cost`, `InUse`

`ISponsorApi`

- `POST /GetSponsors`
  Request: `RequestObject`
  Response: `SponsorsResponse` with `Main`, `Secondary`, `NegotiateCost`, `ManagerName`
- `POST /Accept`
  Request: `IdRequest` with `Id`
  Response: `SponsorResponse` with `Sponsor`, `SkillCards`
- `POST /Negotiate`
  Request: `OrderRequest`
  Response: `SponsorResponse` with `Sponsor`, `SkillCards`

Recovered sponsor contract types:

- `SponsorData`: `OfferId`, `Date`, `Name`, `Description`, `Amounts`, `Stars`, `Cards`, `Accepted`

`ISquadApi`

- `POST /GetPlayers`
  Request: `RequestObject`
  Response: `SquadResponse` with `Players`, `HomeShirt`, `AwayShirt`, `CostRename`, `CostShirt`, `CostOrigin`, `CostUpgrade`, `PlayersOnTransfermarket`, `TransfermarketMinHours`
- `POST /GetTeamPlayers`
  Request: `IdRequest` with `Id`
  Response: `TeamPlayersResponse` with `Players`
- `POST /GetTrainingProgress`
  Request: `IdRequest` with `Id`
  Response: `TrainingProgressResponse` with `Progress`
- `POST /GetPlayerStatistics`
  Request: `IdRequest` with `Id`
  Response: `PlayerStatisticsResponse` with season, team-total, and all-time totals for red cards, yellow cards, goals, hattricks, and matches
- `POST /RenamePlayer`
  Request: `RenameRequest`
  Response: `TextResponse` with `Text`
- `POST /ChangeOrigin`
  Request: `OriginRequest`
  Response: `TextResponse` with `Text`
- `POST /ChangeShirt`
  Request: `NumberRequest`
  Response: `ResponseObject`
- `POST /SellPlayer`
  Request: `IdRequest` with `Id`
  Response: `ResponseObject`
- `POST /FirePlayer`
  Request: `IdRequest` with `Id`
  Response: `ResponseObject`
- `POST /SendToTransfermarket`
  Request: `TransfermarketRequest`
  Response: `TransfermarketPlayerResponse` with `Player`
- `POST /ExtendPlayerContract`
  Request: `PlayerContractRequest`
  Response: `PlayerContractResponse` with `Resolution`, `Contracts`
- `POST /GetPlayerContractCost`
  Request: `PlayerContractRequest`
  Response: `PlayerContractResponse` with `Resolution`, `Contracts`
- `POST /UpgradePlayer`
  Request: `UpgradeRequest`
  Response: `UpgradeResponse` with `Player`
- `POST /GetSkillCards`
  Request: `RequestObject`
  Response: `SkillCardsResponse` with `SkillCards`
- `POST /UseSkillCard`
  Request: `UseSkillCardRequest`
  Response: `UpgradeResponse` with `Player`
- `POST /HealPlayer`
  Request: `IdRequest` with `Id`
  Response: `ResponseObject`

Important squad contracts:

- `SquadPlayerData`: `Experience`, `Fitness`, `Body`, `Gloves`, `Shoes`, `Salary`, `MarketValue`, `Origin`, `Skills`, `MainSkill`, `BonusSkills`, `YellowCards`, `HasRedCard`, `Injured`, `IsForSale`, `SellPrice`, `TransfermarketFee`, `TransfermarketMaxOffer`, `TransfermarketMinOffer`, `TransfermarketMaxHours`, `IsUpgraded`, `MaxUpgradeStrength`, `Shirt`, `CanExtendContract`, `HasIndividualTraining`, `ShirtName`
- `TransfermarketPlayerData`: `AuctionId`, `IsFrozen`, `BidTeamName`, `BidTeamLogo`, `Bid`

`IStadiumApi`

- `POST /GetStadium`
  Request: `IdRequest` with `Id`
  Response: `StadiumResponse` with `Buildings`, `Name`, `VisitorsLastMatch`, `VisitorsAverage`, `VisitorsTotal`, `EarningsLastMatch`, `EarningsAverage`, `EarningsTotal`, `GrassQuality`, `ChangeNameCost`, `RenewGrassCost`, `SpeedupCost`, `MaxBuildingLevel`
- `POST /RenewGrass`
  Request: `RequestObject`
  Response: `ValueResponse` with `Value`
- `POST /RenameStadium`
  Request: `TextRequest`
  Response: `ResponseObject`
- `POST /Build`
  Request: `OrderRequest`
  Response: `TextResponse` with `Text`
- `POST /BuildPlaces`
  Request: `StadiumPlacesRequest`
  Response: `StadiumPlacesResponse` with `Places`
- `POST /Speedup`
  Request: `IdRequest` with `Id`
  Response: `ResponseObject`
- `POST /GetUnderConstruction`
  Request: `RequestObject`
  Response: `UnderConstructionResponse` with `Building`

Important stadium contracts:

- `BuildingData`: `Id`, `Name`, `Description`, `EffectName`, `CurrentValue`, `MaxValue`, `NewValue`, `BuildStart`, `BuildEnd`, `Earnings`, `Utilization`, `UpgradeCost`, `UpgradeCostPremium`, `DailyCost`, `DailyCostIncrease`, `Profit`, `ProfitSign`, `ProfitIncrease`, `Duration`, `Capacity`, `HasWarning`

`ITrainingApi`

- `POST /GetTraining`
  Request: `RequestObject`
  Response: `TrainingData` with `TeamTraining`, `TacticTraining`, `TrainingCamp`, `IndividualTraining`
- `POST /SaveTeamTraining`
  Request: `TeamTrainingInfo`
  Response: `TeamTrainingData` with `MainSkillIndex`, `SubSkillIndex`, `BoringDate`, `EfficiencyText`, `EfficiencyValue`, `NoTraining`
- `POST /SaveTacticTraining`
  Request: `IdRequest` with `Id`
  Response: `TacticTrainingData` with `TacticBonusList`, `SelectedTacticId`
- `POST /BookCamp`
  Request: `TrainingCampBookInfo`
  Response: `TrainingCampData` with `CampItems`, `UpdateCampsCost`, `IsUpdateEnabled`
- `POST /CancelCamp`
  Request: `RequestObject`
  Response: `TrainingCampData` with `CampItems`, `UpdateCampsCost`, `IsUpdateEnabled`
- `POST /UpdateCamps`
  Request: `RequestObject`
  Response: `TrainingCampData` with `CampItems`, `UpdateCampsCost`, `IsUpdateEnabled`
- `POST /StartIndividualTraining`
  Request: `IndividualTrainingInfo`
  Response: `IndividualTrainingData` with `Players`, `TrainPrice`, `RenewPrice`, `RenewAllPrice`
- `POST /CancelIndividualTraining`
  Request: `IndividualTrainingInfo`
  Response: `IndividualTrainingData` with `Players`, `TrainPrice`, `RenewPrice`, `RenewAllPrice`
- `POST /RenewIndividualTraining`
  Request: `IndividualTrainingInfo`
  Response: `IndividualTrainingData` with `Players`, `TrainPrice`, `RenewPrice`, `RenewAllPrice`
- `POST /RenewAllIndividualTrainings`
  Request: `RequestObject`
  Response: `IndividualTrainingData` with `Players`, `TrainPrice`, `RenewPrice`, `RenewAllPrice`

`ITransfermarketApi`

- `POST /PlaceBid`
  Legacy request/response form: `JsonTransfermarket`
- `POST /PlaceBid`
  New request form: `TransfermarketBid`
  Response: `ResponseObject`
- `POST /GetBid`
  Request: `JsonTransfermarket`
  Response: `JsonTransfermarket`
- `POST /Search`
  Request: `TransfermarketInfo`
  Response: `TransfermarketData` with `Players`, `Favorites`, `Sellings`, `MyTeamId`
- `POST /GetDetails`
  Request: `TransfermarketDetailsInfo`
  Response: `TransfermarketDetailsResponse` with `BidCost`, `Player`, `AuctionPlayer`, `MyTeamId`
- `POST /GetFavorites`
  Request: `RequestObject`
  Response: `TransfermarketData` with `Players`, `Favorites`, `Sellings`, `MyTeamId`
- `POST /AddFavorite`
  Request: `TransfermarketBid`
  Response: `ResponseObject`
- `POST /RemoveFavorite`
  Request: `TransfermarketBid`
  Response: `ResponseObject`

`ITutorialApi`

- `POST /GetTutorial`
  Request: `RequestObject`
  Response: `TutorialResponse` with `CurrentStep`
- `POST /SkipTutorial`
  Request: `RequestObject`
  Response: `TutorialResponse` with `CurrentStep`
- `POST /FinishTutorialStep`
  Request: `RequestObject`
  Response: `TutorialResponse` with `CurrentStep`
- `POST /ResetTutorial`
  Request: `TutorialRequest`
  Response: `TutorialResponse` with `CurrentStep`

`IUserApi`

- `POST /ClaimDailyReward`
  Request: `RequestObject`
  Response: `ValueResponse` with `Value`
- `POST /GetHelpshiftUserInfo`
  Request: `RequestObject`
  Response: `HelpshiftUserResponse` with `UserId`, `ManagerName`, `PurchasesAmount`, `CreationDate`, `PurchasesLTV`, `ClubName`, `LeagueName`, `UserLevel`
- `POST /GetPreferences`
  Request: `RequestObject`
  Response: `PreferencesResponse` with `NotificationSettings`, `UserData`
- `POST /SavePreferences`
  Request: `PreferencesRequest`
  Response: `ResponseObject`
- `POST /UpdateUser`
  Request: `UpdateUserRequest`
  Response: `UpdateUserResponse` with `EmailReward`, `FacebookReward`
- `POST /DeleteAccount`
  Request: `RequestObject`
  Response: `ResponseObject`

Exact notification preference fields:

- `AuctionOverbid`
- `MatchResults`
- `LineupIncomplete`
- `FriendInvite`
- `IneffectiveTraining`
- `FriendlyMatch`
- `System`
- `AuctionEnd`

## 3. Legacy `/GameEngine/` endpoints still used by the app

The app still carried a large legacy route surface through `ITeamApi`, `IPlayerApi`, and `IAuthenticationApi`. These routes use older `Json*` contracts and often round-trip the same object type as both request and response.

### Legacy bootstrap and definitions

`IAuthenticationApi`

- `/Login` with `JsonUser` returns `JsonUser`
- `/GetCurrentAppVersion` with `JsonAppVersion` returns `JsonAppVersion`
- `/VerifyPurchase` with `JsonPurchase` returns `JsonPurchase`
- `/GetDate` with `JsonDate` returns `JsonDate`
- `/FacebookAssign` with `JsonUser` returns `JsonUser`
- `/ValidateManagerName` with `JsonNameValidation` returns `JsonNameValidation`
- `/GetDefinitions` with `JsonDefinitions` returns `JsonDefinitions`
- `/CheckPunishments` with `JsonPunishment` returns `JsonPunishment`
- `/GetActivePackages2` with `JsonPackages` returns `JsonPackages`
- `/GetAllPackages2` with `JsonPackages` returns `JsonPackages`
- `/GetSettings2` with `JsonSettings` returns `JsonSettings`

Recovered top-level legacy bootstrap contracts:

- `JsonUser`: `AppVersion`, `ID`, `IsGuest`, `IsAdmin`, `TeamID`, `ManagerName`, `Password`, `Created`, `EMail`, `FacebookId`, `AppleId`, `LastLogin`, `LastActivity`, `LastProfileUpdate`, `Hash`, `Level`, `IsRewarded`
- `JsonAppVersion`: `Version`, `AppStoreUrl`, `ShowUpdateMessage`, `MaintenanceMessage`
- `JsonPurchase`: `TeamID`, `Identifier`, `Receipt`, `IsSubscription`, `Return`
- `JsonDate`: `Date`
- `JsonNameValidation`: `IsValid`, `Name`
- `JsonDefinitions`: `Seasons`, `Championships`, `LeagueHirachies`, `Countries`, `MatchTypes`, `MatchTactics`, `MatchEvents`, `MatchSystems`, `MatchPositions`, `MatchSystemFields`, `MatchSystemFieldDirections`, `MailTypes`, `Trikots`, `Emblems`, `IsSale`, `MoodModifiers`, `Parameters`
- `JsonPunishment`: `UserID`, `IsPunished`, `TypeID`, `EndDate`, `Message`
- `JsonPackages`: `Packages`
- `JsonSettings`: `Costs`, `Dates`

### Legacy team, league, match, ladder, money, transfer, tutorial, and player endpoints

`ITeamApi` exact route list:

- `/SaveUser` `JsonUser -> JsonUser`
- `/GetTeam` `JsonTeam -> JsonTeam`
- `/RemoveEmail` `JsonRemoveEmails -> JsonRemoveEmails`
- `/GetLeague` `JsonLeague -> JsonLeague`
- `/GetLeagueShort` `JsonLeague -> JsonLeague`
- `/GetLeagueMatches` `JsonLeague -> JsonLeague`
- `/GetLeagueGoalGetter` `JsonLeague -> JsonLeague`
- `/GetMatchDetails` `JsonMatchDetails -> JsonMatchDetails`
- `/TeamLike` `JsonTeamLike -> JsonTeamLike`
- `/GetStadium2` `JsonStadium -> JsonStadium`
- `/ChangeStadiumName` `JsonStadiumAction -> JsonStadiumAction`
- `/ChangeTeamName` `JsonTeam -> JsonTeam`
- `/BuyStadiumBuilding2` `JsonStadiumAction -> JsonStadiumAction`
- `/BuyStadiumBuilding3` `JsonStadiumAction -> JsonStadiumAction`
- `/SpeedUpStadiumBuilding2` `JsonStadiumAction -> JsonStadiumAction`
- `/GetSponsorOffer` `JsonSponsor -> JsonSponsor`
- `/AcceptSponsorOffer` `JsonSponsorOffer -> JsonSponsorOffer`
- `/CreateNewSponsorOffer` `JsonSponsorOffer -> JsonSponsorOffer`
- `/CreatePressRelease` `JsonPressRelease -> JsonPressRelease`
- `/DeletePressRelease` `JsonPressRelease -> JsonPressRelease`
- `/GetMatchFormation` `JsonMatchFormation -> JsonMatchFormation`
- `/SetMatchFormation` `JsonMatchFormation -> JsonMatchFormation`
- `/GetBookings` `JsonBookings -> JsonBookings`
- `/GetBookingsHistory` `JsonBookingsHistory -> JsonBookingsHistory`
- `/GetLeagueID` `JsonLeagueID -> JsonLeagueID`
- `/StarsPurchase` `JsonStarsPurchase -> JsonStarsPurchase`
- `/SetTrikot` `JsonTrikot -> JsonTrikot`
- `/SetEmblem` `JsonEmblem -> JsonEmblem`
- `/GetYouthPlayer` `JsonYouthPlayer -> JsonYouthPlayer`
- `/SpeedUpSpecialScout` `JsonYouthPlayer -> JsonYouthPlayer`
- `/FindFriend` `JsonFriendSearch -> JsonFriendSearch`
- `/SearchTransfermarket` `JsonSearchTransfermarket -> JsonSearchTransfermarket`
- `/GetTransfermarketBids` `JsonPlayer -> JsonPlayer`
- `/RunTestMatch` `JsonTestMatch -> JsonTestMatch`
- `/GetHtml` `JsonHtml -> JsonHtml`
- `/GetLadders` `JsonLadder -> JsonLadder`
- `/JoinLeaveLadder` `JsonLadder_Team -> JsonLadder_Team`
- `/GetLadders2` `JsonLadder -> JsonLadder`
- `/GetLadderTeams2` `JsonLadder_Team -> JsonLadder_Team`
- `/JoinLeaveLadder2` `JsonLadder_Team -> JsonLadder_Team`
- `/GetLadderChallenge2` `JsonLadderChallenge -> JsonLadderChallenge`
- `/CreateFriendly` `JsonFriendly -> JsonFriendly`
- `/DeleteFriendly` `JsonFriendly -> JsonFriendly`
- `/AcceptFriendly` `JsonFriendly -> JsonFriendly`
- `/EnableMatchPush` `JsonMatch -> JsonMatch`
- `/GetMoney` `JsonMoney -> JsonMoney`
- `/RenewStadiumGrass` `JsonStadium -> JsonStadium`
- `/UpdateTransfermarketFavourites` `JsonSearchTransfermarket -> JsonSearchTransfermarket`
- `/GetTransfermarketFavourites` `JsonSearchTransfermarket -> JsonSearchTransfermarket`
- `/UpdateLadderMatches` `JsonLadderChallenge -> JsonLadderChallenge`
- `/RenewPlayerContract` `JsonExtendedPlayer -> JsonExtendedPlayer`
- `/UpgradePlayer2` `JsonExtendedPlayer -> JsonExtendedPlayer`
- `/SellPlayerToBank` `JsonExtendedPlayer -> JsonExtendedPlayer`
- `/GetCups` `JsonCup -> JsonCup`
- `/GetCupMatches` `JsonCup -> JsonCup`
- `/GetResources` `ServiceObject -> JsonMoney`
- `/ExtendPlayerContract` `PlayerContractInfo -> PlayerContractData`
- `/GetPlayerContractCost` `PlayerContractInfo -> PlayerContractData`
- `/GetLineupStatus` `LineupStatusInfo -> LineupStatusData`
- tutorial endpoints duplicated here: `/GetTutorial`, `/SkipTutorial`, `/FinishTutorialStep`, `/ResetTutorial`

Important recovered legacy gameplay contracts:

- `JsonTeam`: `LeagueID`, `ForceUpdate`, `User`, `LastStrength`, `Team`, `LastScoutedYouthPlayer`, `TeamLikes`, `PressReleases`, `Accomplishments`, `Mails`, `LastMatch`, `NextMatch`, `Trikots`, `Emblems`, `MatchChallenges`, `TrainingExercises`
- `JsonLeague`: `ID`, `TeamID`, `SeasonID`, `LeagueName`, `Mount`, `Dismount`, `Order`, `Team_Leagues`, `Matches`, `GoalGetters`
- `JsonMatchDetails`: `Match`, `Report`, `HomeStadiumSize`, `Formations`
- `JsonStadium`: `TeamID`, `Stadium`, `StadiumBuildings`, `StadiumBuildingProperties`, `StadiumBuildingPropertyValues`, `ForceReload`, `CurrentBuildingsInfo`, `UpgradeBuildingsInfo`
- `JsonSearchTransfermarket`: `MarketValue`, `BudgetValue`, `Age`, `Talent`, `Keeper`, `Playmaking`, `Shots`, `Defence`, `BallControl`, `Passing`, `Duel`, `OneOnOne`, `Header`, `Speed`, `Flanks`, `Cornerkick`, `Freekick`, `Penalty`, `Experience`, `Form`, `Leadership`, `Strength`, `MinimumBid`, `PlayerId`, `OnlyKeeper`, `OnlyDefence`, `OnlyMidfield`, `OnlyStriker`, `Players`, `TransfermarketFavourites`
- `JsonTransfermarket`: `ID`, `PlayerID`, `TeamID`, `Offer`, `OfferTeamID`, `Bid`, `EndDate`, `BidTeamLogo`, `HasUpgrade`, `IsSuccessfulBid`, `Player`
- `JsonLadder`: `Ladders`, `MyLadderTeam`
- `JsonLadder_Team`: `LadderID`, `IsJoin`, `IsTop`, `Ladder_Teams`
- `JsonLadderChallenge`: `ChallengeTeamID`, `ChallengeTeamName`, `ChallengeTeamLogo`, `ChallengeTeamTrikot`, `ChallengeTeamSystem`, `ChallengeTeamTactic`, `ChallengeTeamPoints`, `ChallengeHim`, `Report`, `LadderMatches`, `IsVictory`, `WinPoints`, `LossPoints`, `MyStrength`, `OpponentsStrength`
- `JsonExtendedPlayer`: `AuctionID`, `Bid`, `BidIncrement`, `Offer`, `OfferTeamID`, `EndDate`, `BidTeamID`, `BidTeamName`, `OfferTeamName`, `OfferTeamTrikot`, `OfferTeamLogo`, `HasUpgrade`, `BidTeamLogo`, `BonusSkills`, `IsFavorite`
- `JsonMoney`: `Budget`, `MediPacks`, `Coins`
- `JsonCup`: `Cups`, `Matches`
- `JsonPlayer`: `TeamID`, `ForceCache`, `Players`, `ScoutedPlayers`, `TrainingDates`, `MatchTactics`, `TeamTraining`, `IndividualTrainings`, `Remove`
- `JsonPlayerTrainingHistory`: `PlayerID`, `Skill`, `Values`
- `JsonFriendly`: `ID`, `ForeignTeamID`
- `JsonMatch`: `ID`, `SeasonID`, `LeagueID`, `MatchTypeID`, `HomeTeamID`, `HomeMatchTacticID`, `HomePushEnabled`, `AwayTeamID`, `AwayMatchTacticID`, `AwayPushEnabled`, `Date`, `Matchday`, `HomeScore`, `AwayScore`, `HomeStrength`, `AwayStrength`
- `JsonYouthPlayer`: `Position`, `TakePlayer`, `Player`
- `PlayerContractData`: `Resolution`, `Contracts`
- `LineupStatusData`: `Matches`

`IPlayerApi` exact route list:

- `/GetPlayer` `JsonPlayer -> JsonPlayer`
- `/SellPlayer` `JsonTransfermarket -> JsonTransfermarket`
- `/ChangePlayerName` `JsonPlayer -> JsonPlayer`
- `/ChangePlayerNameStars` `JsonPlayer -> JsonPlayer`
- `/ChangePlayerShirtNr` `JsonPlayer -> JsonPlayer`
- `/ChangePlayerShirtNrStars` `JsonPlayer -> JsonPlayer`
- `/ChangePlayerOriginStars` `JsonPlayer -> JsonPlayer`
- `/SaveTraining` `JsonPlayer -> JsonPlayer`
- `/GetPlayerTrainingHistory` `JsonPlayerTrainingHistory -> JsonPlayerTrainingHistory`
- `/SaveTrainingCamp` `JsonTeam_TrainingCamp -> JsonTeam_TrainingCamp`
- `/HealPlayer` `JsonPlayer -> JsonPlayer`
- `/BidPlayer` `JsonTransfermarket -> JsonTransfermarket`
- `/FirePlayer` `JsonPlayer -> JsonPlayer`
- `/SaveTeamTraining` `JsonPlayer -> JsonPlayer`
- `/SaveIndividualPlayerTraining` `JsonPlayer -> JsonPlayer`
- `/RenewIndividualPlayerTraining` `JsonPlayer -> JsonPlayer`
- `/RenewAllIndividualPlayerTraining` `JsonPlayer -> JsonPlayer`

## 4. Exact SignalR real-time endpoints and events

Recovered exact hub URLs and subscriptions:

- Auction hub: `NewBackendUrl + "/auc"`
  Event subscribed by client: `Bidded`
  Payload type: `JsonRealtimeBid`
- Chat hub: `NewBackendUrl + "/chat"`
  Event subscribed by client: `Typing`
  Payload: `Guid`, `string`
  Event subscribed by client: `Post`
  Payload: `Guid`, `ChatMessage`

These hubs are required to reproduce real-time auction updates and chat behavior exactly as the client expected it.

## 5. What is still not exact from the client alone

The client gives the exact route names, exact request and response type names, exact top-level contract members, exact base URLs, exact headers, and exact hub paths. It does not, by itself, recover:

- the full nested property tree of every subordinate DTO
- the exact server-side validation rules for every field
- database schema details
- internal authorization policies beyond what the client transmits

Even with that limit, this document is exact enough to recreate the public nodes, route names, transport model, and top-level contracts that the shipped client depended on.