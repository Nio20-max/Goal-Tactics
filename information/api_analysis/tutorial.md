# Tutorial API — TutorialController

> **Source:** `src/GoalTactics.Api/Controllers/TutorialController.cs`
> **Route prefixes:** `api`, `api/Tutorial`

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

### POST `/api/GetTutorial`

#### Purpose

Returns the current tutorial state for the authenticated user, including which step they are on and what steps are available.

#### Request — `RequestObject`

Standard base request object.

#### Response — `TutorialResponse`

Contains the tutorial progress state, current step, and available actions.

---

### POST `/api/SkipTutorial`

#### Purpose

Skips the entire tutorial sequence, marking it as completed.

#### Request — `RequestObject`

Standard base request object.

#### Response — `TutorialResponse`

Returns the updated tutorial state (should show completed/skipped status).

---

### POST `/api/FinishTutorialStep`

#### Purpose

Marks the current tutorial step as completed and advances to the next step. May trigger rewards for step completion.

#### Request — `RequestObject`

Standard base request object.

#### Response — `TutorialResponse`

Returns the updated tutorial state with the next step.

---

### POST `/api/ResetTutorial`

#### Purpose

Resets the tutorial to the beginning. Primarily used for testing/debugging.

#### Request — `TutorialRequest`

```json
{
  "step": 0
}
```

| Field | Type | Notes |
|---|---|---|
| `step` | `int` | The step to reset to (typically `0` for full reset). |

#### Response — `TutorialResponse`

---

## Security Notes

- All endpoints require `[Authorize]`.
- `ResetTutorial` is potentially destructive (resets progress) — consider restricting to admin/debug builds only.
- `SkipTutorial` should still grant any essential rewards that are gated behind tutorial completion.
- Tutorial steps may grant resources (money, items, etc.) — ensure `FinishTutorialStep` prevents double-claiming.

## Versioning

- No route aliases beyond the dual prefix (`api` / `api/Tutorial`).

## Potential Pitfalls

- `FinishTutorialStep` uses a `RequestObject` (no step ID) — the server must track the current step internally. This means steps must be completed in order.
- `ResetTutorial` accepts a `TutorialRequest` with a `step` field — this could be used to reset to a specific step, not just the beginning. Validate the step value.
- The tutorial system is stateful and sequential — concurrent calls to `FinishTutorialStep` could cause race conditions.
- Some tutorial steps may trigger game state changes (e.g., "buy your first player") that are hard to reverse if the tutorial is reset.
