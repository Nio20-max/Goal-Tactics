# Live Match API — LiveController

> **Source:** `src/GoalTactics.Api/Controllers/LiveController.cs`
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

### POST `/api/GetLiveMatch`

#### Purpose

Returns the current state of a live match. Used by the client to display real-time match progress, commentary, and events.

#### Request — `IdRequest`

```json
{
  "id": "match-guid"
}
```

#### Response — `LiveMatchResponse`

Contains match state including:
- Current minute / half
- Score
- Match events (goals, fouls, cards, substitutions)
- Commentary text
- Player positions and ball state
- Both teams' lineups and formations

---

### POST `/api/GetMatchReport`

#### Purpose

Returns the full match report for a completed match. Contains the same data structure as `GetLiveMatch` but with the complete event timeline.

#### Request — `IdRequest`

```json
{
  "id": "match-guid"
}
```

#### Response — `LiveMatchResponse`

Same structure as `GetLiveMatch` but represents the full completed match.

---

### POST `/api/GetMatchDetails`

#### Purpose

**Alias for `GetMatchReport`.** Returns full match details.

#### Request — `IdRequest`

```json
{
  "id": "match-guid"
}
```

#### Response — `LiveMatchResponse`

---

## Security Notes

- All endpoints require `[Authorize]`.
- Match data is read-only — no mutations are performed.
- Ensure users can only access matches involving their team or matches in their league (depending on game design — some games allow viewing any match).
- Live match data may be polled frequently — consider caching or rate-limiting.

## Versioning

- `GetMatchDetails` is an alias for `GetMatchReport` for legacy client compatibility.

## Potential Pitfalls

- All three endpoints return the same `LiveMatchResponse` type — the difference is:
  - `GetLiveMatch`: Used during a live (in-progress) match. May return partial data.
  - `GetMatchReport` / `GetMatchDetails`: Used for completed matches. Returns the full event timeline.
- The Xamarin client may poll `GetLiveMatch` repeatedly during a live match for updates — this can generate significant load during matchday peaks.
- `LiveMatchResponse` can be a substantial payload depending on the number of match events — ensure compression is enabled.
- The match engine pre-computes match results; "live" matches are actually replayed from stored data, not simulated in real-time.
