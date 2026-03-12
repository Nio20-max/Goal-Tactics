# Scouting API — ScoutingController

> **Source:** `src/GoalTactics.Api/Controllers/ScoutingController.cs`
> **Route prefix:** `api`

---

## Global Notes

- All requests use **HTTP POST** with `Content-Type: application/json` (legacy Xamarin design).
- Base `RequestObject` has legacy fields: `signature`, `token`, `locale`, `utcOffset`, `culture`, `platform` — accepted but ignored.
- Base `ResponseObject` has: `success`, `message`, `status` (1 = OK / 2 = Error), `errorMessage`, `punishment`.
- Authentication via **Bearer JWT** in the `Authorization` header.
- Legacy Xamarin client also sends the token in the request body and as a query param `?access_token=`.
- Legacy routes existed at `/GameEngine/*` (nginx rewrites to `/api/`).
- The Xamarin client (v1.2.4) uses both old `/GameEngine/*` and new `/api/*` URL patterns.

---

## Authentication

**All endpoints require `[Authorize]` — a valid Bearer JWT must be provided.**

---

## Endpoints

### POST `/api/GetScoutedPlayers`

#### Purpose

Returns the user's currently scouted players and scouting cost information.

#### Request — `RequestObject`

Standard base request object.

#### Response — `ScoutingPlayersResponse`

```json
{
  "success": true,
  "status": 1,
  "players": [
    {
      "id": "scouted-player-guid",
      "name": "Prospect Player",
      "position": 4,
      "talent": 8,
      "strength": 55.0,
      "scoutingComplete": true
    }
  ],
  "scoutingCost": 500000,
  "premiumScoutingCost": 5,
  "speedupCost": 3,
  "nextScoutingDate": "2024-04-01T12:00:00Z"
}
```

| Field | Type | Notes |
|---|---|---|
| `players` | `array` | List of scouted player prospects. |
| `scoutingCost` | `decimal` | Cost in in-game currency to send the scout. Fixed at **500,000**. |
| `premiumScoutingCost` | `int` | Cost in premium currency for premium scouting. Fixed at **5**. |
| `speedupCost` | `int` | Cost in premium currency to speed up scouting. Fixed at **3**. |
| `nextScoutingDate` | `datetime` | ISO 8601 UTC timestamp when the next scouting trip can be initiated. |

---

### POST `/api/InstructScout`

#### Purpose

Sends the scout on a scouting mission to find new player prospects. Costs in-game or premium currency.

#### Request — `ScoutInstructionRequest`

```json
{
  "position": 4,
  "usePremium": false
}
```

| Field | Type | Notes |
|---|---|---|
| `position` | `int` | Target position to scout (0=GK, 2=DEF, 4=MID, 6=ATT). |
| `usePremium` | `bool` | If `true`, uses premium currency for higher quality prospects. |

#### Response — `ResponseObject`

---

### POST `/api/RecruitScoutedPlayer`

#### Purpose

Recruits a scouted player, adding them to the user's squad.

#### Request — `IdRequest`

```json
{
  "id": "scouted-player-guid"
}
```

#### Response — `ResponseObject`

---

### POST `/api/SpeedupScout`

#### Purpose

Speeds up an in-progress scouting mission using premium currency.

#### Request — `IdRequest`

```json
{
  "id": "scouting-mission-guid"
}
```

#### Response — `ResponseObject`

---

## Security Notes

- All endpoints require `[Authorize]`.
- `InstructScout` involves currency spending — validate sufficient balance.
- `SpeedupScout` uses premium currency — validate premium balance.
- `RecruitScoutedPlayer` should validate:
  - The scouted player belongs to the authenticated user's scouting results.
  - The scouting is complete.
  - The user's squad has room for another player.

## Versioning

- No route aliases in this controller.

## Potential Pitfalls

- Scouting is a **time-gated mechanic** — `nextScoutingDate` controls when the user can scout again. The server must enforce this; don't rely on client-side enforcement.
- The fixed costs (`scoutingCost: 500000`, `premiumScoutingCost: 5`, `speedupCost: 3`) are returned in the response to allow the client to display them without hardcoding — but they are currently constant values.
- Position enum uses non-consecutive values (`0, 2, 4, 6`) consistent with the squad position system.
- Scouted players are temporary — they exist in a scouting pool until recruited or the pool expires/refreshes.
- Premium scouting (`usePremium: true`) may return higher quality players — this is a monetisation mechanic.
