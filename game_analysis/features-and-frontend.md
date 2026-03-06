# Features and Frontend Reconstruction

## Frontend model

The frontend was a management dashboard rather than an action-game interface. The player spent most of the time moving between screens, inspecting stats, confirming actions, and waiting for server-backed timers to resolve. The strings and menus point to a tabbed or section-based structure with major areas such as Club, Finances, Stadium, Squad, Lineup, Training, Scouting, Transfer Market, League, GT Ladder, Friends, Live, Chat, Shop, and Support.

Because the client is Xamarin-based, the visible frontend was most likely built in shared C# UI code, with Android only providing the activity shell, notifications, billing, ads, and SDK bridges. That explains why the resources expose labels and prompts, while the real view logic is mostly not present in native Android XML.

## Main navigational areas

### Club

The Club section appears to have been the identity and overview area for the manager's organization.

Confirmed functions:

- My Club overview
- Accomplishments or trophies
- inbox or in-game email
- sponsor handling
- club renaming
- stadium naming

What it likely displayed:

- manager name
- club name
- country or origin
- foundation date
- league placement
- key club stats such as fans, members, and accomplishments

### Finances

The Finances section tracked monetary flows, balances, and history.

Evidence from strings:

- Finances
- Finance history
- NoFinance
- NoFinanceHistory
- Balance
- Earnings
- Running cost
- Audience earnings
- Goal bonus per match or goal
- Win bonus
- Championship bonus

What this means functionally:

- the club had a cash economy separate from stars
- the player could inspect income and expenses over time
- revenue sources likely included match attendance, sponsors, competition rewards, and player sales
- costs likely included stadium upgrades, salaries, pitch maintenance, scouting, and possibly some training or contract operations

Goal Tactics.md adds that the user could see money changes over the last two days, which matches a daily management cadence.

### Stadium and club buildings

The Stadium section was more than cosmetic. It influenced club economy and development.

Confirmed functions:

- stadium seat upgrades
- upgrade timers and speedups
- building completion notifications
- pitch resurfacing
- stadium renaming

Goal Tactics.md adds that multiple buildings existed, not just the stadium itself. Those buildings boosted:

- money generation
- training progress
- scouting quality
- fitness
- health

This implies the club had an infrastructure tech tree. The frontend likely showed each building's current level, build requirement, cost, duration, and effect. Strings such as BuildingRequirementText, BuildingInProgressMessage, BuildProgress, CompleteIn, and BuildingSpeedupQuestion support that.

### Squad and player management

This was one of the app's deepest sections.

Confirmed functions from strings and notes:

- inspect full player details
- view age, talent, quality, strength, position, market value, salary, contract end, origin, and skills
- rename player
- change origin
- change shirt number
- assign captain and other player roles
- upgrade player quality with stars
- use skill cards on players
- sell or fire players
- renew contracts individually or in bulk
- heal injured players with Medi-Packs

The frontend likely offered:

- a list view of the squad
- a detailed player profile page
- popup confirmation flows for paid actions
- comparison tools for players
- role assignment UI for special positions such as captain, penalty taker, free-kick taker, and corner taker

This is also where long-term player development was made visible. Strength labels such as Rookie, Weak, Average, Good, Very good, Outstanding, Magnificent, Superstar, and Legend show that the client translated raw progression into readable quality tiers.

### Lineup and tactical setup

The Lineup section controlled match preparation.

Confirmed functions:

- choose formation
- drag players onto the field
- save lineup before deadline
- keep separate status for complete, incomplete, or missing lineup
- assign player roles
- set tactics

Evidence from strings:

- Lineup
- Check Lineup
- LineupChangedQuestion
- LineupIncompleteMessage
- LineupLockedMessage
- PlayerRoles
- Tactics1 through Tactics7

The available tactical identities were:

- Standard
- Pressing
- One-touch
- Through the middle
- Counterattack
- Over the flank
- Kick and rush

The frontend probably let the player train one tactic over time and then apply it as the current team instruction for matches. The LineupLockedMessage shows that lineups were frozen one hour before kickoff, which is a strong sign of server-scheduled competitive fixtures.

Goal Tactics.md says the lineup could be prepared for the next three games, including the friendly. That suggests the frontend stored or displayed multiple future lineup slots rather than a single current team sheet.

### Training

Training was split into multiple layers.

Confirmed functions:

- team training
- individual training
- training camps
- tactic training
- training renewal and expiration
- training efficiency display

Evidence from strings:

- Team training
- Individual training
- Training camp
- Renew training
- Single training expired
- Training progress
- Training efficiency
- TeamTrainingDialog
- TacticsDialog

This points to a frontend where:

- the player selected main and sub skills for team-wide development
- one or more players could be put into individual training for extra paid progress
- temporary training camps added focused stat boosts
- tactical progress improved match behavior rather than raw player stats

Goal Tactics.md confirms team training, individual training, training camps, and tactics training as separate activities.

### Scouting

Scouting was a timed acquisition system for youth players.

Confirmed functions:

- standard scout instructions
- special scout instructions
- position-targeted special scouting
- speed up for the special scout
- scouting result handling including no-player outcomes

Evidence from strings:

- Instruct scout
- Instruct special scout
- GoToScouting
- NeverScoutedText
- Youth player
- cost and cooldown prompts for special scouting

Goal Tactics.md fills in the timing and price model:

- money scout: 10,000 money, every 12 hours
- special star scout: 2,000 stars, every 3 hours
- speed up: 150 stars

The frontend therefore likely showed:

- current scout cooldowns
- available result slots
- youth player cards or offers
- filters by position for premium scouting

### Transfer market

The transfer market was a live multiplayer auction house.

Confirmed functions:

- search and quick search
- filter players
- bid on players
- mark favourites
- sell your own players
- monitor auction timing
- receive overbid and auction-end events

Evidence from strings:

- Transfer market
- Auction end soon
- Current bid
- Highest bidder
- Bids / Favourites
- My auctions
- Sell player on transfer market
- Quick search
- Search result

This section was probably one of the app's most server-dependent views because listings, bids, and timing had to be global and authoritative.

### League

The League screen handled the main domestic competition.

Confirmed functions:

- table display
- home and away tables
- fixture list
- matchday schedule
- goalscorers list
- match results and history
- statistics such as biggest win and defeat, total wins and defeats, draw count, win rate, and goals difference

This was likely the main proof-of-progress screen for ordinary play.

### GT Ladder

GT Ladder was a separate competitive mode beyond the regular league.

Confirmed functions:

- dedicated ladder section
- ladder-specific lineup preparation reminder
- team stamina economy
- start game action that spends stamina or energy

Goal Tactics.md explains the mechanic: the player joined another league against the wider player base and could refill team stamina for 500 stars.

That makes GT Ladder a parallel progression loop, probably intended as a repeatable premium-engagement mode.

### Friends and social play

The Friends area supported both social growth and direct play.

Confirmed functions:

- friends list
- search friends
- sent and pending invites
- friendship requests
- friendly match requests
- challenge another manager to a friendly match
- Facebook, Messenger, WhatsApp, and generic sharing options

Goal Tactics.md adds that players could view another club overview, squad, league table, and on iOS also the stadium.

This section likely combined discovery, invitations, and a lightweight social graph. It was a major retention system because it turned the game from pure asynchronous progression into club-to-club rivalry.

### Inbox and system mail

The app had an in-game mail or inbox feature.

Confirmed functions:

- inbox list
- mark all as read
- delete read mail
- system messages
- sender and subject fields

Goal Tactics.md says the inbox delivered daily training and finance reports as well as friend and friendly requests. That means the inbox was a hybrid of notifications, reports, and social event handling.

### Live and match presentation

The Live area displayed ongoing or very recent match information.

Evidence from strings:

- Live
- Live-Ticker
- Watch Live
- Game course
- Waiting for the match
- Match delayed

This strongly suggests match simulation happened elsewhere, likely on the backend, and the frontend consumed a feed of events. The player watched a textual match report or ticker rather than controlling gameplay directly.

### Chat

Goal Tactics.md explicitly says the app had a chat with all clubs in it. The managed metadata also contains Chat, JChat, GChatT, ChatHistory, and SignalR-related symbols. That makes a global or broad-channel chat extremely likely.

The frontend was probably a fairly standard scrollable chat screen with message history and a text composer, backed by server channels.

### Shop and monetization frontend

The shop mixed utility items, cosmetics, rewarded ads, and direct premium currency sales.

Confirmed functions:

- buy stars
- buy shirts and emblems
- buy Medi-Packs
- rewarded videos
- starter package
- store success and failure handling
- Facebook and email connection rewards

Goal Tactics.md provides the store specifics for the current version:

- star bundles for Android and iOS
- effectively unlimited rewarded ads for 100 stars each in theory
- Medi-Pack pricing starting at 1,000 and improving with quantity

The resource set also includes shop-specific image assets such as shop_video and shop_facebook, which fits a store that rewarded both ad views and account-linking actions.

### Support and help

The app integrated Helpshift. That means the frontend included at least:

- FAQ browsing
- support ticket or conversation creation
- message thread with support agents
- attachment support
- support ratings after resolution

This is separate from the in-game global chat. Helpshift was customer support, not player-to-player messaging.

## Frontend behavior patterns

Across all sections, the frontend likely followed a common pattern:

- fetch server state on entry
- render current club data
- allow the user to trigger actions through explicit confirmations
- send paid or irreversible actions only after a popup prompt
- update timers and statuses locally until the next backend refresh
- use push and local notifications to bring the player back when a timer or event completed

That makes the app feel like a persistent manager dashboard with time-gated tasks and frequent re-entry points.

## What the frontend probably did not do

There is no evidence that the frontend locally simulated full matches as an offline mini-engine. Everything important about competition and player economy is easier and safer to centralize server-side. The client more likely presented backend results than generated them itself.

## Most important frontend conclusion

The frontend of Goal Tactics was built around repeated decision-making, not direct football control. Every screen existed to help the user improve a persistent online club: recruit better players, optimize training, prepare matches, handle timers, and monetize faster progress.