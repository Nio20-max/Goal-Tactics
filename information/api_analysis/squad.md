# Squad API — SquadController

> **Source:** `src/GoalTactics.Api/Controllers/SquadController.cs`
> **Route prefixes:** `api`, `api/Squad`

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

### POST `/api/GetSquad`

| Property | Value |
|---|---|
| **Alias** | `/api/GetPlayers` |

#### Purpose

Returns the authenticated user's full squad of players with detailed attributes.

#### Request — `RequestObject`

Standard base request object.

#### Response — `SquadResponse`

```json
{
  "success": true,
  "status": 1,
  "players": [
    {
      "id": "player-guid",
      "name": "John Smith",
      "position": 0,
      "strength": 72.5,
      "talent": 7,
      "age": 24,
      "fitness": 95.0,
      "skills": [0.65, 0.72, 0.58, 0.81, 0.44, 0.69, 0.55, 0.77, 0.62, 0.48, 0.73, 0.60, 0.85, 0.50],
      "head": 3,
      "body": 5,
      "gloves": 2,
      "shoes": 1,
      "shirt": 4,
      "country": 1
    }
  ]
}
```

| Field | Type | Notes |
|---|---|---|
| `position` | `int` | `0` = GK, `2` = DEF, `4` = MID, `6` = ATT |
| `talent` | `int` | 1–10 scale, determines training potential. |
| `fitness` | `float` | 0–100 percentage. |
| `skills` | `float[14]` | Array of 14 skill values (floats, 0.0–1.0). |
| `head` / `body` / `gloves` / `shoes` / `shirt` | `int` | Equipment slot identifiers (cosmetic/stat items). |
| `country` | `int` | Country ID matching `GetCountries`. |

#### Notes

- Position values use an enum with gaps (`0, 2, 4, 6`) — not consecutive integers.
- The 14 skill floats map to specific skill categories (e.g., passing, shooting, tackling).

---

### POST `/api/GetPlayerStatistics`

#### Purpose

Returns detailed statistics for a specific player.

#### Request — `IdRequest`

```json
{
  "id": "player-guid"
}
```

#### Response — `PlayerStatisticsResponse`

---

### POST `/api/GetTeamPlayers`

#### Purpose

Returns the player list for another team (public view of someone else's squad).

#### Request — `IdRequest`

```json
{
  "id": "team-guid"
}
```

#### Response — `TeamPlayersResponse`

---

### POST `/api/GetTrainingProgress`

#### Purpose

Returns the current training progress for a specific player.

#### Request — `IdRequest`

```json
{
  "id": "player-guid"
}
```

#### Response — `TrainingProgressResponse`

---

### POST `/api/RenamePlayer`

| Property | Value |
|---|---|
| **Alias** | `/api/ChangePlayerName` |

#### Purpose

Changes a player's display name.

#### Request — `RenameRequest`

```json
{
  "id": "player-guid",
  "name": "New Player Name"
}
```

#### Response — `TextResponse`

---

### POST `/api/ChangeOrigin`

| Property | Value |
|---|---|
| **Alias** | `/api/ChangePlayerOrigin` |

#### Purpose

Changes a player's country of origin.

#### Request — `OriginRequest`

```json
{
  "id": "player-guid",
  "countryId": 3
}
```

#### Response — `TextResponse`

---

### POST `/api/ChangeShirt`

| Property | Value |
|---|---|
| **Alias** | `/api/ChangePlayerShirt` |

#### Purpose

Changes a player's shirt number.

#### Request — `NumberRequest`

```json
{
  "id": "player-guid",
  "number": 10
}
```

#### Response — `ResponseObject`

---

### POST `/api/SellPlayer`

#### Purpose

Lists a player for sale on the transfer market.

#### Request — `IdRequest`

```json
{
  "id": "player-guid"
}
```

#### Response — `ResponseObject`

---

### POST `/api/FirePlayer`

#### Purpose

Removes a player from the squad permanently (no transfer, no compensation).

#### Request — `IdRequest`

```json
{
  "id": "player-guid"
}
```

#### Response — `ResponseObject`

---

### POST `/api/ExtendPlayerContract`

#### Purpose

Extends a player's contract, paying the renewal cost.

#### Request — `PlayerContractRequest`

```json
{
  "id": "request-guid",
  "playerID": "player-guid",
  "salary": 50000,
  "premiumRenewal": false
}
```

| Field | Type | Notes |
|---|---|---|
| `playerID` | `string` | The player whose contract to extend. |
| `salary` | `decimal` | Proposed new salary. |
| `premiumRenewal` | `bool` | If `true`, uses premium currency for the renewal. |

#### Response — `PlayerContractResponse`

```json
{
  "success": true,
  "status": 1,
  "newSalary": 55000,
  "renewCost": 100000
}
```

---

### POST `/api/GetPlayerContractCost`

#### Purpose

Previews the cost of extending a player's contract without actually executing it.

#### Request — `PlayerContractRequest`

Same as `ExtendPlayerContract`.

#### Response — `PlayerContractResponse`

Same structure — returns the calculated `newSalary` and `renewCost`.

---

### POST `/api/UpgradePlayer`

#### Purpose

Upgrades a player (uses premium currency or items).

#### Request — `IdRequest`

```json
{
  "id": "player-guid"
}
```

#### Response — `ResponseObject`

---

### POST `/api/UseSkillCard`

#### Purpose

Uses a skill card item on a player to boost a specific skill.

#### Request — `IdRequest`

```json
{
  "id": "skill-card-guid"
}
```

#### Response — `ResponseObject`

---

### POST `/api/HealPlayer`

#### Purpose

Heals an injured player (uses premium currency or items).

#### Request — `IdRequest`

```json
{
  "id": "player-guid"
}
```

#### Response — `ResponseObject`

---

### POST `/api/GetSkillCards`

#### Purpose

Returns the user's inventory of skill cards.

#### Request — `RequestObject`

#### Response — `SkillCardsResponse`

---

## Security Notes

- All endpoints require `[Authorize]`.
- `SellPlayer` and `FirePlayer` are destructive operations — ensure the player belongs to the authenticated user's team.
- `ExtendPlayerContract` involves financial transactions — validate sufficient funds and prevent double-submission.
- `GetTeamPlayers` exposes other teams' squads; ensure only public-safe data is returned.

## Versioning

- Multiple aliases exist (`RenamePlayer` / `ChangePlayerName`, `ChangeOrigin` / `ChangePlayerOrigin`, etc.) for backward compatibility with the legacy Xamarin client.

## Potential Pitfalls

- Position enum uses non-consecutive values (`0, 2, 4, 6`) — clients must map these correctly.
- The `skills` array always has exactly 14 elements. The order and meaning of each index is defined by the game engine, not by the API schema.
- `SellPlayer` in the SquadController lists a player for sale; there is also a `SellPlayer` / `ListPlayer` in the TransferMarketController — they may share logic but are different routes.
- `GetPlayerContractCost` is a read-only preview; `ExtendPlayerContract` is the actual mutation. Clients should call the preview first.
