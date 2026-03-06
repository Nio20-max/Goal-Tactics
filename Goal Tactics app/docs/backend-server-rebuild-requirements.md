# Backend Server Rebuild Requirements

This file describes the server-side software and deployment details that are necessary to rebuild the Goal Tactics backend as closely as the recovered client allows. Where the client proves something exactly, this document states it as exact. Where the client only implies it, this document marks it as reconstruction.

## 1. Exact server endpoints and hosting clues recovered from the client

Exact URLs embedded in `GT.Core.URLHelper`:

- legacy production: `https://engine.goaltactics.de/GameEngine/`
- legacy staging: `http://goaltacticswebapp-goaltacticswebappstaging.azurewebsites.net/GameEngine/`
- new production: `https://gtwebapp2.azurewebsites.net/`
- new staging: `http://gtwebapp2-gtwebapp2staging.azurewebsites.net/`

What this proves:

- the production system used Azure App Service hostnames
- the app spoke to two backend generations in parallel
- the older backend lived under a `/GameEngine/` path
- the newer backend exposed an `/api/` route base and SignalR hubs off the root host

Exact real-time hub paths:

- `/chat`
- `/auc`

This means a rebuild needs both a request-response API layer and a real-time hub layer.

## 2. Minimum backend runtime architecture

### New backend

The newer backend is best reconstructed as:

- ASP.NET Core Web API
- ASP.NET Core SignalR
- JSON serialization compatible with the DTOs in `GT.Core`
- token-based authentication for the new service layer

Why this is strongly supported:

- the client bundles Microsoft ASP.NET Core SignalR client libraries
- the new services target `NewBackendUrl + "api/"`
- `AuthResponse` exposes a bearer-style `Token`
- chat and auction updates are delivered via hubs

### Legacy backend

The legacy backend is best reconstructed as:

- a separate API surface at `/GameEngine/`
- request signing support compatible with `ICrypterService.Sign(...)`
- JSON DTOs matching the older `Json*` contracts

Why this is strongly supported:

- the client still calls many `ITeamApi`, `IPlayerApi`, and `IAuthenticationApi` routes under the old base URL
- legacy `RequestObject` fields include `Signature`, `Token`, `Locale`, `UtcOffset`, `Culture`, and `Platform`
- the client fills and signs those request objects before sending them

If you rebuild only one backend generation, the client will still be incomplete unless you also port the routes that remained on the legacy surface.

## 3. Exact transport behavior to preserve

### HTTP

The new typed Refit layer expects:

- JSON request bodies
- JSON responses
- the header `x-goaltactics-version`
- the header `x-goaltactics-capabilities`
- the exact capability string `youthlist,htmligm,friendlist,indtrainings`

The legacy layer expects:

- signed request bodies
- token injection into request objects
- locale, culture, UTC offset, and platform information

### SignalR

The rebuilt backend must expose:

- a chat hub at `/chat`
- an auction hub at `/auc`

Exact events the client subscribes to:

- chat hub event `Typing`
- chat hub event `Post`
- auction hub event `Bidded`

Without these hubs, the app will lose real-time chat and live transfer-market behavior.

## 4. Exact functional domains the backend must implement

These domains are not optional. They are directly visible in the route surface and response contracts.

### Authentication and account state

Must support:

- login
- login verification
- registration
- app-version checks
- punishment checks
- manager-name validation
- Facebook linking or assignment
- guest and normal account flows

Important exact auth contracts:

- `AuthResponse`: `Token`, `UserId`, `Level`, `IsAdmin`
- legacy `JsonUser`: user identity, team association, manager credentials, timestamps, level, and reward flags

### Club and resources

Must support:

- team info
- extended team info
- club news
- current resources
- mail handling
- accomplishments
- finance history
- finances summary
- team renaming

### Squad and player lifecycle

Must support:

- squad fetches
- team-player lookups
- player stats
- training progress
- rename/origin/shirt changes
- player sale and firing
- contract cost and contract extension
- upgrade and skill-card usage
- healing

### Match preparation and competition

Must support:

- saved lineups
- formation retrieval and saving
- lineup lock status
- live match detail lookup
- league tables, fixtures, and goalscorers
- friendly creation and acceptance
- GT Ladder data and ladder challenge execution
- push enablement for matches

### Stadium and infrastructure

Must support:

- stadium fetches
- rename
- grass renewal
- building upgrades
- place-building upgrades
- build speedups
- under-construction lookups

### Training systems

Must support:

- team training
- tactic training
- training camps
- individual training
- renewals and cancellations

### Scouting and transfer market

Must support:

- timed scouting
- premium scouting
- scout speedups
- player recruitment
- transfer search filters
- bids
- auction details
- favorites
- own-selling lists

### Monetization and shop

Must support:

- product catalog
- equipment catalog
- buying products
- buying or using equipment
- purchase verification
- daily reward claiming

### Settings and support identity

Must support:

- notification preferences
- user updates
- account deletion
- Helpshift user metadata lookup
- tutorial state

## 5. Reconstructed server-side components

The client does not reveal the exact server repository, but it does define the components the server must have.

### Web API layer

Required for all recovered REST endpoints.

Recommended implementation:

- ASP.NET Core controllers or minimal APIs for the new backend
- a compatibility layer for the old `/GameEngine/` nodes if you want binary client compatibility

### SignalR layer

Required for:

- chat posts and typing notifications
- real-time auction bid updates

### Persistent data store

Not exact from the client, but a relational database is the most plausible fit.

It must persist:

- users
- teams and leagues
- players and contracts
- training state
- stadium state
- auctions and bids
- messages and chat history
- sponsorship state
- tutorial state
- purchases and rewards
- notification settings

### Background jobs and timers

A rebuild needs scheduled processing for:

- match simulation
- ladder updates
- auction endings
- sponsor expirations
- training expirations and renewals
- construction completion
- scouting cooldown completion
- season turnover

### Push-notification service

The Android client subscribes to Firebase topics:

- `global`
- the exact per-user topic of the current user ID

So the backend must be able to send FCM messages to:

- global broadcast topic
- per-user topics

## 6. Third-party services the production system depended on

These are not the core game backend, but they were part of the original deployment and client expectation set.

### Firebase

Used by the client for:

- push messaging
- analytics support libraries
- installations/device identity

A rebuild that wants original behavior should include:

- Firebase Cloud Messaging project configuration
- server-side FCM sending credentials

### Google Play Billing

The client includes Google billing support and calls purchase-verification routes.

A rebuild needs:

- server-side purchase verification logic
- SKU mapping to in-game rewards
- replay protection for receipts or purchase tokens

### Facebook Login

The client initializes Facebook SDK support and carries Facebook application configuration.

A rebuild needs:

- Facebook app setup
- backend support for linked-auth identities
- account-link conflict handling

### Helpshift

The Android shell initializes Helpshift directly and expects user metadata from the backend.

A rebuild needs either:

- Helpshift with equivalent app/domain configuration
- or a replacement support system plus a compatibility layer if the original client must still run

### IronSource rewarded ads

The app initializes rewarded video and uses ad rewards as premium progression.

A rebuild needs:

- rewarded-ad provider configuration
- backend reward confirmation and anti-abuse logic

### App Center and AppsFlyer

These were used for analytics, crash reporting, and attribution.

They are not required for gameplay correctness, but they were part of the production stack.

## 7. Deployment shape that most closely matches the recovered client

The closest practical reconstruction is:

1. Azure App Service or an equivalent HTTPS host.
2. ASP.NET Core application exposing:
   - `/api/...` routes for the new backend
   - `/chat` SignalR hub
   - `/auc` SignalR hub
3. A legacy compatibility application or module exposing `/GameEngine/...` routes.
4. A relational database.
5. A background-job system.
6. FCM credentials for push delivery.
7. Billing verification, social login, and rewarded-ad integrations.

If exact binary compatibility with the shipped app is the goal, both backend generations must exist at the same time.

## 8. What cannot be recovered exactly from the client alone

The client does not prove:

- the exact database vendor
- whether Azure App Service ran Windows or Linux
- the exact job scheduler package
- the internal server project structure
- the exact nested DTO and database relationships beyond what is serialized to the client

Those parts must be reconstructed from the public contract and domain logic recovered from the app.

## 9. Bottom line

To rebuild the backend faithfully, you need a dual-surface online service:

- a legacy `/GameEngine/` JSON API with signed requests
- a newer `/api/` token-based API
- SignalR hubs at `/chat` and `/auc`
- persistent storage for clubs, players, matches, leagues, auctions, mail, and progression
- scheduled jobs for time-based systems
- FCM push delivery
- billing and rewarded-ad reward validation

That is the minimum server footprint consistent with the shipped Goal Tactics client.