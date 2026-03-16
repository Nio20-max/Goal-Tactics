# Bot API Translation Summary

This document describes how to call the bot translation engine and what each endpoint expects/returns in translated form.

## How to use

Use `GoalTacticsApiClient.ExecuteForBotAsync(endpoint, request)`.

- `endpoint`: endpoint name like `GetSquad` or `/api/GetSquad`
- `request`: matching request DTO (or omit for endpoints without input)
- Return value: `BotApiTranslation`
  - `Endpoint`: normalized endpoint name
  - `Success`: endpoint success flag (or `true` for no-content success calls)
  - `Request`: compact request fields
  - `Output`: compact, bot-friendly output

## Endpoint reference

### Register
- Expects: `RegisterRequest` with `isGuest`, `email`, `login`, `managerName`, `teamName`, `countryId`
- Output: `userId`, `login`, `status`, `message`

### Login
- Expects: `LoginRequest` with `email`, `password`
- Output: `token`, `userId`, `managerName`, `level`, `isAdmin`

### Ping
- Expects: none
- Output: `message`

### GetCountries
- Expects: none
- Output: `countries[]` with `id`, `name`, `isoCode`

### GetMyResources
- Expects: none
- Output: `money`, `medipacks`, `gtStars`

### GetMyTeamExtendedInfo
- Expects: none
- Output: `team{id,name,country,strength}`, `season`, `matchday`

### GetSquad
- Expects: none
- Output: `players[]`, `playersOnTransfermarket[]` with key player info:
  - `id`, `name`, `position`, `strength`, `talent`, `age`, `fitness`, `salary`, `marketValue`, `country`
  - `hasIndividualTraining`, `mainSkill`, `bonusSkills`, `skills`, `yellowCards`, `hasRedCard`, `injured`

### GetSkillCards
- Expects: none
- Output: `cards[]` with `skill`, `rarity`, `count`, `bonus`

### UseSkillCard
- Expects: `IdRequest` with `id` (player id)
- Output: `cardApplied`

### GetLineups
- Expects: none
- Output: `lineups[]` with `matchId`, `lineupId`, `opponent`, `isLocked`, `hasLineup`, `homeName`, `awayName`

### SaveLineup
- Expects: `SaveLineupRequest` with `matchId`, `playerIds[]`, `system`, `tactic`
- Output: `lineupSaved`

### SearchTransfermarket
- Expects: `SearchTransfermarketRequest` with filters (`talent`, `strength`, `age`, `skillIndex`, `minimumBid`, `budget`, `onlyKeeper`)
- Output: `players[]`, `favorites[]`, `sellings[]`, `myTeamId`
  - entries include `playerId`, `name`, `position`, `strength`, `talent`, `age`, `auctionId`, `bid`, `minimumBid`, `isFrozen`

### BidPlayer
- Expects: `BidRequest` with `id` (auction id), `bid`
- Output: `bidAccepted`

### GetTransfermarketFavourites
- Expects: none
- Output: `players[]` (same compact shape as transfer market)

### UpdateTransfermarketFavourites
- Expects: `IdRequest` with `id` (auction id)
- Output: `favouritesUpdated`

### GetTeamTraining
- Expects: none
- Output: `mainSkillIndex`, `subSkillIndex`, `efficiencyValue`, `noTraining`

### SaveTeamTraining
- Expects: `SaveTrainingRequest` with `mainSkillIndex`, `subSkillIndex`
- Output: `teamTrainingSaved`

### SaveIndividualTraining
- Expects: `IdRequest` with `id` (player id)
- Output: `individualTrainingSaved`

### BookTrainingCamp
- Expects: `BookTrainingCampRequest` with `campType`
- Output: `trainingCampBooked`

### GetScoutedPlayers
- Expects: none
- Output: `scoutingCost`, `pendingScoutCount`, `maxSimultaneousScouts`, `players[]`
  - player entries: `id`, `name`, `position`, `talent`, `strength`

### InstructScout
- Expects: `InstructScoutRequest` with `scoutType`, `positionFilter`, `position`, `price`
- Output: `scoutInstructionSent`

### RecruitScoutedPlayer
- Expects: `IdRequest` with `id` (player id)
- Output: `scoutedPlayerRecruited`

### GetSponsorOffers
- Expects: none
- Output: `negotiateCost`, `offers[]`
  - offer entries: `id`, `name`, `money`, `stars`, `bonusPerWin`, `bonusPerGoal`, `contractDays`, `isActive`

### AcceptSponsor
- Expects: `IdRequest` with `id` (sponsor id)
- Output: `sponsorAccepted`

### GetStadium
- Expects: none
- Output: `stadium{name,capacity,grassQuality,earningsAverage}`, `buildings[]`, `maxBuildingLevel`
  - building entries: `id`, `name`, `currentValue`, `maxValue`, `upgradeCost`, `capacity`, `utilization`

### BuildStadium
- Expects: `IdRequest` with `id` (building id)
- Output: `stadiumUpgradeQueued`

### BuildPlaces
- Expects: `BuildPlacesRequest` with `places[]` (`id`, `count`)
- Output: `placeOrderQueued`

### GetFriends
- Expects: `TextRequest` with `text` (search)
- Output: `friends[]`
  - friend entries: `id`, `userName`, `teamName`, `teamId`, `isFriend`, `incoming`, `outgoing`, `myLike`, `likesMe`, `strength`, `challengeStatus`

### Like
- Expects: `IdRequest` with `id` (user id)
- Output: `liked`

### Accept
- Expects: `IdRequest` with `id` (user id)
- Output: `friendAccepted`

### SendChallenge
- Expects: `IdRequest` with `id` (user id)
- Output: `challengeSent`

### PostChatMessage
- Expects: `PostChatMessageRequest` with `message`
- Output: `chatMessageSent`

### GetChatHistory
- Expects: none
- Output: `userId`, `messages[]` with `userId`, `name`, `message`, `date`, `isMine`

### GetLadder
- Expects: none
- Output: `ladderId`, `endDate`, `teams[]`
  - team entries: `teamId`, `teamName`, `rank`, `points`, `strength`, `isMine`

### RunMatch
- Expects: `RunMatchRequest` with `teamId`
- Output: `matchStarted`

### RestoreStamina
- Expects: none
- Output: `staminaRestored`

### WatchAd
- Expects: none
- Output: `rewardValue`

### ClaimDailyReward
- Expects: none
- Output: `claimed`
