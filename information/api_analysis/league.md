# League API — LeagueController

> **Source:** `src/GoalTactics.Api/Controllers/LeagueController.cs`
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

### POST `/api/GetLeagueTable`

#### Purpose

Returns the league standings table for a given league.

#### Request — `IdRequest`

```json
{
  "id": "league-guid"
}
```

#### Response — `LeagueTableResponse`

Approximate payload size: **~6KB**.

```json
{
  "success": true,
  "status": 1,
  "teams": [
    {
      "id": "team-guid",
      "name": "FC Example",
      "logo": "wappen12",
      "points": 24,
      "goalsFor": 18,
      "goalsAgainst": 9
    }
  ]
}
```

| Field | Type | Notes |
|---|---|---|
| `id` | `string` | Team identifier. |
| `name` | `string` | Team display name. |
| `logo` | `string` | Logo identifier (`"wappenXX"` format). |
| `points` | `int` | Total league points. |
| `goalsFor` | `int` | Total goals scored. |
| `goalsAgainst` | `int` | Total goals conceded. |

---

### POST `/api/GetMatches`

#### Purpose

Returns the full season match schedule and results for a given league.

#### Request — `IdRequest`

```json
{
  "id": "league-guid"
}
```

#### Response — `MatchesResponse`

Approximate payload size: **~101KB**.

Contains all matches for the entire season including past results and future fixtures. Each match includes team IDs, scores, dates, and match status.

#### Performance Note

This is one of the **largest payloads in the entire API** (~101KB). The Xamarin client fetches the full season in one call. Consider:
- Ensuring HTTP compression is enabled.
- The client may cache this response aggressively.
- Future API versions could paginate by matchday.

---

### POST `/api/GetGoalGetters`

#### Purpose

Returns the top goalscorer rankings for a given league.

#### Request — `IdRequest`

```json
{
  "id": "league-guid"
}
```

#### Response — `GoalGettersResponse`

Approximate payload size: **~2.7KB**.

Contains a ranked list of players sorted by goals scored.

---

## Security Notes

- All endpoints require `[Authorize]`.
- League data is read-only — no mutations are performed.
- The `id` parameter should be validated to ensure the user has access to the requested league (or leagues may be publicly viewable by design).

## Versioning

- No route aliases in this controller — routes are straightforward.

## Potential Pitfalls

- `GetMatches` returns **~101KB** — this is the single largest response in the API. Compression and caching are essential.
- The Xamarin client loads the entire season at once; there is no matchday-level pagination.
- League tables include bot teams mixed with real teams — the client treats them identically.
- `logo` values use the `"wappenXX"` naming convention (German for "crest").
