# https://gt.nikolai-linschmann.de/api/Live/GetMatchDetails

## Request

```
{
  "Signature": "c7f588018d55f5b402b4ea513bdd3b8c",
  "Token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiYWQ0MTNiYzg4OGY0NDExYjRiZDZlNmYyYWVlMTgyOCIsInVuaXF1ZV9uYW1lIjoiVGVzdCIsImp0aSI6ImJiNjU4ZTFkZGUzNDQyMzk5ODg0MTYxOGJlNTc0NzJhIiwibmJmIjoxNzczNDE1MjIyLCJleHAiOjE3NzM0MjI0MjIsImlzcyI6IkdvYWxUYWN0aWNzLkFwaSIsImF1ZCI6IkdvYWxUYWN0aWNzLkNsaWVudCJ9.q8AyShq3qIOl0wkQvsczLU5HQWpQrOOb0QUvOwNngR4",
  "Locale": "en-DE",
  "UtcOffset": "00:00:00",
  "Culture": "en-US",
  "Platform": 1
}
```

## Response

```
{
  "match": {
    "matchId": "d1ea71ab-8c23-4b6a-968d-f642e1e96188",
    "homeTeam": "Test",
    "awayTeam": "HeaderDusk BoltDribble",
    "id": "d1ea71ab-8c23-4b6a-968d-f642e1e96188",
    "homeName": "Test",
    "awayName": "HeaderDusk BoltDribble",
    "homeLogo": "wappen63",
    "awayLogo": "wappen22",
    "homeCountry": "DE",
    "awayCountry": "DE",
    "homeScore": -1,
    "awayScore": -1,
    "homeStrength": 837,
    "awayStrength": 803,
    "hasLineup": false,
    "isFriendly": false,
    "homeTrikot": null,
    "awayTrikot": null,
    "opponentTeamId": "ee325726-6ead-4128-aaaf-de2ae865fcc9",
    "date": "2026-03-13T18:00:00.0000000",
    "myTeam": 1,
    "report": "Upcoming match: Test vs HeaderDusk BoltDribble on 2026-03-13"
  },
  "report": "Upcoming match: Test vs HeaderDusk BoltDribble on 2026-03-13",
  "success": true,
  "message": null,
  "status": 1,
  "errorMessage": null,
  "punishment": 0,
  "totalCount": 0,
  "currentPage": 0,
  "totalPages": 0
}
```
