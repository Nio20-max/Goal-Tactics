# Backend and Live Services Reconstruction

## Executive summary

The backend was almost certainly the authoritative center of the game. The APK contains strong evidence for a layered client stack:

- GT.Core shared game logic
- Refit for typed HTTP APIs
- a BaseService with ExecuteApiAsync-style calls
- an AuthenticationManager and token-related metadata
- a custom request header named x-goaltactics-v
- ASP.NET Core SignalR client libraries for real-time channels
- Firebase messaging for push delivery

For a game with global chat, league tables, shared auctions, friendlies, GT Ladder, and season timing, a server-authoritative architecture is the only design that fits the available evidence.

## What the backend had to own

Even without reading every method body, the backend had to be responsible for at least these domains.

### 1. Authentication and identity

Strong evidence:

- GT.Core.AuthenticationManager metadata exists in the managed blob.
- token-related strings are present.
- Facebook login is integrated.
- manager-name and password sign-in strings exist.

Most likely responsibilities:

- create account
- sign in with manager credentials
- issue session or bearer tokens
- optionally link Facebook identity to the same club account
- validate app version or client compatibility, likely with x-goaltactics-v

The custom header x-goaltactics-v strongly suggests the backend needed to know which app version the client was running. That is useful for feature gating, compatibility enforcement, and rollout control.

### 2. Persistent club state

The server almost certainly stored the full source of truth for each club, including:

- club name and manager identity
- fans and members
- league placement
- finances and transaction history
- stadium and building levels
- owned shirts and emblems
- current sponsors
- squad composition
- lineup and tactics for upcoming games
- inbox messages and accomplishment history

This state could not safely live only on device because it interacted with shared competition and monetized progression.

### 3. Player and squad domain

The backend likely stored each player's:

- position
- age and talent
- primary and secondary skills
- strength and quality tier
- salary and contract end date
- training state
- injury state
- transfer status
- upgrade state
- cosmetic and identity edits such as name, origin, or shirt number

The client may have cached these values, but the authoritative version almost certainly lived remotely.

### 4. Time-based progression

A large portion of the game was timer-driven. The backend likely scheduled and resolved:

- building upgrades
- scouting cooldowns
- special scout cooldowns
- training expiration and renewals
- sponsor contract durations
- auction end times
- season start and season end timing
- contract expiry dates

This is why the app mixes local notifications with server refreshes. Local alarms reminded the user, but the actual completion state was most likely validated against server time.

### 5. Match simulation and competition logic

This is the most important backend responsibility.

The server likely handled:

- league fixture generation
- matchday scheduling
- ladder pairing or bracket logic
- friendly challenge scheduling and acceptance
- simulation of each match outcome
- generation of tables, scores, goalscorers, and match reports
- locking lineups one hour before kickoff

Why this is the most plausible model:

- league and ladder competition were shared across many clubs
- tables and goalscorer lists must be consistent for all players
- friendlies involve two remote clubs
- team strength and tactics had to resolve fairly and consistently
- a server-authoritative model prevents simple client cheating

The client therefore most likely submitted pre-match intent, not final match results.

### 6. Transfer market and auctions

The transfer market appears to have been a global backend system.

The backend probably handled:

- market search queries and filters
- player listing creation
- bidding logic
- overbid detection
- auction close and winner selection
- immediate sale options
- final settlement of currency and player ownership

This is another feature that cannot work reliably as device-local state. It depends on synchronized timing and shared ownership records.

### 7. Social graph and messaging

The backend likely stored and managed:

- friendship relationships
- friend requests and accept or decline state
- friendly match invitations
- manager search
- inbox messages for both system and player events
- community chat channels

The chat feature is especially important because the client bundles SignalR. That is a strong sign that at least part of messaging used a real-time hub connection rather than pure request and refresh polling.

## Likely transport model

## Standard request and response traffic: HTTP API

Refit is a typed REST client library for .NET. The blob also exposes BaseService and ExecuteApiAsync naming. That strongly suggests the client used a service layer that wrapped JSON HTTP calls.

The most likely HTTP categories were:

- authentication
- fetch club state
- fetch squad and player details
- submit lineup and training changes
- buy or consume shop items
- fetch league tables and fixtures
- search transfer market
- create bids or listings
- fetch inbox and accomplishments

This would be the ordinary, state-fetching backbone of the app.

## Real-time traffic: SignalR

The assembly manifest includes Microsoft.AspNetCore.SignalR.Client and Microsoft.AspNetCore.SignalR.Protocols.Json. The managed blob also includes Hub, LongPoll, Negotiate, OnHubClose, and related symbols.

That makes the following model highly likely:

- client authenticates first through the normal API
- client negotiates one or more SignalR hub connections
- hub transports real-time or near-real-time updates where immediate visibility matters

The features most likely to use SignalR were:

- global chat
- live match ticker or live match event feed
- possibly ladder or challenge status changes
- possibly inbox or notification-style immediate updates while the app is open

It is less likely that all gameplay used SignalR. More likely, SignalR was used for selective live channels, while the main game state stayed HTTP-driven.

## Push and wake-up flow

The app uses both Firebase Cloud Messaging and a local Android AlarmHandler.

That suggests two separate notification paths:

- Server-triggered push: used for important remote events such as messages, season changes, or events that happen while the app is closed.
- Client-scheduled local alarms: used for predictable timers the app already knows about, such as training expiration, sponsor expiry, contract deadlines, auction endings, and building completion reminders.

This is a common pattern in live mobile games because it reduces backend push volume while still re-engaging the user at the right time.

## Monetization backend responsibilities

The app monetized through both direct payments and rewarded ads.

### In-app purchases

Strong evidence:

- Google Play Billing is declared in the manifest.
- billing.properties is present.
- Plugin.InAppBilling and Xamarin.Android.Google.BillingClient are bundled.

The likely purchase flow was:

1. Client asks the store for star pack products.
2. Google Play handles the purchase transaction.
3. Client sends proof of purchase to the Goal Tactics backend or validates through a secured path.
4. Backend credits the player's account with purchased stars.

Even if some validation happened locally first, final premium-currency credit should have been persisted server-side.

### Rewarded video ads

Strong evidence:

- MainActivity implements IronSource rewarded video callbacks.
- resource strings include Watch video and no videos available states.
- Goal Tactics.md says rewarded ads granted 100 stars each in the current version.

The likely flow was:

1. Client requests ad availability from IronSource.
2. User watches a rewarded ad.
3. Reward callback fires in MainActivity.
4. Client grants or confirms the star reward.
5. Backend persists the premium-currency increase and any anti-abuse rules.

Because stars are premium currency and valuable across devices, the safe model is that the backend finalizes the balance.

## Analytics, support, and operational services

The backend story is not only the game server. The product also depended on several operational services.

### Firebase

Used for:

- push notifications through Firebase Messaging
- analytics through Firebase Analytics
- installations or device identity through Firebase Installations

Firebase was not the game backend itself. It was supporting infrastructure.

### Helpshift

Used for:

- FAQ delivery
- support conversations
- customer support ratings
- user-to-support attachments and message history

This gave the app a built-in service desk separate from the in-game chat.

### AppsFlyer

Used for:

- install attribution
- campaign measurement
- marketing source tracking

### App Center

Used for:

- analytics
- crash reporting

This helped the operator monitor app health and user behavior.

### Facebook SDK

Used for:

- login or account linking
- social invites and sharing

## Backend behavior by feature area

### League backend

Most likely responsibilities:

- assign clubs to leagues
- compute fixtures for each season
- run scheduled matchdays
- update league table, home table, away table, goalscorers, and statistics
- archive season results

### GT Ladder backend

Most likely responsibilities:

- register participating clubs
- consume and refill team stamina
- match players into ladder games
- resolve ladder standings or rewards

### Scouting backend

Most likely responsibilities:

- enforce cooldowns
- generate youth prospects by position, age, talent, and quality
- distinguish standard and special scout results
- apply speedup logic

### Training backend

Most likely responsibilities:

- apply daily or periodic stat progression
- resolve training-camp modifiers
- expire individual training sessions
- update tactic levels
- store player upgrade state

### Stadium and club development backend

Most likely responsibilities:

- start and complete building jobs
- enforce level requirements
- apply building bonuses to training, scouting, fitness, health, or earnings
- charge currency and optional speedups

### Economy backend

Most likely responsibilities:

- maintain separate balances for money and stars
- record transaction history
- pay sponsor rewards and login bonuses
- settle transfer-market trades
- process purchases, ad rewards, and item consumption

## Security and anti-cheat implications

For a game like this, the backend almost certainly had to protect at least the following:

- premium currency balances
- transfer-market ownership and bidding
- match scheduling and results
- player progression and upgrades
- sponsor or login reward claims
- ladder stamina and ladder outcomes

That is another reason the design was likely backend-first rather than client-authoritative.

## What is likely but not directly provable from this APK alone

Some details are still inference, even if they are strong inference:

- the exact REST endpoint paths and hub URLs
- the exact token format
- whether SignalR was used for live ticker only or also for chat and inbox updates
- whether match simulation was fully deterministic server logic or a hybrid model

However, none of those uncertainties change the architectural conclusion: Goal Tactics depended on a centralized online backend with persistent world state, HTTP APIs for ordinary state management, and SignalR plus push channels for selected real-time or re-engagement flows.

## Bottom-line backend conclusion

The backend was the real game. The mobile app was the manager console for it.