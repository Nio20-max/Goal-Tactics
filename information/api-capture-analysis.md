# Goal Tactics Original API Capture Analysis

**Source:** SSL capture files from `/information/original_API_requests/logs/`  
**Date:** June 30, 2023 (two sessions: `2023_06_30_06_47_07_7` and `2023_06_30_06_52_53_53`)  
**Server:** `gtwebapp2.azurewebsites.net` (Azure IIS/10.0)  
**API Version:** `x-goaltactics-version: 1.2.4`  
**Capabilities:** `youthlist,htmligm,friendlist,indtrainings`  
**Total capture files found:** 132 (many 0-byte; ~40 with actual data)

---

## Common Request Structure

All POST endpoints use the same base request body:
```json
{
  "Signature": "<md5-hash>",
  "Token": "<guid>",        // Auth token from Login
  "Locale": "de-DE",
  "UtcOffset": "01:00:00",
  "Culture": "de-DE",
  "Platform": 1              // 1 = Android
}
```

Some endpoints add extra fields (e.g. `Id`, `Talent`, `SkillIndex`).

Common response envelope:
```json
{
  "errorMessage": null,
  "status": 1,              // 1 = success
  "message": null,
  "punishment": 0
}
```

---

## 1. Common

### GET /api/Common/GetVersion
No auth required. Returns plain text.  
**Response:** `28` (text/plain)

### POST /api/Common/GetCountries
No Token required (only Signature).  
**Response:**
```json
{
  "countries": [
    {
      "id": "cc54c944-0735-48db-8a31-54056217efea",  // GUID
      "name": "Deutschland",                            // Localized name
      "short": "de"                                     // ISO 3166-1 alpha-2
    }
    // ... 39 countries total
  ]
}
```

**Countries captured:** fr, se, pt, tr, be, uy, sa, mx, de, ec, gb, ar, ch, es, hu, at, br, lv, fi, ie, cz, lu, cy, dk, co, ee, bg, hn, cr, si, sk, mt, pl, lt, nl, el, it, ro, cl

---

## 2. Authentication

### POST /api/Authentication/Login
**Request body adds:**
```json
{
  "Login": "<username>",
  "Password": "<md5-hashed-password>"
}
```
**Response:**
```json
{
  "token": "935fcac4-4bed-4711-a517-e60ac98767fb",
  "userId": "f4c8a96c-5eb3-4f73-b2e1-ca05e6694e10",
  "level": 0,
  "isAdmin": false
}
```

---

## 3. Team

### POST /api/Team/GetMyResources
**Response:**
```json
{
  "money": 43472884.0878032944,     // Decimal, in-game currency
  "medipacks": 9,                    // Integer
  "gtStars": 62360                   // Premium currency (integer)
}
```

### POST /api/Team/GetMyTeamInfo
**Response:**
```json
{
  "teamData": {
    "name": "FC Nikolai",
    "logo": "logo_36",
    "country": "de",
    "countryName": "Deutschland",
    "leagueName": "2. Bundesliga Gr.4",
    "leagueId": "4c7c6c5e-eb0e-441d-acb2-cc1320254c3c",
    "homeTrikot": "trikot9",
    "awayTrikot": "trikot0",
    "marketValue": 71795888,
    "strength": 8553,
    "mood": 91,
    "teamMood": "Dein Team ist sehr gut drauf!",
    "wins": 165,
    "losses": 109,
    "fans": 4474,
    "members": 0,
    "matchTrend": [1, 1, 1, 1, 1],  // 1=win, array of last 5
    "userData": {
      "name": "Nikolai",
      "score": 8953,
      "created": "2023-02-05T06:43:10.0130000",
      "lastActivity": "2023-06-30T04:47:13.1370000",
      "facebookId": "116052144733377",
      "appleId": null,
      "email": "nikolailinsch@posteo.de",
      "password": null,
      "rank": "Master!"
    },
    "myLike": false,
    "likesMe": false,
    "challengeStatus": 0
  }
}
```

### POST /api/Team/GetMyTeamExtendedInfo
**Response** (superset of GetMyTeamInfo):
```json
{
  "teamData": {
    // ... all fields from GetMyTeamInfo, plus:
    "leaguePosition": 4,
    "playersCount": 36,
    "bestVictory": "19 - 1",
    "worstDefeat": "2 - 30",
    "stadiumSize": 36600
  },
  "news": [
    {
      "date": "2023-06-30T04:42:58.5530000",
      "title": "Jugendzentrum beschleunigt",
      "text": "Der Bau ... wurde beschleunigt."
    }
  ],
  "season": 10,
  "seasonStartDate": "2023-06-23T07:00:00.0000000",
  "matchday": 1,
  "lastMatch": {
    "homeCountry": "de",
    "awayCountry": "gb",
    "homeScore": 13,
    "awayScore": 0,
    "opponentTeamId": "22939f11-b86a-4889-adc0-c25e11eed3e7",
    "homeStrength": 8553,
    "awayStrength": 1606,
    "hasLineup": true,
    "isFriendly": false,
    "id": "e5e6a8a3-c094-4f66-935b-c4f8ae2e2c5e",
    "date": "2023-06-26T07:00:00.0000000",
    "homeLogo": "logo_36",
    "awayLogo": "logo_48",
    "homeName": "FC Nikolai",
    "awayName": "Beadle FC",
    "myTeam": 0       // 0=home, 1=away
  },
  "nextMatch": {
    // same structure
  },
  "renameTeamCost": 100
}
```

### POST /api/Team/GetTeamInfo
**Request body adds:** `"Id": "<teamId-guid>"`  
**Response:** Same as GetMyTeamInfo but for another team.

### POST /api/Team/GetAccomplishments
**Response:**
```json
{
  "accomplishments": [
    { "name": "Aufstieg", "image": "accomplishment_promotion" },
    { "name": "Meisterschaft", "image": "accomplishment_champion" },
    { "name": "Aufstieg", "image": "accomplishment_promotion" }
  ]
}
```

### POST /api/Team/GetFinances
**Response:**
```json
{
  "today": 15,        // matchday number
  "yesterday": 14,
  "todays": [         // array of today's bookings
    {
      "bookingType": "Hauptsponsor",     // booking category
      "value": 123397.0000000000,
      "description": "Grundbetrag",      // description
      "isEarning": true                   // true=income, false=expense
    }
  ],
  "yesterdays": [      // array of yesterday's bookings
    // same structure
  ]
}
```

**Booking types observed:**
- **Earnings:** Hauptsponsor (Grundbetrag), Nebensponsor (Grundbetrag, Siegprämie, Torprämie), Zuschauer (Eintrittsgelder), Freundschaftsspiel (Zuschauer)
- **Expenses:** Stadion (building maintenance by name+level), Spielergehälter, Jugendspieler, Rasen erneuern

### POST /api/Team/GetFinanceHistory
**Response:**
```json
{
  "financeHistory": [
    {
      "date": "2023-04-06T00:00:00",
      "income": 10338587.0000000000,
      "outcome": 5813646.8108500401,
      "balance": 34454396.0306156623
    }
    // ... ~11 entries spanning ~3 months
  ]
}
```

### POST /api/Team/GetMyMail
*(Response partially captured — request seen but body truncated)*

---

## 4. Squad

### POST /api/Squad/GetPlayers
**Response** — full 36-player roster:
```json
{
  "players": [
    {
      "id": "a988015b-e785-459f-a5e3-40836a58c95f",
      "name": "Ehrmut Hoschatt",
      "country": "de",
      "strength": 126.8999560000,
      "talent": 10,                    // 1-10 scale
      "age": 18,
      "position": 0,                   // 0=GK, 1=DEF, 2=MID, 3=ATT(right), 4=ATT(left), 5=MID(wing), 6=FWD
      "head": "01_head-A14",           // avatar asset ID
      "endDate": "2023-07-15T22:00:00.0000000",   // contract end
      "experience": 163.1950500000,
      "fitness": 100,                  // 0-100
      "body": "01_body-A00",
      "gloves": "01_Gloves01",
      "shoes": "01_Shoes03",
      "salary": 3913.8162356822,
      "marketValue": 172580.0000000000,
      "origin": "Deutschland",         // localized country name
      "skills": [                      // 14 skills, decimal values
        49.6060570251,   // [0]  mainSkill varies by position
        114.8015913451,  // [1]
        30.5324924879,   // [2]
        38.8100899890,   // [3]
        38.5105883416,   // [4]
        39.7521246202,   // [5]
        29.1390836002,   // [6]
        29.0292901960,   // [7]
        34.6599876313,   // [8]
        30.7764768185,   // [9]
        37.7708287434,   // [10]
        25.2149000311,   // [11]
        30.6281137348,   // [12]
        24.8397540011    // [13]
      ],
      "mainSkill": 1,                  // index into skills[] that is the primary skill
      "bonusSkills": [1, 13, 13, 12],  // indices of bonus skills (2-4 entries)
      "yellowCards": 0,
      "hasRedCard": false,
      "injured": 0,                    // 0=healthy, >0=days injured
      "isForSale": false,
      "sellPrice": 12080.600000000000,
      "transfermarketFee": 1725.800000000000,
      "transfermarketMaxOffer": 189838.00000000000,
      "transfermarketMinOffer": 1725.800000000000,
      "transfermarketMaxHours": 48,
      "isUpgraded": false,
      "maxUpgradeStrength": 151,       // cap for upgrades; 200 for most, lower for young players
      "shirt": -1,                     // -1=no shirt number assigned
      "canExtendContract": true,
      "hasIndividualTraining": true
    }
    // ... 36 players total
  ],
  "playersOnTransfermarket": [],
  "homeShirt": "trikot0",
  "awayShirt": "trikot0",
  "costRename": 200,          // GT Stars to rename
  "costShirt": 200,            // GT Stars to change shirt
  "costOrigin": 200,           // GT Stars to change origin
  "costUpgrade": 10000,        // GT Stars to upgrade player
  "transfermarketMinHours": 1
}
```

**Position mapping (observed):**
| Value | Role |
|-------|------|
| 0 | Goalkeeper (GK) |
| 1 | Defender (DEF) |
| 2 | Midfielder (MID) |
| 3 | Attacking Mid / Forward |
| 4 | Forward / Striker |
| 5 | Winger |
| 6 | Forward (Lewandowski, position=6) |

**14 Skills** (indices 0-13): The exact skill names aren't in the API response; they map to internally named skills. `mainSkill` is the player's primary skill index; `bonusSkills` are secondary focus indices.

**Players in the captured roster (36 total):**

| Name | Country | Position | Strength | Talent | Age |
|------|---------|----------|----------|--------|-----|
| Ehrmut Hoschatt | de | 0 (GK) | 127 | 10 | 18 |
| Dragoljub Kumer | si | 0 (GK) | 421 | 8 | 33 |
| Manuel Neuer | de | 0 (GK) | 362 | 7 | 27 |
| Joshua Kimmich | de | 1 (DEF) | 700 | 9 | 34 |
| Enrico Agostino | it | 1 (DEF) | 348 | 7 | 28 |
| Philipp Lahm | de | 1 (DEF) | 430 | 10 | 30 |
| Ferdinand Brenner | de | 1 (DEF) | 213 | 10 | 19 |
| Ernst Müller | de | 1 (DEF) | 496 | 9 | 34 |
| Feodor Kowaljow | ru | 1 (DEF) | 378 | 10 | 27 |
| Igor Komarow | ru | 1 (DEF) | 533 | 8 | 34 |
| Boris Kokorin | ru | 1 (DEF) | 377 | 8 | 34 |
| Paolo Maldini | it | 1 (DEF) | 326 | 6 | 31 |
| Pasquale Ricchio | it | 2 (MID) | 339 | 9 | 26 |
| Lukas Hilty | ch | 2 (MID) | 187 | 9 | 18 |
| Helwig Dilsteren | de | 2 (MID) | 193 | 9 | 19 |
| Wilhelm Nüterthies | de | 2 (MID) | 159 | 10 | 17 |
| Stephanus Lenzen | de | 2 (MID) | 171 | 8 | 18 |
| Gil Ochoa | es | 2 (MID) | 218 | 8 | 20 |
| Giordano Carlone | it | 2 (MID) | 426 | 9 | 32 |
| Siad Zehren | ch | 3 (ATT) | 342 | 2 | 34 |
| Oleg Smolnikov | ru | 3 (ATT) | 405 | 7 | 30 |
| Tillmann Klüttgens | de | 3 (ATT) | 381 | 8 | 29 |
| Notfried Grabowsky | de | 3 (ATT) | 428 | 8 | 32 |
| Thankmar Grosseneux | de | 3 (ATT) | 352 | 7 | 28 |
| Deacon Bille | dk | 3 (ATT) | 510 | 10 | 33 |
| Detrich Touard | de | 3 (ATT) | 168 | 9 | 19 |
| Hildebert Brylka | de | 3 (ATT) | 236 | 8 | 20 |
| Diethart Schares | de | 4 | 165 | 9 | 19 |
| Bertolt Nippa | de | 4 | 95 | 8 | 16 |
| Georginho | de | 4 | 700 | 9 | 34 |
| Vincenzo Bonaventura | it | 4 | 329 | 7 | 30 |
| Gerhard Blieml | at | 4 | 141 | 10 | 17 |
| Dimitri Vogt | de | 4 | 83 | 8 | 16 |
| Wolfdieter Syberich | de | 4 | 170 | 9 | 18 |
| Xose Valdez | es | 4 | 202 | 10 | 19 |
| Diego Penalver | es | 5 (Wing) | 185 | 10 | 19 |
| Danilo Oslin | de | 5 (Wing) | 194 | 8 | 18 |
| Robert Lewandowski | pl | 6 (FWD) | 479 | 10 | 31 |
| Pol' lupen | cr | 4 | 509 | 8 | 33 |

### POST /api/Squad/GetSkillCards
**Response:**
```json
{
  "skillCards": [
    {
      "skill": 0,       // skill index (0-13)
      "rarity": 1,      // 0=common, 1=rare, 2=epic
      "count": 2,        // how many owned
      "bonus": 1.25      // bonus value (0.5/1.25/2.5 by rarity)
    }
    // ... 27 different card types in inventory
  ]
}
```

**Rarity → Bonus mapping:**
| Rarity | Label | Bonus |
|--------|-------|-------|
| 0 | Common | 0.5 |
| 1 | Rare | 1.25 |
| 2 | Epic | 2.5 |

---

## 5. Training

### POST /api/Training/GetTraining
**Response** — 4 sections:
```json
{
  "teamTraining": {
    "mainSkillIndex": 0,
    "subSkillIndex": 1,
    "boringDate": "2023-07-01T07:00:00.0000000Z",
    "efficiencyText": "Die Spieler sind noch motiviert...",
    "efficiencyValue": 100,       // 0-100 percent
    "noTraining": false,
    "hasAlert": false
  },
  "tacticTraining": {
    "tacticBonusList": [
      {
        "tactic": {
          "id": "<guid>",
          "name": "Normal",
          "value": 83           // training level (0-100)
        },
        "counterTactics": [
          {
            "tacticId": "<guid>",
            "bonus": 8.30,       // current counter bonus
            "maxBonus": 10       // max possible
          }
        ]
      }
    ],
    "selectedTacticId": "<guid>"
  },
  "trainingCamp": {
    "campItems": [
      {
        "identifier": "Camp_2_0_high",
        "image": "Camp_2_0_high",
        "name": "Höhentrainingslager",
        "effect": 2,
        "variant": 0,
        "power": 1.5000000000,
        "percent": false,
        "priceEuro": 9640000,        // in-game money cost
        "priceStars": 1000,           // GT Stars cost
        "bookDate": "2023-07-03T07:00:00.0000000"  // "" if not booked
      }
    ],
    "updateCampsCost": 1000,
    "isUpdateEnabled": false
  },
  "individualTraining": {
    "players": [
      {
        "skillIndex": 0,               // which skill is being trained
        "skillChange": 0.6765600000,   // per-session change
        "totalChange": 39.4214400000,  // total accumulated change
        "skills": [/* 14 decimals */],
        "hasContract": true,
        "id": "<player-guid>",
        "name": "Pasquale Ricchio",
        "country": "it",
        "strength": 338.7377140000,
        "talent": 9,
        "age": 26,
        "position": 2,
        "head": "01_head-A03",
        "endDate": "2023-07-01T07:00:00.0000000"  // training end; null = no training
      }
      // ... all 36 players listed with their individual training status
    ],
    "trainPrice": 1000,       // GT Stars
    "renewPrice": 500,         // GT Stars
    "renewAllPrice": 0,
    "hasAlert": false
  }
}
```

**7 Tactics captured:**

| Name | Training Value | Counter Tactic Chain |
|------|---------------|---------------------|
| Normal | 83 | → Pressing → One-Touch → Durch die Mitte |
| Pressing | 20 | → One-Touch → Durch die Mitte → Konter |
| One-Touch | 12 | → Durch die Mitte → Konter → Über die Flügel |
| Durch die Mitte | 40 | → Konter → Über die Flügel → Kick and Rush |
| Konter | 10 | → Über die Flügel → Kick and Rush → Normal |
| Über die Flügel | 30 | → Kick and Rush → Normal → Pressing |
| Kick and Rush | 100 | → Normal → Pressing → One-Touch |

Each tactic has 3 counter-tactics with bonuses at maxBonus = 10, 5, 2 respectively.

**Training camp types captured:**
- Höhentrainingslager (effect=2, variant=0, power=1.5)
- Aerobicunterricht (effect=1, variant=4, power=1.5)
- Taktikanalyse (effect=0, variant=3, power=1.5)

All cost 9,640,000 money or 1,000 GT Stars.

---

## 6. Stadium

### POST /api/Stadium/GetStadium
**Response:**
```json
{
  "buildings": [
    {
      "id": "<guid>",
      "name": "Parkplätze",
      "description": "Parkplätze für die Besucher.",
      "effectName": null,
      "currentValue": 0,          // current level
      "maxValue": 10,             // max level
      "newValue": 0,              // upgrade target value
      "buildStart": null,
      "buildEnd": null,
      "earnings": 0,
      "utilization": 0,
      "upgradeCost": 50000,
      "upgradeCostPremium": 100,  // GT Stars
      "dailyCost": 0,
      "dailyCostIncrease": 0,
      "profit": 0,
      "profitSign": null,
      "profitIncrease": 0,
      "duration": 28800,          // seconds for upgrade
      "capacity": 0,
      "hasWarning": false
    }
    // ... 15 building types
  ],
  "name": "Nikolais Kicker Arena",
  "visitorsLastMatch": 36600,
  "visitorsAverage": 36600,
  "visitorsTotal": 9552600,
  "earningsLastMatch": 10915500,
  "earningsAverage": 10915500,
  "earningsTotal": 2848942500,
  "grassQuality": 90,             // 0-100
  "changeNameCost": 100,          // GT Stars
  "renewGrassCost": 14000,        // money
  "speedupCost": 50,              // GT Stars per speedup
  "maxBuildingLevel": 20
}
```

**15 Building types captured:**

| Building | Max Level | Description |
|----------|-----------|-------------|
| Parkplätze | 10 | Parking |
| VIP-Parkplatz | 10 | VIP Parking |
| Überdachter Parkplatz | 10 | Covered Parking |
| Jugendzentrum | 20 | Youth Academy |
| Geschäftsstelle | 20 | Business Office |
| Trainingsgelände | 20 | Training Ground |
| Fitnessstudio | 20 | Gym |
| Medizinische Abteilung | 20 | Medical Wing |
| Hotel | 10 | Hotel |
| Public Viewing | 10 | Public Viewing |
| Museum | 10 | Museum |
| Fanshop | 10 | Fan Shop |
| Sitzplätze | 20 | Seating |
| VIP-Logen | 20 | VIP Boxes |
| Stehplätze | 20 | Standing Area |

### POST /api/Stadium/GetUnderConstruction
**Response:**
```json
{
  "building": {
    "id": "00000000-0000-0000-0000-000000000000",
    "name": "Jugendzentrum",
    "description": null,
    "effectName": null,
    "currentValue": 0,
    "maxValue": 0,
    "newValue": 0,
    "buildStart": null,
    "buildEnd": "2023-07-01T03:51:29.4000000",
    "earnings": 0,
    "utilization": 0,
    "upgradeCost": 0,
    "upgradeCostPremium": 0,
    "dailyCost": 0,
    "dailyCostIncrease": 0,
    "profit": 0,
    "profitSign": null,
    "profitIncrease": 0,
    "duration": 0,
    "capacity": 0,
    "hasWarning": false
  }
}
```

---

## 7. Sponsor

### POST /api/Sponsor/GetSponsors
**Response:**
```json
{
  "main": {
    "offerId": "7c093c4f-a7b3-40ef-a6ba-7d46cd5ffc2f",
    "date": "2023-06-23T07:00:00.0000000",
    "name": "Genie Phone",
    "description": "Genie Phone - Für Genies!",
    "amounts": [
      { "current": 123397, "previous": 117321 },  // base amount
      { "current": 13757, "previous": 13079 },     // win bonus
      { "current": 12675, "previous": 12050 }      // goal bonus
    ],
    "stars": 0,
    "cards": 6,
    "accepted": true
  },
  "secondary": {
    "offerId": "a5c0506e-dfe7-4aba-890a-ea4e24f5b29b",
    "date": "2023-06-23T07:00:00.0000000",
    "name": "Al's Autos",
    "description": "Al's Autos - Do ya wanna car?",
    "amounts": [
      { "current": 41374, "previous": 39305 },
      { "current": 6229, "previous": 5918 },
      { "current": 12675, "previous": 12041 }
    ],
    "stars": 0,
    "cards": 2,
    "accepted": true
  },
  "negotiateCost": 100,       // GT Stars to re-negotiate
  "managerName": "Nikolai"
}
```

---

## 8. Friends & Challenges

### POST /api/Friends/GetFriends
**Request body adds:** `"Name": ""` (optional search filter)  
**Response:**
```json
{
  "friends": [
    {
      "teamId": "<guid>",
      "userName": "Anonimo",
      "teamName": "Peixe Frito FC",
      "country": "br",
      "teamLogo": "logo_20",
      "strength": 4791,
      "lastActivity": "2023-06-30T04:37:07.0570000",
      "language": "pt",
      "myLike": false,
      "likesMe": false,
      "challengeStatus": 0,   // 0=none, 1=pending, 2=accepted
      "challengeId": "00000000-0000-0000-0000-000000000000"
    }
    // ... 10 friend suggestions
  ],
  "friendName": null
}
```

### POST /api/Friends/GetChallenges
**Response:**
```json
{
  "challenges": [
    {
      "isAccepted": true,
      "isDeclined": false,
      "matchId": "8c3c0e6a-b314-40eb-a2b9-e0e6d19e9680",
      "matchDate": "2023-07-03T15:00:00.0000000",
      "homeCountry": "de",
      "awayCountry": "it",
      "homeScore": 0,
      "awayScore": 0,
      "opponentTeamId": "<guid>",
      "homeStrength": 8553,
      "awayStrength": 4308,
      "hasLineup": true,
      "isFriendly": true,
      "homeTrikot": "trikot9",
      "awayTrikot": "trikot2",
      "id": "<guid>",
      "date": "2023-06-29T17:19:13.3370000",
      "homeLogo": "logo_36",
      "awayLogo": "logo_26",
      "homeName": "FC Nikolai",
      "awayName": "Il Magnifico",
      "myTeam": 0
    }
    // ... 20+ challenge entries
  ],
  "friends": [
    // ... 37 friends with same structure as GetFriends
  ],
  "matchDate": "2023-07-03T15:00:00.0000000",
  "endDate": "2023-07-02T07:00:00.0000000"
}
```

---

## 9. League

### POST /api/League/GetLeagueTable
**Request body adds:** `"Id": "<leagueId-guid>"`  
**Response:**
```json
{
  "teams": [
    {
      "id": "<guid>",
      "name": "FC Nikolai",
      "strength": 8553,
      "logo": "logo_36",
      "country": "de",
      "isOnline": true,
      "isMine": true,
      "matches": { "home": 0, "away": 1 },
      "wins": { "home": 0, "away": 1 },
      "losses": { "home": 0, "away": 0 },
      "draws": { "home": 0, "away": 0 },
      "goalsScored": { "home": 0, "away": 13 },
      "goalsReceived": { "home": 0, "away": 0 },
      "points": { "home": 0, "away": 3 }
    }
    // ... 16 teams per league
  ],
  "leagueName": "2. Bundesliga Gr.4",
  "mount": 4,       // promotion slots
  "dismount": 4     // relegation slots
}
```

---

## 10. Transfer Market

### POST /api/Transfermarket/Search
**Request body adds:**
```json
{
  "Talent": { "Min": 7, "Max": 10 },
  "SkillIndex": -1     // -1 = any position
}
```
**Response:**
```json
{
  "players": [
    {
      "auctionId": "<guid>",
      "bidTeamName": null,
      "bidTeamLogo": null,
      "bid": 0,
      "isFrozen": false,
      "id": "<player-guid>",
      "name": "Bernward Stehmeier",
      "country": "de",
      "strength": 136.1685200000,
      "talent": 10,
      "age": 16,
      "position": 1,
      "head": "01_head-C07",
      "endDate": "2023-07-01T04:06:02.3000000"  // auction end
    }
    // ... multiple results
  ],
  "favorites": [
    // same structure — favorited auctions
  ],
  "sellings": [],
  "involved": false,
  "myTeamId": "<guid>"
}
```

---

## 11. Tutorial

### POST /api/Tutorial/GetTutorial
**Response:**
```json
{
  "currentStep": null   // null = tutorial completed
}
```

---

## 12. User

### POST /api/User/GetPreferences
**Response:**
```json
{
  "notificationSettings": {
    "auctionOverbid": true,
    "matchResults": true,
    "lineupIncomplete": true,
    "friendInvite": true,
    "ineffectiveTraining": true,
    "friendlyMatch": true,
    "system": true,
    "auctionEnd": true
  },
  "userData": {
    "name": "Nikolai",
    "score": 8953,
    "created": "2023-02-05T06:43:10.0130000",
    "lastActivity": "2023-06-30T04:52:13.9530000",
    "facebookId": "116052144733377",
    "appleId": null,
    "email": "nikolailinsch@posteo.de",
    "password": null,
    "rank": "Master!"
  }
}
```

---

## 13. SignalR Hubs

### POST //chat/negotiate
Azure SignalR Service negotiation for chat.
**Response:**
```json
{
  "negotiateVersion": 1,
  "connectionId": "<connection-id>",
  "connectionToken": "<jwt-token>",
  "url": "https://goaltacticsservice.service.signalr.net/client/?hub=chathub",
  "accessToken": "<jwt>"
}
```

### POST //auc/negotiate
Azure SignalR Service negotiation for auction/transfer market.
**Response:**
```json
{
  "negotiateVersion": 1,
  "connectionId": "<connection-id>",
  "connectionToken": "<jwt-token>",
  "url": "https://goaltacticsservice.service.signalr.net/client/?hub=transfermarkethub",
  "accessToken": "<jwt>"
}
```

---

## Endpoints NOT Found in Captures

The following endpoints were **not** captured in these SSL intercept sessions:

- Shop/Purchase endpoints (GetProducts, BuyItem, etc.)
- Lineup management (GetLineup, SetLineup, GetMatchFormation)
- Scouting (GetScoutedPlayers, InstructScout)
- Live match (GetMatchReport, GetMatchDetails)
- Match scheduling beyond what's in GetChallenges
- Player actions (Heal, ExtendContract, RenamePlayer, UpgradePlayer)
- Stadium actions (Build, Speedup, RenewGrass)
- Transfer market actions (PlaceBid, SellPlayer, CancelAuction)
- Chat (SendMessage — only negotiation captured)

---

## Key Data Observations

1. **All monetary values are high-precision decimals** (10+ decimal places) — suggests server-side floating point storage  
2. **Player strength is a decimal** (e.g., 126.8999560000), not an integer — the displayed integer value in UI is rounded  
3. **14 skills per player** — indexed 0-13, all decimal. The first skill (index 0) tends to be the highest for the player's position  
4. **Talent range:** 2-10 observed; most are 7-10  
5. **Age range:** 16-34 observed; players at 34 appear to be at max level (strength 700)  
6. **Team strength** (8553) appears to be a sum-based integer derived from player strengths  
7. **Tactic system is circular:** Normal → Pressing → One-Touch → Durch die Mitte → Konter → Über die Flügel → Kick and Rush → Normal  
8. **GT Stars** (premium currency) = 62,360 in this account; used for speedups, renames, training, etc.
9. **Season system:** Season 10, 8-day matchdays, 16 teams per league, 4 promote/4 relegate
10. **Contract dates** use UTC with timezone offset format
