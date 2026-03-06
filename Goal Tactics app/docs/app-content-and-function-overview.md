# Goal Tactics App Content And Function Overview

This file explains the full contents of the app in plain language, but at a concrete level. It is meant to let a reader understand exactly what Goal Tactics contained without needing to read the code.

## What the app was

Goal Tactics was an online football management game. You did not control players directly during matches. Instead, you ran a club over time: you built the team, improved the stadium, trained players, handled money, bought and sold players, and prepared lineups and tactics for scheduled matches.

The app revolved around persistent club progression. The same club continued across matchdays and seasons. The world was shared with other managers, so friendlies, transfer market bids, ladder matches, chat, and rankings all depended on live server state.

## The main things the player managed

### Club identity

The club section was the home screen for the manager's team identity.

It included:

- the club name
- the manager name
- league information
- club accomplishments
- club news and inbox messages
- sponsor state
- rename actions for team and stadium

This section gave the player the feeling of owning a persistent football club rather than a temporary match lineup.

### Finances

The finances area explained where the club's money came from and where it went.

The app tracked:

- current balance
- finance history
- daily and previous-day earnings
- running costs
- audience earnings
- match bonuses
- championship rewards

This made the club economy visible. The player was expected to make trade-offs between slow money-based growth and faster premium-currency acceleration.

### Stadium and club buildings

The stadium section was not only cosmetic. It was part of the game's long-term progression system.

The player could:

- upgrade stadium capacity or related buildings
- wait for timed construction to complete
- speed up construction with stars
- rename the stadium
- renew the grass quality

The buildings mattered because they affected other parts of the club, such as income and development. The game notes and client models point to infrastructure bonuses for training, scouting, health, fitness, and revenue.

### Squad and player management

This was one of the deepest parts of the app.

The player could:

- view every player in the squad
- inspect position, age, market value, salary, skills, fitness, cards, injuries, and contract state
- rename a player
- change a player's country or origin
- change shirt number
- assign roles such as captain or set-piece taker
- upgrade a player with stars
- use skill cards
- heal injured players with Medi-Packs
- renew contracts
- sell players or fire them
- place players on the transfer market

The squad was the core asset of the club. Every major system fed back into it.

### Lineup and tactics

The lineup section handled match preparation.

The player could:

- choose a formation
- place players into match slots
- set starting lineup and bench choices
- assign roles such as captain, penalty taker, free-kick taker, and corner taker
- choose tactics
- save the setup before the match lock deadline

The app enforced a lineup lock near kickoff, so this was a time-sensitive part of play. The lineup was not just for one moment; the client indicates preparation across multiple upcoming matches.

### Training

Training was split into several layers instead of one generic upgrade button.

The app supported:

- team training
- tactic training
- individual training
- training camps
- training renewals when time expired
- training efficiency displays

This made development a planning game. The player had to decide which skills to emphasize and when to pay to maintain or improve progress.

### Scouting

Scouting was the main youth acquisition system.

The player could:

- send a normal scout
- send a premium special scout
- target positions in premium scouting
- wait for cooldowns
- pay to speed up scouting
- recruit a found player or reject them

This gave the game a repeated timed loop for discovering new talent.

### Transfer market

The transfer market was a shared auction system between players.

The player could:

- search for players with filters
- inspect auctions and player details
- place bids
- track favorites
- list their own players for sale
- see overbids and auction-ending states

This was a major multiplayer economy feature. It connected squad building, finances, and real-time competition with other managers.

### League competition

The league area covered the regular season competition.

It included:

- league table
- fixtures and matchdays
- home and away comparisons
- goalscorer rankings
- match history
- season and club statistics

This was the main long-term competitive ladder for ordinary play.

### GT Ladder

GT Ladder was a separate competitive mode from the league.

It included:

- rank progression
- challenge selection
- stamina as a limited resource
- ladder-specific match rewards and penalties
- ladder challenge reports

This made the app feel like more than a single league simulation. It added a faster, repeatable, more duel-oriented competitive layer.

### Friends and friendlies

The social section let players connect directly with each other.

It supported:

- finding friends
- adding friends
- accepting or declining friend requests
- sending and receiving challenges
- creating friendly matches
- accepting or declining those friendlies

This created direct club-to-club interaction outside the main season loop.

### Chat and social feed

The app contained a live chat system.

The player could:

- read chat history
- post messages
- see typing state

This gave the game a live social layer on top of the management systems.

### Live match details

Matches were not controlled directly, but they were presented with live or report-style detail.

The app showed:

- match reports
- live ticker style information
- final scores
- lineup-related context
- historical match detail screens

This preserved the feeling of football drama while keeping the game focused on management.

### Shop and premium systems

The app monetized through both direct purchases and rewarded ads.

The player could:

- buy resource packs
- buy or use equipment such as shirts and emblems
- watch rewarded videos for stars when available
- verify premium purchases through the backend

The premium systems were tightly tied to progression speed. They were not a separate store-only layer.

### Support and settings

The app also included operational and quality-of-life sections.

These covered:

- support access through Helpshift
- notification preferences
- account updates
- Facebook connection and social linking
- tutorial state and skipping

## The currencies and resources

The app used more than one resource:

- money for standard club economy actions
- GT Stars as premium currency
- Medi-Packs for healing injuries
- skill cards for player development

The resource bar was always important because many actions depended on one of these balances.

## The match philosophy

Goal Tactics was not about stick skills or direct gameplay. The football result came from preparation.

What mattered most was:

- squad quality
- player condition and injuries
- contracts and retention
- lineup choices
- formation fit
- tactic choice
- training progress
- club development bonuses

The match itself was the outcome of management decisions made earlier.

## The daily rhythm of the app

A typical player session would look like this:

1. Open the app and check club news, resources, and timers.
2. Handle expiring training, sponsors, contracts, or auctions.
3. Review squad issues such as injuries, cards, or weak positions.
4. Scout, bid, or sell players.
5. Update lineup and tactics for coming matches.
6. Collect results, rewards, and progress.
7. Return later when the next cooldown or scheduled match is ready.

## What made the app feel complete

The app covered the entire fantasy of running a football club:

- identity and branding
- player development
- tactical preparation
- club infrastructure
- finances
- multiplayer economy
- league competition
- ladder competition
- social interaction
- live event follow-up
- premium acceleration

That is why the app felt broad. It was not just one feature with a football skin. It was a full mobile football-manager ecosystem.