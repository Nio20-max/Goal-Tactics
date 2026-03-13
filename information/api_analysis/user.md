# User API — UserController

> **Source:** `src/GoalTactics.Api/Controllers/UserController.cs`
> **Route prefixes:** `api`, `api/User`

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

### POST `/api/ClaimDailyReward`

| Property | Value |
|---|---|
| **Rate Limit** | `mutation-write` |

#### Purpose

Claims the daily login reward. Rewards may escalate with consecutive daily logins.

#### Request — `RequestObject`

Standard base request object.

#### Response — `ValueResponse`

```json
{
  "success": true,
  "status": 1,
  "value": 10000
}
```

| Field | Type | Notes |
|---|---|---|
| `value` | `decimal` | The reward amount granted. |

---

### POST `/api/GetHelpshiftUserInfo`

#### Purpose

Returns user information formatted for the Helpshift customer support integration.

#### Request — `RequestObject`

Standard base request object.

#### Response — `HelpshiftUserResponse`

Contains user identifiers and metadata needed to initialise the Helpshift SDK for in-app customer support.

---

### POST `/api/GetPreferences`

#### Purpose

Returns the user's saved preferences/settings.

#### Request — `RequestObject`

Standard base request object.

#### Response — `PreferencesResponse`

Contains user preference data such as notification settings, language preferences, and display options.

---

### POST `/api/SavePreferences`

#### Purpose

Saves updated user preferences/settings.

#### Request — `PreferencesRequest`

```json
{
  "notifications": true,
  "language": "en",
  "soundEnabled": true
}
```

#### Response — `ResponseObject`

---

### POST `/api/UpdateUser`

#### Purpose

Updates user profile information (email, manager name, etc.).

#### Request — `UpdateUserRequest`

```json
{
  "managerName": "New Name",
  "email": "newemail@example.com"
}
```

#### Response — `UpdateUserResponse`

Returns the updated user profile data.

---

### POST `/api/DeleteAccount`

#### Purpose

Permanently deletes the authenticated user's account and all associated data. This is an irreversible operation.

#### Request — `RequestObject`

Standard base request object.

#### Response — `ResponseObject`

---

### POST `/api/EnableMatchPush`

| Property | Value |
|---|---|
| **Rate Limit** | `mutation-write` |

#### Purpose

Enables or configures push notifications for match events (goals, match start, match end).

#### Request — `EnableMatchPushRequest`

```json
{
  "enabled": true,
  "deviceToken": "apns-or-fcm-token"
}
```

#### Response — `EnableMatchPushResponse`

---

## Security Notes

- All endpoints require `[Authorize]`.
- **`DeleteAccount` is an irreversible, destructive operation:**
  - Should require additional confirmation (e.g., re-authentication or a confirmation code).
  - Must comply with GDPR/data privacy regulations for data deletion.
  - Should cascade-delete all associated data (team, players, matches, etc.).
- `ClaimDailyReward` is rate-limited under `mutation-write` to prevent double-claiming.
- `EnableMatchPush` is rate-limited to prevent push token abuse.
- `UpdateUser` should validate email format and check for uniqueness.
- `SavePreferences` should validate preference values against allowed options.

## Versioning

- No route aliases beyond the dual prefix (`api` / `api/User`).

## Potential Pitfalls

- `ClaimDailyReward` must be idempotent within a 24-hour window — calling it twice in the same day should not grant double rewards.
- `DeleteAccount` with just a `RequestObject` (no confirmation) is a potential UX/security risk — accidental or malicious deletion is possible.
- `GetHelpshiftUserInfo` returns data for a third-party SDK integration — if Helpshift is deprecated, this endpoint becomes dead code.
- `EnableMatchPush` handles platform-specific push tokens (APNS for iOS, FCM for Android) — the `deviceToken` format differs by platform.
- `UpdateUser` email changes may require re-verification — ensure the email verification flow is triggered.
