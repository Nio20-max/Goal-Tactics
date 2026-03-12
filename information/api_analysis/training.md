# Training API — TrainingController

> **Source:** `src/GoalTactics.Api/Controllers/TrainingController.cs`
> **Route prefixes:** `api`, `api/Training`

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

### POST `/api/GetTeamTraining`

| Property | Value |
|---|---|
| **Alias** | `/api/Training/GetTraining` |

#### Purpose

Returns all training data for the authenticated user's team including team training, tactic training, training camp status, and individual training assignments.

#### Request — `RequestObject`

Standard base request object.

#### Response — `TeamTrainingResponse`

Approximate payload size: **~17.6KB**.

```json
{
  "success": true,
  "status": 1,
  "teamTraining": { ... },
  "tacticTraining": { ... },
  "trainingCamp": { ... },
  "individualTraining": { ... }
}
```

| Field | Type | Notes |
|---|---|---|
| `teamTraining` | `object` | Current team-wide training configuration and progress. |
| `tacticTraining` | `object` | Tactic-specific training settings. |
| `trainingCamp` | `object` | Training camp booking status and details. |
| `individualTraining` | `object` | Per-player individual training assignments. |

---

### POST `/api/SaveTeamTraining`

#### Purpose

Saves or updates the team-wide training configuration.

#### Request — `TeamTrainingSaveRequest`

Contains the training focus, intensity, and schedule settings.

#### Response — `TeamTrainingData`

Returns the updated team training state.

---

### POST `/api/SaveTacticTraining`

#### Purpose

Saves or updates the tactic training configuration.

#### Request — `TacticTrainingSaveRequest`

Contains the tactic to train and training parameters.

#### Response — `TacticTrainingData`

Returns the updated tactic training state.

---

### POST `/api/BookTrainingCamp`

| Property | Value |
|---|---|
| **Alias** | `/api/Training/BookCamp` |

#### Purpose

Books a training camp for the team. Training camps provide temporary boosts to training effectiveness.

#### Request — `TrainingCampRequest`

```json
{
  "campType": 1,
  "duration": 3
}
```

#### Response — `TrainingCampData`

Returns the updated training camp status.

---

### POST `/api/CancelCamp`

#### Purpose

Cancels a currently booked training camp.

#### Request — `RequestObject`

Standard base request object.

#### Response — `TrainingCampData`

Returns the updated training camp status (should reflect cancellation).

---

### POST `/api/UpdateCamps`

#### Purpose

Refreshes/updates the training camp state. Used to sync camp progress.

#### Request — `RequestObject`

Standard base request object.

#### Response — `TrainingCampData`

---

### POST `/api/SaveIndividualTraining`

| Property | Value |
|---|---|
| **Alias** | `/api/Training/StartIndividualTraining` |

#### Purpose

Assigns individual training to a specific player, targeting a particular skill.

#### Request — `IndividualTrainingRequest`

```json
{
  "playerId": "player-guid",
  "skillIndex": 3
}
```

#### Response — `IndividualTrainingData`

Returns the updated individual training assignments.

---

### POST `/api/CancelIndividualTraining`

#### Purpose

Cancels a player's individual training assignment.

#### Request — `IndividualTrainingRequest`

```json
{
  "playerId": "player-guid",
  "skillIndex": 3
}
```

#### Response — `IndividualTrainingData`

---

### POST `/api/RenewIndividualTraining`

#### Purpose

Renews an existing individual training assignment for another cycle.

#### Request — `IdRequest`

```json
{
  "id": "training-assignment-guid"
}
```

#### Response — `IndividualTrainingData`

---

### POST `/api/RenewAllIndividualTraining`

| Property | Value |
|---|---|
| **Alias** | `/api/Training/RenewAllIndividualTrainings` |

#### Purpose

Renews all active individual training assignments in bulk.

#### Request — `RequestObject`

Standard base request object.

#### Response — `IndividualTrainingData`

---

## Security Notes

- All endpoints require `[Authorize]`.
- `BookTrainingCamp` involves financial transactions — validate sufficient funds.
- `SaveIndividualTraining` should validate that the player belongs to the authenticated user's team.
- Training mutations should be idempotent or protected against double-submission.

## Versioning

- Multiple aliases exist for backward compatibility:
  - `GetTeamTraining` ↔ `GetTraining`
  - `BookTrainingCamp` ↔ `BookCamp`
  - `SaveIndividualTraining` ↔ `StartIndividualTraining`
  - `RenewAllIndividualTraining` ↔ `RenewAllIndividualTrainings`

## Potential Pitfalls

- `GetTeamTraining` returns **~17.6KB** combining four different training subsystems — this is a medium-large payload.
- The `skillIndex` in `IndividualTrainingRequest` maps to the same 14-skill array as player skills — consistency with the `SquadResponse` skill array is essential.
- Training camp booking involves time-based mechanics — the server must correctly handle timezone differences and duration calculations.
- `RenewAllIndividualTraining` can be expensive if many players have active training — ensure this doesn't cause excessive database writes.
- `CancelCamp` may have partial refund logic — the response should reflect the financial impact.
