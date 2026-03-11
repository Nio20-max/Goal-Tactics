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
- In extra_plan/information.md is more information on the stadium if you need more information. 

**Equipment**: 
- Search the pictures in the Xamarin app that specify the trikots and the emblems and add them so that you can buy those for 500 stars each. Then you should be able to set them as your emblem and trikot and that should be the one send with the api and saved in the database. 

**Training**: 
- The training effeciency of the team training should depend on the time the same training was present. When the team training wasn't changed for three days the efficiency should go down. 
- The tactics should start with 0% each. The tactic that is trained should go up by 2% a day. 
- The training camp should cost differently depending on the league the club is in. It should start at 500.000 and go up to 10 million money maximum. The attribute that is available should be random everytime a training camp is chose. A training camp should be active for 7 days. 
- The starting of individual training doesn't work. 