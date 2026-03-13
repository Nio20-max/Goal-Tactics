# Stadium API — StadiumController

> **Source:** `src/GoalTactics.Api/Controllers/StadiumController.cs`
> **Route prefixes:** `api`, `api/Stadium`

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

### POST `/api/GetStadium`

#### Purpose

Returns the authenticated user's stadium information including capacity, level, and buildings.

#### Request — `RequestObject`

Standard base request object.

#### Response — `StadiumResponse`

Approximate payload size: **~4.5KB**.

```json
{
  "success": true,
  "status": 1,
  "stadium": {
    "name": "My Arena",
    "capacity": 15000,
    "level": 3,
    "places": [
      { "id": 1, "type": "stand", "count": 5000 },
      { "id": 2, "type": "vip", "count": 500 }
    ],
    "buildings": [
      { "id": 1, "type": "shop", "level": 2 },
      { "id": 2, "type": "restaurant", "level": 1 }
    ]
  }
}
```

| Field | Type | Notes |
|---|---|---|
| `name` | `string` | Stadium display name. |
| `capacity` | `int` | Total seating capacity. |
| `level` | `int` | Overall stadium upgrade level. |
| `places` | `array` | Seating sections with type and count. |
| `buildings` | `array` | Stadium facilities/buildings with type and level. |

---

### POST `/api/GetBuildPlaces`

#### Purpose

Returns available building slots and options for stadium expansion.

#### Request — `RequestObject`

Standard base request object.

#### Response — `BuildPlacesResponse`

---

### POST `/api/BuildStadium`

| Property | Value |
|---|---|
| **Alias** | `/api/Stadium/Build` |

#### Purpose

Upgrades the stadium to the next level or builds a new stadium section.

#### Request — `IdRequest`

```json
{
  "id": "building-slot-guid"
}
```

#### Response — `ResponseObject`

---

### POST `/api/BuildPlaces`

#### Purpose

Adds or upgrades seating sections in the stadium.

#### Request — `StadiumPlacesRequest`

```json
{
  "places": [
    { "id": 1, "count": 2000 },
    { "id": 2, "count": 100 }
  ]
}
```

| Field | Type | Notes |
|---|---|---|
| `places` | `array` | Array of place configurations with ID and desired count. |
| `places[].id` | `int` | Seating section identifier. |
| `places[].count` | `int` | Number of seats to add/set for this section. |

#### Response — `ResponseObject`

---

### POST `/api/SpeedupBuilding`

| Property | Value |
|---|---|
| **Alias** | `/api/Stadium/Speedup` |

#### Purpose

Speeds up an in-progress building/upgrade using premium currency.

#### Request — `IdRequest`

```json
{
  "id": "construction-guid"
}
```

#### Response — `ResponseObject`

---

### POST `/api/RenewStadiumGrass`

| Property | Value |
|---|---|
| **Alias** | `/api/Stadium/RenewGrass` |

#### Purpose

Renews the stadium grass/pitch. Grass quality affects match performance.

#### Request — `RequestObject`

Standard base request object.

#### Response — `ResponseObject`

---

### POST `/api/RenameStadium`

#### Purpose

Changes the stadium's display name.

#### Request — `TextRequest`

```json
{
  "text": "New Stadium Name"
}
```

#### Response — `ResponseObject`

---

### POST `/api/GetUnderConstruction`

#### Purpose

Returns the list of currently active building/upgrade jobs.

#### Request — `RequestObject`

Standard base request object.

#### Response — `UnderConstructionResponse`

---

## Security Notes

- All endpoints require `[Authorize]`.
- `BuildStadium`, `BuildPlaces`, and `SpeedupBuilding` involve financial transactions — validate sufficient funds/premium currency.
- `RenameStadium` should validate for profanity/inappropriate content.
- Building operations are time-gated — the server must enforce construction timers.

## Versioning

- Route aliases for backward compatibility:
  - `BuildStadium` ↔ `Build`
  - `SpeedupBuilding` ↔ `Speedup`
  - `RenewStadiumGrass` ↔ `RenewGrass`

## Potential Pitfalls

- Stadium building is a **time-gated mechanic** — constructions take real time to complete. `SpeedupBuilding` bypasses this with premium currency.
- `BuildPlaces` accepts an array, allowing multiple seating sections to be modified in one call — validate each entry individually.
- Grass quality (`RenewStadiumGrass`) degrades over time and affects match outcomes — this is a recurring maintenance cost.
- `GetUnderConstruction` should be polled by the client to check build completion — there is no push notification for build completion.
- Stadium capacity directly impacts match-day revenue — upgrades have cascading financial effects.
