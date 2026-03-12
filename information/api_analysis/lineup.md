# Lineup API — LineupController

> **Source:** `src/GoalTactics.Api/Controllers/LineupController.cs`
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

### POST `/api/GetLineups`

#### Purpose

Returns all saved lineups for the authenticated user's upcoming matches.

#### Request — `RequestObject`

Standard base request object.

#### Response — `LineupsResponse`

```json
{
  "success": true,
  "status": 1,
  "lineups": [
    {
      "matchId": "match-guid",
      "playerIds": ["player-guid-1", "player-guid-2", "...11 total"],
      "system": "4-4-2",
      "tactic": 1
    }
  ]
}
```

| Field | Type | Notes |
|---|---|---|
| `matchId` | `string` | The match this lineup is configured for. |
| `playerIds` | `string[]` | Array of 11 player GUIDs in positional order. |
| `system` | `string` | Formation string (e.g., `"4-4-2"`, `"4-3-3"`, `"3-5-2"`). |
| `tactic` | `int` | Tactic identifier (e.g., attacking, defensive, balanced). |

---

### POST `/api/GetMatchLineup`

| Property | Value |
|---|---|
| **Alias** | `/api/GetMatchFormation` |

#### Purpose

Returns the detailed lineup/formation for a specific match, including both teams' formations and player details.

#### Request — `LineupRequest`

```json
{
  "matchId": "match-guid"
}
```

#### Response — `MatchLineupResponse`

Contains full formation data for both teams including player details, positions, and tactics. **Response payload is approximately ~21KB** due to the comprehensive player data for both sides.

---

### POST `/api/SaveLineup`

#### Purpose

Saves or updates the lineup for a specific upcoming match.

#### Request — `SaveLineupRequest`

```json
{
  "matchId": "match-guid",
  "playerIds": [
    "player-1", "player-2", "player-3", "player-4",
    "player-5", "player-6", "player-7", "player-8",
    "player-9", "player-10", "player-11"
  ],
  "system": "4-4-2",
  "tactic": 1
}
```

| Field | Type | Notes |
|---|---|---|
| `matchId` | `string` | The match to set the lineup for. |
| `playerIds` | `string[11]` | Exactly 11 player GUIDs. Must be players from the user's squad. |
| `system` | `string` | Formation string. |
| `tactic` | `int` | Tactic identifier. |

#### Response — `ResponseObject`

---

## Security Notes

- All endpoints require `[Authorize]`.
- `SaveLineup` must validate that:
  - All 11 player IDs belong to the authenticated user's team.
  - The match ID corresponds to an upcoming match involving the user's team.
  - The formation string is a valid system.
  - No duplicate player IDs are present.
- `GetMatchLineup` may expose the opponent's lineup — ensure this is only allowed after the match has been played or at the appropriate time.

## Versioning

- `GetMatchFormation` is an alias for `GetMatchLineup` for legacy client compatibility.

## Potential Pitfalls

- `GetMatchLineup` / `GetMatchFormation` returns a **~21KB payload** — this is one of the larger responses in the API. Ensure proper compression (gzip/brotli) is enabled.
- `playerIds` must contain exactly 11 entries — fewer or more should be rejected.
- The `system` string must match a valid formation (e.g., the digits must sum to 10 for outfield players, with the goalkeeper implied).
- The `tactic` value is an integer enum — the Xamarin client maps these to display strings locally.
