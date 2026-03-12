# Bot concept

## 0. Scores of each bot
- activity indicator: from 1 to 99 (The activity index should go up when a team goes up a league.)
- risk: from 1 to 99
- youth focus: from 1 to 99
- stars bonus: from 0 up to 50.000
- social indicator: from 1 to 100, dependent on the activity indicator, updatet when the activity index is updated

## 1. Active times
Every bot should get a timezone given when it is created. That timezone should be the main factor for when the bot is online. Most bots should be in European timezones. 
The bots should get times when they aren't online or only with a much smaller percentage. For example during night from 1 o'clock to 6 o'clock in the timezone. That should differ from bot to bot and from weekday to weekday. During standard workhours a bot shouldn't be online with a smaller percentage as well. 
Every bot should have a activity indicator, that is from 1 to 100 that determines how often a bot is online and how active it is. 
A formula for the propability of a bot being online should include the activity indicator, a time factor per bot and the time the bot wasn't active. 
The time factor per bot means the current time in the bots timezone. For example on bot always sleeps from 22 o'clock to 6 o'clock, then the factor of times in that time is near 0. The same bot might be nearly always active from 6 o'clock to 8 o'clock, then the factor for that time is nearly one. 
The time the bot wasn't active should have the influence, that bots that weren't active for a while go active again. 
The activity indicator has the result, that bots with a higher indicator go online more often. 

## 2. Transfermarket
### A bot comes online for a auction: 
A bot can save players the bot wants to buy. The bot may go online for that player shortly before it's time runs out. 
The more the bot wants to buy a player and the higher the activity indicator the higher the chance the bot comes online for that player. 
### The amount of money a bot is willing to bid: 
The maximum amount a bot is willing to bid depends on different factors. Namely: 
- The risk score of the bot: The higher the risk, the more the bot is willing to bid
- The amount of stars left: Every bot leaves a small amount of stars in their possesion. Around 1000 minimum stars in a bots account. 
- The money the bot posseses: The bots leave a small amount of money left. So they won't bid over the amount of money they have. 
### The way the bots bid: 
The cance a bot bids when the bot decided to keep bidding rises with every second left on the clock. That means that the chance is low when there are 20 seconds on the clock. But at 5 seconds the chance is way higher. The propability should depend on the risk factor of the bot. That means the higher the risk, the later the bot bids. 

## 3. Stadium
Bots should build depending on their scopes. The higher the youth focus, the faster the bot builds the training center and the scouting agency. The parking spaces should be the last on the bots priority list. The bots shouldn't build to many standing places. If not all places are filled the bot shouldn't build more. 

## 4. Friends
Bots should have friends, that means that they don't overbid each other. There should be a value friendship between two clubs. That should be from 0 to 100. With a friend request the value goes to 1 and then it keeps rising from different actions. Like playing friendlys. It should go down from overbidding each other. From a friendship level of 30 the bots chance to overbid each other sinks. When the friendship level hits 70 the bots don't overbid each other anymore. And from the friendship level 70 the bots write in the chat if they want a player from the transfer market and when a friend with a friendship level over 70 helps the other account to bid. That includes bidding together and the club that wants the player overbids the helping player in the last second. When both friends want the player they don't overbid each other. 
There should also be a enemy level from 0 to 100. When a bot overbids another bot often it rises. When a bot doesn't overbid another bot for a while it sinks. 
Implement a system that groups of bots can build and certain groups can be enemys. That can mean just overbidding someone out of spite and not because a bot needs a player. 
This whole system should include accounts made by humans as well. 
The likelyhood of a bot being active like this and how much is dependent on a social indicator. The social indicator should depend on the activity indicator, but should still have a randomness to it. A higher activity indicator should make a higher social indicator more likely, but low social indicators should still be possible. Same the other way around. 

## 5. Training
Depending on the youth focus a bot spents different amounts of stars on training. The players the bots bids on on the transfer market should also be influenced by this. 

## 6. Scouting
Depending on the youth focus a bot spents different amounts of stars on scouting. 

## 7. Stars
Depending on the activity indicatot of a bot, the bot has a different daily stars bonus. This should simulate watching ads and spending money. This stars bonus should be on top of the stars from the sponsors. The star bonus should be calculated by getting a random number between 0 and 500. This number should then be multiplied by the activity indicator. 

---

## 8. Database

The bot system uses its own **standalone database**, not connected to the main GoalTactics game database. 

### 8.1 `Bots` table

| Column | Type | Description |
|--------|------|-------------|
| BotId | BIGINT, PK | Unique bot identifier |
| Password | VARCHAR(64) | Securely generated random alphanumeric password (32 characters), created once at bot registration using a cryptographically secure RNG |
| ValidationToken | VARCHAR(128) | API authentication token |
| TeamName | VARCHAR(64) | Display name of the bot's club — chosen uniquely from a large curated list of team names at creation time; no two bots share the same team name |
| ManagerName | VARCHAR(64) | Display name of the bot's manager — composed of a first name + last name picked uniquely from large curated name lists at creation time; no two bots share the same manager name |
| Timezone | VARCHAR(32) | IANA timezone string (e.g. `Europe/Berlin`) |
| ActiveHours | JSON | Per-bot dictionary of peak/quiet time windows, e.g. `{"peak":["06:00-08:00","18:00-22:00"],"quiet":["00:00-05:00","08:00-16:00"]}` — can vary by weekday |
| SleepHours | JSON | Per-bot dictionary of hours the bot is offline or nearly offline |
| Activity | TINYINT | 1–99, controls online frequency and general engagement |
| Risk | TINYINT | 1–99, controls auction aggressiveness |
| YouthFocus | TINYINT | 1–99, controls training/scouting spending and transfer preferences |
| SocialScore | TINYINT | 1–100, derived from Activity with randomness |
| StarsDaily | INT | Daily stars bonus (0–50 000), `Random(0,500) * Activity` |
| NextOnline | TIMESTAMP | When the bot is scheduled to wake up next |
| LastOffline | TIMESTAMP | When the bot last went offline |
| GroupId | SMALLINT, nullable | Dynamic group membership (max 5 groups) |
| CreatedAt | TIMESTAMP | Row creation time |
| UpdatedAt | TIMESTAMP | Last modification time |

**Password generation**: When a bot is created the password is generated using a cryptographically secure random number generator (e.g. `RandomNumberGenerator` in .NET or equivalent) producing a 32-character alphanumeric string (`[A-Za-z0-9]`). The password as the generated password in text. 

### 8.2 `BotRelationships` table

| Column | Type | Description |
|--------|------|-------------|
| BotId1 | BIGINT, FK → Bots | First party in the relationship |
| BotId2 | BIGINT, FK → Bots | Second party in the relationship |
| Level | SMALLINT | –100 to +100. Negative = enemy, positive = friend, 0 = neutral |

**Primary key**: `(BotId1, BotId2)`.

Relationship thresholds (mapped from the –100 to +100 scale):
- **Level ≥ 30**: reduced chance of overbidding each other
- **Level ≥ 70**: never overbid; chat cooperation and co-bidding kicks in
- **Level ≤ –30**: increased spite-bidding probability
- Level changes: rises from friendly actions (friendlies, cooperation), sinks from overbidding or inactivity

Human accounts are included in this same table — bots treat them identically.

### 8.3 `BotSchedule` table

A **separate, indexed table** optimised for the scheduler to quickly find the next bot to wake up.

| Column | Type | Description |
|--------|------|-------------|
| BotId | BIGINT, PK, FK → Bots | The bot to wake |
| NextOnline | TIMESTAMP, indexed | When this bot should come online |

The scheduler script queries:
```sql
SELECT BotId, NextOnline
FROM BotSchedule
WHERE NextOnline <= CURRENT_TIMESTAMP
ORDER BY NextOnline
LIMIT 10;
```

This avoids scanning the full `Bots` table. When a bot goes offline it calls the API, which recalculates `NextOnline` and upserts both `BotSchedule.NextOnline` and `Bots.NextOnline`.

### 8.4 `BotGroups` table (optional metadata)

| Column | Type | Description |
|--------|------|-------------|
| GroupId | SMALLINT, PK | Group identifier (max 5) |
| Name | VARCHAR(64) | Optional label |
| CreatedAt | TIMESTAMP | When the group formed |

Groups are dynamic and formed by interaction — when a cluster of bots exceeds a mutual friendliness threshold they are assigned a shared `GroupId`.
Some groups can be enemys with another groups. Then all of the members of the groups are enemys. 