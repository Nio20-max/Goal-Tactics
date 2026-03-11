**New**: 

**Inbox**: Shows that I have no emails. For the club Test
**Accomplishments**: Shows no Trophys. 
**Finances**: Show that there are no transactions on this day, even though I did spend money on. 
**Stadium**: 
- When I try to build more seats in the stadium the game crashes. 
- The time the buildings take to upgrade should rise exponantially from 30 minutes to 50 hours. 
- All buildings that are on level 0 can't be upgraded to level 1. 
**Equipment**: There are no trikots emblems shown that are available to buy. 
**Squad**: The game doesn't crash but it still shows nothing. 
**Lineup**: It crashes when I click on it. 
**Training**: The training screen won't load. It just keeps showing that it is loading and that doesn't stop. 
**Scouting**: The UI works, but wheni click on instruct an error occurs. And the prices for the scouts are wrong. 
**Transfermarket**:
- When I try to search only for certain ages, certain talents, certain strengths or certain positions the players shown don't match the requirements. 
- When I click on one player on the transfermarket to view this player more closely and bid on him nothing would load and show. 
- No player loads and it shows something went wrong. 
**League**: In the league some players, for example Mgr2 Striker from Mgr2 have a strength of over 700. 700 should be the strength cap for players. 
**GT Ladder**: The prize to start a game is 1000 energy, but it should be 50. 
**Friends**: The search friends doesn't work. 
**Live**: It shows waiting for the match
**Ads**: There are no ads shown and the shop doesn't load. If the ad thing doesn't work you can do it over the shop with a product. You should be able to buy Medi Packs from the shop as well. 1000 stars for one medi pack and then a small decline for more. 
**General**:
- When I click on another club and then click on Squad the game crashes. Propably the same errer like when I click on my squad. 




**OLD**: 

**Sponsors**: 
- Wrong contracts with wrong amounts. There should be two contracts. One "main" and one "secondary" contract. 
- "main" contract: Login bonus: 300 stars, skill cards: 3 random cards when signing, money per league match: between 50.000 and 300.000 depending on the league the account is in, Goalscorer bonus (when the top goalscorer of the league is in the own team): between 3 and 6 million money, championship bonus (when the team was first in the league): between 3 and 6 million money
- "secondary" contract: Login bonus: 200 stars, skill cards: 2 random cards when signing, money per league match: between 30.000 and 100.000, money per goal in league match: between 5.000 and 20.000, money per win in league: between 10.000 and 40.000

**Accomplishments**: 
- Give them for things like Most goals in a season in the own league and first place in a league. 
- Example for top goalscorrer: 
{
    "name":"Torschützenkönig{
        0
    }Robert Lewandowski{
        0
    }Saison #116",
    "image":"02.png"
}
- Example for first place in a season: 
{
    "name":"Meisterschaft{
        0
    }19. 3. Liga{
        0
    }Saison #116",
    "image":"04.png"
}

**Inbox**: 
- The training reports should arrive in a pattern like in this file from the captured data: 
/root/projekte/Goal-Tactics/information/original_API_requests/logs/2023_06_30_06_47_07_7/com.xyrality.goaltactics/TCP_51.116.154.224_re_443_lo_38768/sslCaptureData_0.txt


**Ads**: 
- Ads are shown as not available in the current Xamarin app. Fix it that they are shown as available and that when I click that I want to play an add that i should get the 100 stars without watching the add. 

**Finances**: 
- The exact amount of money spend on what should be saved per day and that should work in the finance tab in the Xamarin app. Check what the app expects and fix that. 

**Stadium Tab**: 
- The office already works, but the rest of the buildings can't be build and I can't build the stadium. Check what the Xamarin app expects and change the API responses that it works and also change the backend so that it saves the buildings in the right pattern. 
- The upgrade time of the facilitys should depend on their level. 
Level 0 -> Level 1: 30 minutes
Level 19 -> Level 20: 50 hours
The needed time should rise linear. 
- In information/information.md is more information on the stadium if you need more information. 

**Equipment**: 
- Search the pictures in the Xamarin app that specify the trikots and the emblems and add them so that you can buy those for 500 stars each. Then you should be able to set them as your emblem and trikot and that should be the one send with the api and saved in the database. 

**Training**: 
- The training effeciency of the team training should depend on the time the same training was present. When the team training wasn't changed for three days the efficiency should go down. 
- The tactics should start with 0% each. The tactic that is trained should go up by 2% a day. 
- The training camp should cost differently depending on the league the club is in. It should start at 500.000 and go up to 10 million money maximum. The attribute that is available should be random everytime a training camp is chose. A training camp should be active for 7 days. 
- The starting of individual training doesn't work. 

**League**: 
- Every Team should play one league match every day. The timetable on which day which team plays against which should be calculated in the beginning of the season. 
- Every team should play against every team one time at home and one time away. With 16 teams per league that is 30 days. 
- Create that code and test it. 

**Transfermarket**: 
- The Quick search doesn't work. 
- I can not bid on players because when I click on one it doesn't load. I think this is a problem with the api. 

**Scout**: 
- There are mistakes with the API so that the UI doesn't load correctly. 

**Squad**: 
- There are mistakes with the api so that nothing loads. The game shows an error. 

**Lineup**: 
- No game loads for the lineup. So I can't change the lineup. 

**Live**: 
- There are no details shown and a report placeholder is shown. 