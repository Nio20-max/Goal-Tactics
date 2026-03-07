# Client DTO Migration Plan (Phase 3)

## Objective
Migrate transport DTO usage from legacy `Json*` payloads and signed request envelopes to typed contracts that match `/api/*` endpoints.

## Strategy
- Keep stable screen-level presentation models.
- Replace service-layer transport DTOs first.
- Use temporary adapters where endpoint coverage differs.
- Remove adapters once an entire subsystem is migrated and tested.

## Migration matrix

### Authentication
- Replace legacy auth payloads with:
- `AuthRequest`, `RegisterRequest`, `AuthResponse`, `RegisterResponse`
- Token source of truth: `AuthResponse.Token`.

### Team and club
- Map old team/mail/resources objects into:
- `TeamDataResponse`, `ExtendedTeamDataResponse`, `ClubNewsResponse`, `ResourcesResponse`, `MailResponse`, `FinancesResponse`, `FinanceHistoryResponse`, `AccomplishmentsResponse`
- Preserve existing screen models for overview cards and finance chart widgets.

### League and lineup
- Replace league payloads with:
- `LeagueTableResponse`, `LineupsResponse`, `MatchLineupResponse`, `SaveLineupRequest`
- Preserve UI lock behavior via `MatchLineupResponse.IsLocked`.

### Live and match details
- Replace match payloads with:
- `LiveMatchResponse`, `LiveMatchData`
- Keep existing event timeline screen view models.

### Squad and training
- Replace player/training payloads with:
- `SquadResponse`, `PlayerStatisticsResponse`, `TeamTrainingResponse`, `TeamTrainingSaveRequest`, `TacticTrainingSaveRequest`, `TrainingCampRequest`, `IndividualTrainingRequest`
- Retire legacy `SaveTraining` wrappers after all actions are migrated.

### Scouting and transfer market
- Replace payloads with:
- `ScoutingPlayersResponse`, `ScoutInstructionRequest`
- `TransferSearchRequest`, `TransferSearchResponse`, `TransferDetailsResponse`, `BidRequest`
- Keep list cell view models for sorting/filtering state.

### Stadium and sponsors
- Replace payloads with:
- `StadiumResponse`, `BuildPlacesResponse`, `SponsorOffersResponse`
- Keep existing build popup models, map `BuildPlaceData` directly.

### Shop and user settings
- Replace payloads with:
- `ShopProductsResponse`, `ShopEquipmentResponse`, `ShopPurchaseVerifyRequest`
- `PreferencesResponse`, `PreferencesRequest`, `UpdateUserRequest`

### Chat and realtime
- Replace chat payloads with:
- `ChatHistoryResponse`, `ChatPostRequest`, `ChatMessageData`
- Hub payloads:
- `ChatMessage` and `JsonRealtimeBid`

## Adapter classes to keep temporarily
- `LegacyTeamToExtendedTeamAdapter`
- `LegacyLineupToMatchLineupAdapter`
- `LegacyTransferSearchAdapter`
- `LegacyMailAdapter`
- `LegacyTrainingAdapter`

## Adapter deletion checkpoints
- Delete each adapter only after:
- all related screens call only `/api/*`
- response contract tests pass
- no fallback legacy parsing path remains

## DTO hardening rules
- Never deserialize unknown payload to dynamic in production call path.
- Fail fast on schema mismatch and log route + version headers.
- Keep backward-compatible null handling for optional fields during rollout.

## Done definition
- No service-layer class references legacy `Json*` transport DTOs.
- Legacy request-signing envelope types are not required on active API calls.
