This file describes many aspects of the backend that should be implemented: 

**Stadium**: The stadium should have no level but a number of seats. You should only be able to build VIP seats in bulks of 10 and sitting and standing seats in bulks of 100. 
100 standing places: 1 hour 40 minutes
100 sitting seats: 2 hours 20 minutes
10 VIP seats: 50 minutes

The upgrade time of the facilitys should depend on their level. 
Level 0 -> Level 1: 30 minutes
Level 19 -> Level 20: 50 hours
The needed time should rise linear. 
Implement that the time in the simulation goes by as well. With one game per day. 


seat earnings per league per seat:
4. League: VIP: 212; sit: 16; stand: 8
3. League: VIP: 269; sit: 21; stand: 10
2. League: VIP: 343; sit: 27; stand: 13
1. League: VIP: 436, sit: 34; stand: 17

max seats per league: 
3. League: VIP: 1900; sit: 24000
2. League: VIP: 2300; sit: 28500
1. League: VIP: 2800; sit: 35000

You can build an unlimited number of standing seats. But not all will be filled. The maximum number depends on the League and how the team is doing. So if the team wins often or looses often. 


**Stars**: You get 300 stars a day from sponsor 1 that is valid the whole season and 200 stars a day from a sponsor that is valid for three days. You get those stars when you go online the first time of the day. 
You can watch ads and get 100 stars per ad. In the current version the server should just skip the ad and reward it anyway. So just klick on the button and you get the stars. 
Bidding on a player on the Transfer market costs 200 stars. 
