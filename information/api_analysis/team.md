# Team API — TeamController

> **Source:** `src/GoalTactics.Api/Controllers/TeamController.cs`
> **Route prefixes:** `api`, `api/Team`

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

### POST `/api/GetTeamInfo`

#### Purpose

Returns team data for a specific team (may be another user's team).

#### Request — `IdRequest`

```json
{
  "id": "team-guid"
}
```

#### Response — `TeamDataResponse`

Contains team data, last match, next match, and rewards for the specified team.

---

### POST `/api/GetMyTeamInfo`

#### Purpose

Returns the authenticated user's own team information including match info and rewards.

#### Request — `RequestObject`

Standard base request object.

#### Response — `TeamDataResponse`

```json
{
  "success": true,
  "status": 1,
  "teamData": {
    "name": "FC Example",
    "logo": "wappen12",
    "strength": 65.4,
    "finances": 1500000
  },
  "lastMatch": { ... },
  "nextMatch": { ... },
  "rewards": [ ... ]
}
```

| Field | Type | Notes |
|---|---|---|
| `teamData.name` | `string` | Team display name. |
| `teamData.logo` | `string` | Logo identifier (format: `"wappenXX"`). |
| `teamData.strength` | `float` | Overall team strength rating. |
| `teamData.finances` | `decimal` | Current team balance. |
| `lastMatch` | `object` | Summary of the last played match. |
| `nextMatch` | `object` | Summary of the next scheduled match. |
| `rewards` | `array` | Pending unclaimed rewards. |

---

### POST `/api/GetMyTeamExtendedInfo`

#### Purpose

Returns extended team information including additional statistics and details.

#### Request — `RequestObject`

#### Response — `ExtendedTeamDataResponse`

Extends `TeamDataResponse` with additional fields (stadium info, league position, etc.).

---

### POST `/api/GetClubNews`

#### Purpose

Returns news/feed items for a specific club.

#### Request — `IdRequest`

```json
{
  "id": "team-guid"
}
```

#### Response — `ClubNewsResponse`

---

### POST `/api/GetMyResources`

#### Purpose

Returns the authenticated user's current resource balances (money, premium currency, fans).

#### Request — `RequestObject`

#### Response — `ResourcesResponse`

```json
{
  "success": true,
  "status": 1,
  "money": 1500000,
  "premium": 25,
  "fans": 5000
}
```

| Field | Type | Notes |
|---|---|---|
| `money` | `decimal` | In-game currency balance. |
| `premium` | `int` | Premium currency balance (IAP). |
| `fans` | `int` | Current fan count. |

#### Xamarin Client Notes

**This endpoint is called on EVERY screen navigation** in the Xamarin client. It is one of the most frequently hit endpoints. Ensure it is lightweight and fast.

---

### POST `/api/GetMyMail`

#### Purpose

Returns the authenticated user's in-game mailbox.

#### Request — `RequestObject`

#### Response — `MailResponse`

```json
{
  "success": true,
  "status": 1,
  "mails": [
    {
      "id": "mail-guid",
      "subject": "Transfer Complete",
      "body": "Your bid was successful...",
      "isRead": false
    }
  ]
}
```

---

### POST `/api/MarkAsRead`

#### Purpose

Marks a single mail message as read.

#### Request — `IdRequest`

```json
{
  "id": "mail-guid"
}
```

#### Response — `ResponseObject`

---

### POST `/api/MarkAllAsRead`

#### Purpose

Marks all mail messages as read for the authenticated user.

#### Request — `RequestObject`

#### Response — `ResponseObject`

---

### POST `/api/DeleteMail`

#### Purpose

Deletes a single mail message.

#### Request — `IdRequest`

```json
{
  "id": "mail-guid"
}
```

#### Response — `ResponseObject`

---

### POST `/api/DeleteAllRead`

#### Purpose

Deletes all mail messages that have been marked as read.

#### Request — `RequestObject`

#### Response — `ResponseObject`

---

### POST `/api/GetAccomplishments`

#### Purpose

Returns the user's accomplishments / achievements list.

#### Request — `RequestObject`

#### Response — `AccomplishmentsResponse`

---

### POST `/api/GetFinanceHistory`

#### Purpose

Returns the team's financial transaction history grouped by matchday.

#### Request — `RequestObject`

#### Response — `FinanceHistoryResponse`

```json
{
  "success": true,
  "status": 1,
  "entries": [
    {
      "matchday": 5,
      "date": "2024-03-15T12:00:00Z",
      "items": [
        { "description": "Match Revenue", "amount": 50000 },
        { "description": "Player Salary", "amount": -25000 }
      ]
    }
  ]
}
```

---

### POST `/api/GetFinances`

#### Purpose

Returns the team's current financial summary.

#### Request — `RequestObject`

#### Response — `FinancesResponse`

```json
{
  "success": true,
  "status": 1,
  "finances": {
    "balance": 1500000,
    "income": 200000,
    "expenses": 150000
  }
}
```

---

### POST `/api/ChangeTeamName`

#### Purpose

Changes the authenticated user's team name.

#### Request — `RenameRequest`

```json
{
  "name": "New Team Name"
}
```

#### Response — `ResponseObject`

---

## Security Notes

- All endpoints are protected by `[Authorize]`.
- `ChangeTeamName` should validate for profanity/inappropriate content.
- `GetMyResources` is extremely high-frequency — ensure it cannot be used for timing attacks or resource enumeration.

## Versioning

- Route aliases (`/api/Team/*` vs `/api/*`) exist for backward compatibility.

## Potential Pitfalls

- `GetMyResources` is called on **every screen navigation** by the Xamarin client — this is the single most common API call. Performance is critical.
- `logo` values use the format `"wappenXX"` (German for "crest") — this is a legacy naming convention from the original codebase.
- `GetTeamInfo` with an `IdRequest` can view any team's public info, not just the authenticated user's team.
- Mail operations (`MarkAsRead`, `DeleteMail`, etc.) should validate that the mail belongs to the authenticated user.
