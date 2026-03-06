# Managed Assembly Findings

This document captures the exact backend and client behavior recovered from the real Xamarin managed assemblies after extracting and decompiling `GT.Core.dll` and `GT.Droid.dll`.

## What Was Recovered

- `GT.Core.dll` was recovered as a valid managed assembly and decompiled from the payload now extracted to `reverse_engineering/extracted_managed_meta/GT.Core.dll`.
- `GT.Droid.dll` was recovered as a valid managed assembly and decompiled from the payload now extracted to `reverse_engineering/extracted_managed_meta/GT.Droid.dll`.
- The extraction helper used for this pass is `tools/extract_xamarin_assemblies.py`. It now skips empty descriptors and names assemblies from their own metadata instead of trusting the manifest blindly.

## Exact Backend URLs

From `GT.Core.URLHelper`:

- Old production backend: `https://engine.goaltactics.de/GameEngine/`
- Old staging backend: `http://goaltacticswebapp-goaltacticswebappstaging.azurewebsites.net/GameEngine/`
- New production backend: `https://gtwebapp2.azurewebsites.net/`
- New staging backend: `http://gtwebapp2-gtwebapp2staging.azurewebsites.net/`

The old service layer uses `URLHelper.BaseServiceUrl`.

- This is used by `BaseService<T>` and points at the legacy `/GameEngine/` backend.

The newer service layer uses `URLHelper.NewBackendUrl + "api/"`.

- `AuthService`, `ChatService`, `NewStadiumService`, `NewTeamService`, and other `NewBackendService<T>` descendants use the newer Azure-hosted backend.

## Exact Request Headers And Auth Flow

Recovered from `GT.Core.IAuthenticationApi`, `GT.Core.IAuthApi`, and `GT.Core.BaseService<T>`:

- All Refit calls include `x-goaltactics-version`.
- All Refit calls include `x-goaltactics-capabilities`.
- The hard-coded capability string passed by `BaseService<T>.ExecuteApiAsync` is:
  - `youthlist,htmligm,friendlist,indtrainings`
- Before each old-backend request, the client fills:
  - culture
  - locale
  - UTC offset
  - signed request body via `ICrypterService.Sign(...)`
- `BaseService<T>.CheckAuthentication(...)` injects the current token into each request object.
- `AuthService` is the new-backend token authority and exposes:
  - `Login()`
  - `Login(string authId, AuthMethod method)`
  - token state via `Token`
  - user state via `UserId`, `IsAdmin`, `IsUserPunished`

This confirms the app used both a legacy signed request system and a newer token-backed API layer in parallel.

## Confirmed Refit API Interfaces

The exact interfaces are present in `GT.Core` and annotated with explicit route attributes.

Authentication and bootstrap:

- `IAuthenticationApi`
  - `/Login`
  - `/GetCurrentAppVersion`
  - `/VerifyPurchase`
  - `/GetDate`
  - `/FacebookAssign`
  - `/ValidateManagerName`
  - `/GetDefinitions`
  - `/CheckPunishments`
  - `/GetActivePackages2`
  - `/GetAllPackages2`
  - `/GetSettings2`
- `IAuthApi`
  - `/Login`
  - `/VerifyLogin`
  - `/Register`
  - `/Ping`

Social and chat:

- `IChatApi`
  - `/Typing`
  - `/Post`
  - `/GetChatHistory`
- `IFriendsApi`
  - `/GetFriends`
  - `/GetChallenges`
  - `/ReplyChallenge`
  - `/SendChallenge`
  - `/Like`
  - `/Unlike`
  - `/Accept`
  - `/Decline`
  - `/GetFlagCollection`

Competition and live:

- `ILadderApi`
  - `/GetLadder`
  - `/GetLadderChallenge`
  - `/RestoreStamina`
  - `/RunMatch`
- `ILeagueApi`
  - `/GetGoalGetters`
  - `/GetLeagueTable`
  - `/GetMatches`
- `ILiveApi`
  - `/GetMatchDetails`
- `ILineupApi`
  - `/GetLineups`
  - `/GetMatchLineup`
  - `/SaveLineup`

Club and team management:

- `INewTeamApi`
  - `/GetTeamInfo`
  - `/GetMyTeamInfo`
  - `/GetMyTeamExtendedInfo`
  - `/GetClubNews`
  - `/GetMyResources`
  - `/GetMyMail`
  - `/MarkAsRead`
  - `/MarkAllAsRead`
  - `/DeleteMail`
  - `/DeleteAllRead`
  - `/GetAccomplishments`
  - `/GetFinanceHistory`
  - `/GetFinances`
  - `/ChangeTeamName`
- `ITeamApi`
  - `/GetTeam`
  - `/RemoveEmail`
  - `/GetLeague`
  - `/GetLeagueShort`
  - `/GetLeagueMatches`
  - `/GetLeagueGoalGetter`
  - `/GetMatchDetails`
  - `/TeamLike`
  - `/GetStadium2`
  - `/ChangeStadiumName`
  - `/ChangeTeamName`
  - `/BuyStadiumBuilding2`
  - `/BuyStadiumBuilding3`
  - `/SpeedUpStadiumBuilding2`
  - `/GetSponsorOffer`
  - `/AcceptSponsorOffer`
  - `/CreateNewSponsorOffer`
  - `/CreatePressRelease`
  - `/DeletePressRelease`
  - `/GetMatchFormation`
  - `/SetMatchFormation`
  - `/GetBookings`
  - `/GetBookingsHistory`
  - `/GetLeagueID`
  - `/StarsPurchase`
  - `/SetTrikot`
  - `/SetEmblem`
  - `/GetYouthPlayer`
  - `/SpeedUpSpecialScout`
  - `/FindFriend`
  - `/SearchTransfermarket`
  - `/GetTransfermarketBids`
  - `/RunTestMatch`
  - `/GetHtml`
  - `/GetLadders`
  - `/JoinLeaveLadder`
  - `/GetLadders2`
  - `/GetLadderTeams2`
  - `/JoinLeaveLadder2`
  - `/GetLadderChallenge2`
  - `/CreateFriendly`
  - `/DeleteFriendly`
  - `/AcceptFriendly`
  - `/EnableMatchPush`
  - `/GetMoney`
  - `/RenewStadiumGrass`
  - `/UpdateTransfermarketFavourites`
  - `/GetTransfermarketFavourites`
  - `/UpdateLadderMatches`
  - `/RenewPlayerContract`
  - `/UpgradePlayer2`
  - `/SellPlayerToBank`
  - `/GetCups`
  - `/GetCupMatches`
  - `/GetResources`
  - `/ExtendPlayerContract`
  - `/GetPlayerContractCost`
  - `/GetLineupStatus`
  - tutorial reset/get/skip routes duplicated here as well

Squad, player, and training:

- `ISquadApi`
  - `/GetPlayers`
  - `/GetTeamPlayers`
  - `/GetTrainingProgress`
  - `/GetPlayerStatistics`
  - `/RenamePlayer`
  - `/ChangeOrigin`
  - `/ChangeShirt`
  - `/SellPlayer`
  - `/FirePlayer`
  - `/SendToTransfermarket`
  - `/ExtendPlayerContract`
  - `/GetPlayerContractCost`
  - `/UpgradePlayer`
  - `/GetSkillCards`
  - `/UseSkillCard`
  - `/HealPlayer`
- `IPlayerApi`
  - `/GetPlayer`
  - `/SellPlayer`
  - `/ChangePlayerName`
  - `/ChangePlayerNameStars`
  - `/ChangePlayerShirtNr`
  - `/ChangePlayerShirtNrStars`
  - `/ChangePlayerOriginStars`
  - `/SaveTraining`
  - `/GetPlayerTrainingHistory`
  - `/SaveTrainingCamp`
  - `/HealPlayer`
  - `/BidPlayer`
  - `/FirePlayer`
  - `/SaveTeamTraining`
  - `/SaveIndividualPlayerTraining`
  - `/RenewIndividualPlayerTraining`
  - `/RenewAllIndividualPlayerTraining`
- `ITrainingApi`
  - `/GetTraining`
  - `/SaveTeamTraining`
  - `/SaveTacticTraining`
  - `/BookCamp`
  - `/CancelCamp`
  - `/UpdateCamps`
  - `/StartIndividualTraining`
  - `/CancelIndividualTraining`
  - `/RenewIndividualTraining`
  - `/RenewAllIndividualTrainings`

Transfer market, scouting, monetization, support:

- `ITransfermarketApi`
  - `/SearchTransfermarket`
  - `/PlaceBid`
  - `/GetBid`
  - `/Search`
  - `/GetDetails`
  - `/GetFavorites`
  - `/AddFavorite`
  - `/RemoveFavorite`
- `IScoutingApi`
  - `/GetPlayers`
  - `/Instruct`
  - `/Recruit`
  - `/Speedup`
- `IShopApi`
  - `/GetProducts`
  - `/BuyProduct`
  - `/GetEquipment`
  - `/BuyEquipment`
  - `/UseEquipment`
  - `/VerifyPurchase`
- `ISponsorApi`
  - `/GetSponsors`
  - `/Accept`
  - `/Negotiate`
- `ITutorialApi`
  - `/GetTutorial`
  - `/SkipTutorial`
  - `/FinishTutorialStep`
  - `/ResetTutorial`
- `IUserApi`
  - `/ClaimDailyReward`
  - `/GetHelpshiftUserInfo`
  - `/GetPreferences`
  - `/SavePreferences`
  - `/UpdateUser`
  - `/DeleteAccount`

## Exact Real-Time Behavior

Two SignalR channels are explicitly implemented in `GT.Core`.

Transfer market live bids:

- Class: `TransfermarketBidService`
- Hub URL: `URLHelper.NewBackendUrl + "/auc"`
- Event subscription: `Bidded`
- Payload type: `JsonRealtimeBid`
- Behavior:
  - starts a SignalR connection lazily
  - reconnects after `Closed` if an exception occurred
  - raises a local `BidUpdated` event for the UI

Global club chat:

- Implemented directly in `ChatViewModel`
- Hub URL: `URLHelper.NewBackendUrl + "/chat"`
- Event subscriptions:
  - `Typing(Guid, string)`
  - `Post(Guid, ChatMessage)`
- Behavior:
  - fetches history first via REST using `ChatService.GetChatHistory()`
  - then connects to SignalR for live typing and message events
  - maintains per-user typing timers client-side

This confirms that Goal Tactics used REST for snapshot fetches and SignalR for live incremental updates.

## Exact Android Layer Behavior

Recovered from `GT.Droid`:

- `MainActivity` is the main Android shell class.
- `MainActivity` implements `IRewardedVideoListener`, confirming rewarded video ads are handled directly by the main shell.
- `MainActivity.OnCreate(...)` initializes:
  - Helpshift
  - Facebook SDK
  - service registration and navigation shell
- `MainActivity.OnNewIntent(...)` processes:
  - deep links for `acceptchallenge`
  - deep links for `addfriend`
  - notification-open flows via `OpenAppFromNotification(...)`
- `MainActivity.InitializeHelpshift()` installs Helpshift with concrete app credentials for `xyrality.helpshift.com`.
- `MainActivity` registers `AppsFlyerAnalyticsService`.
- `MainActivity` uses IronSource rewarded video callbacks and delays in-app notifications while ads are open.

Push and local notifications:

- `MyFirebaseMessagingService : FirebaseMessagingService`
  - reads Firebase push payloads
  - extracts optional `icon` and `parameter` values from data payloads
  - forwards them into the in-app shell as `NotificationData`
- `AlarmHandler : BroadcastReceiver`
  - receives scheduled local notification intents
  - forwards them to `AndroidNotificationManager`
- `LocalNotificationService`
  - creates and schedules local notifications via `AlarmManager`

The resource set confirms many local notification templates exist for:

- auction ending soon
- building completion
- inactivity reminders
- player contract expiration
- season end and season start
- single training expiration
- sponsor expiration

## What This Confirms About The Architecture

- Goal Tactics was not just a simple REST game client. It had two backend generations active at once.
- The app had a large Refit-based typed API surface, organized by domain service.
- The newer Azure backend added token auth and SignalR-based live features.
- Transfer market bidding and club chat were genuinely real-time.
- Android shell code handled support, attribution, ads, push, local notifications, deep links, and shell navigation in managed C# rather than in Java.

## Most Important Recovered Code Locations

- `reverse_engineering/decompiled/GT.Core.actual/store0_idx17.decompiled.cs`
  - exact API interfaces, headers, base URLs, auth flow, service classes, SignalR wiring
- `reverse_engineering/decompiled/GT.Droid.actual/GT.Droid.decompiled.cs`
  - `MainActivity`, Firebase messaging, Helpshift, AppsFlyer, IronSource, notification handling
- `tools/extract_xamarin_assemblies.py`
  - extractor used to recover the real managed payloads
