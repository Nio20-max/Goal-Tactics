# Friends API — FriendsController

> **Source:** `src/GoalTactics.Api/Controllers/FriendsController.cs`
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

### POST `/api/GetFriends`

#### Purpose

Searches for users or retrieves the authenticated user's friends list. The `text` field acts as a search query — if empty, returns all friends.

#### Request — `SearchRequest`

```json
{
  "text": "search-query"
}
```

| Field | Type | Notes |
|---|---|---|
| `text` | `string` | Search string to filter by manager name or team name. Empty returns all friends. |

#### Response — `FriendsResponse`

```json
{
  "success": true,
  "status": 1,
  "friends": [
    {
      "userId": "user-guid",
      "managerName": "Friend Manager",
      "teamName": "Friend FC",
      "isOnline": true
    }
  ],
  "requests": [
    {
      "userId": "user-guid",
      "managerName": "Pending User",
      "teamName": "Pending FC"
    }
  ]
}
```

| Field | Type | Notes |
|---|---|---|
| `friends` | `array` | Confirmed friends list. |
| `requests` | `array` | Pending incoming friend requests. |

---

### POST `/api/GetChallenges`

#### Purpose

Returns the list of friendly match challenges (sent and received).

#### Request — `RequestObject`

#### Response — `ChallengesResponse`

---

### POST `/api/ReplyChallenge`

#### Purpose

Accepts or declines a friendly match challenge.

#### Request — `ChallengeReplyRequest`

```json
{
  "challengeId": "challenge-guid",
  "accept": true
}
```

#### Response — `ChallengesResponse`

Returns the updated challenges list.

---

### POST `/api/SendChallenge`

#### Purpose

Sends a friendly match challenge to another user.

#### Request — `IdRequest`

```json
{
  "id": "target-user-guid"
}
```

#### Response — `ChallengesResponse`

Returns the updated challenges list.

---

### POST `/api/Like`

#### Purpose

Adds a user as a friend (sends a friend request).

#### Request — `IdRequest`

```json
{
  "id": "target-user-guid"
}
```

#### Response — `ResponseObject`

---

### POST `/api/Unlike`

#### Purpose

Removes a friend or cancels a pending friend request.

#### Request — `IdRequest`

```json
{
  "id": "target-user-guid"
}
```

#### Response — `ResponseObject`

---

### POST `/api/Accept`

#### Purpose

Accepts an incoming friend request.

#### Request — `IdRequest`

```json
{
  "id": "requesting-user-guid"
}
```

#### Response — `FriendsResponse`

Returns the updated friends list.

---

### POST `/api/Decline`

#### Purpose

Declines an incoming friend request.

#### Request — `IdRequest`

```json
{
  "id": "requesting-user-guid"
}
```

#### Response — `FriendsResponse`

Returns the updated friends list.

---

## Security Notes

- All endpoints require `[Authorize]`.
- `Like` / `Accept` / `SendChallenge` should validate that the target user exists and is not the authenticated user themselves.
- Friend requests should be rate-limited or capped to prevent spam.
- `GetFriends` with a search query could be used for user enumeration — ensure the search is appropriately scoped.

## Versioning

- No route aliases in this controller.
- The naming convention (`Like` / `Unlike`) comes from the original game's social system where "liking" was equivalent to sending a friend request.

## Potential Pitfalls

- `Like` and `Accept` are separate operations: `Like` sends a request, `Accept` confirms it. The Xamarin client UI maps these to different buttons.
- `GetFriends` serves dual duty as both a friends list and a user search — the `text` parameter determines the behavior.
- `SendChallenge` initiates a friendly match (not a ladder match) — different from the ladder `RunMatch` flow.
- All social endpoints return updated list state — the client replaces its local state with the response rather than performing incremental updates.
