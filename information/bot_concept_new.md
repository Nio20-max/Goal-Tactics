# Bot concept

## 0. Scores of each bot
- activity indicator: from 1 to 100
- risk: from 1 to 100

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
