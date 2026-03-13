# Ladder API — LadderController

> **Source:** `src/GoalTactics.Api/Controllers/LadderController.cs`
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

### POST `/api/GetLadder`

#### Purpose

Returns the ladder (ranked PvP) standings and season information.

#### Request — `IdRequest`

```json
{
  "id": "ladder-or-season-guid"
}
```

#### Response — `LadderResponse`

Approximate payload size: **~4KB**.

```json
{
  "success": true,
  "status": 1,
  "ladder": {
    "entries": [
      {
        "rank": 1,
        "teamId": "team-guid",
        "teamName": "FC Top",
        "points": 1500,
        "wins": 10,
        "losses": 2
      }
    ],
    "season": {
      "number": 3,
      "start": "2024-01-01T00:00:00Z",
      "end": "2024-06-30T23:59:59Z"
    }
  }
}
```

| Field | Type | Notes |
|---|---|---|
| `entries` | `array` | Ranked list of teams in the ladder. |
| `season` | `object` | Current ladder season metadata. |

---

### POST `/api/GetLadderChallenge`

#### Purpose

Retrieves the details of a ladder challenge (PvP match-up).

#### Request — `LadderChallengeRequest`

```json
{
  "opponentId": "team-guid"
}
```

#### Response — `LadderChallengeResponse`

Contains challenge details including the opponent's team info and stamina cost.

---

### POST `/api/RestoreStamina`

#### Purpose

Restores the user's ladder stamina (typically using premium currency), allowing more ladder matches to be played.

#### Request — `RequestObject`

Standard base request object.

#### Response — `TextResponse`

---

### POST `/api/RunMatch`

#### Purpose

Executes a ladder match against the challenged opponent. This triggers the match engine and returns the result.

#### Request — `LadderChallengeRequest`

```json
{
  "opponentId": "team-guid"
}
```

#### Response — `LadderMatchResponse`

Contains the match result, updated ladder positions, and any rewards earned.

---

## Security Notes

- All endpoints require `[Authorize]`.
- `RunMatch` is a state-changing operation that consumes stamina — validate sufficient stamina and prevent race conditions (double-tap).
- `RestoreStamina` involves premium currency — validate balance before deducting.
- Ensure the opponent team exists and is a valid ladder participant.

## Versioning

- No route aliases in this controller.

## Potential Pitfalls

- Ladder matches (`RunMatch`) are synchronous — the match engine runs inline and returns the result. This may be slow under load.
- Stamina management is a key game mechanic — `RestoreStamina` should be idempotent or at least protected against double-submission.
- The `LadderChallengeRequest` object is reused for both `GetLadderChallenge` and `RunMatch` — the client typically calls `GetLadderChallenge` first to preview, then `RunMatch` to execute.
- The ladder resets each season; historical data may not be accessible via this controller.
