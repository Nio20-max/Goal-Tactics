# Authentication API — AuthController

> **Source:** `src/GoalTactics.Api/Controllers/AuthController.cs`
> **Route prefixes:** `api`, `api/Authentication`

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

## Endpoints

### POST `/api/Register`

| Property | Value |
|---|---|
| **Alias** | `/api/Authentication/Register` |
| **Auth** | None |
| **Rate Limit** | `auth-sensitive` |

#### Purpose

Registers a new user account. Creates a full team with 18 players (2 GK / 6 DEF / 6 MID / 4 ATT), enrolls the team in a league with bots, assigns sponsors, and initialises the stadium.

#### Request — `RegisterRequest`

```json
{
  "isGuest": true,
  "email": "user@example.com",
  "login": "user@example.com",
  "password": "secret",
  "managerName": "My Manager",
  "teamName": "My Team",
  "countryId": 1
}
```

| Field | Type | Notes |
|---|---|---|
| `isGuest` | `bool` | If `true`, generates a guest account with random credentials. |
| `email` | `string` | User email. |
| `login` | `string` | **Legacy alias** for `email` — the Xamarin client sends both. |
| `password` | `string` | Plain-text password (hashed server-side). |
| `managerName` | `string` | Display name for the manager. |
| `teamName` | `string` | **Legacy alias** for `managerName`. |
| `countryId` | `int` | Country identifier (see `GetCountries`). |

#### Response — `RegisterResponse`

```json
{
  "success": true,
  "userId": "guid-string",
  "login": "user@example.com",
  "password": "generated-if-guest",
  "status": 1,
  "errorMessage": null
}
```

#### Legacy / Xamarin Notes

- The `login` field duplicates `email` for backward compatibility.
- `teamName` is treated as an alias of `managerName`; the original server used them interchangeably.

---

### POST `/api/Login`

| Property | Value |
|---|---|
| **Alias** | `/api/Authentication/Login` |
| **Auth** | None |
| **Rate Limit** | `auth-sensitive` |

#### Purpose

Authenticates a user and returns a JWT token plus a refresh token.

#### Request — `AuthRequest`

```json
{
  "email": "user@example.com",
  "password": "secret"
}
```

| Field | Type | Notes |
|---|---|---|
| `email` | `string` | User email or login. |
| `login` | `string` | Alternative to `email` — either field is accepted. |
| `password` | `string` | Plain-text password. |

#### Response — `AuthResponse`

```json
{
  "token": "eyJhbGciOi...",
  "refreshToken": "guid-string",
  "managerName": "My Manager",
  "userId": "guid-string",
  "level": 0,
  "isAdmin": false
}
```

| Field | Notes |
|---|---|
| `token` | JWT bearer token. |
| `refreshToken` | Opaque refresh token for silent re-auth. |
| `level` | **Always 0** — field retained for legacy compatibility. |
| `isAdmin` | Whether the user has admin privileges. |

#### Legacy / Xamarin Notes

- The original server returned a GUID-style token. The Xamarin client accepts both GUID and JWT formats.
- `level` was previously meaningful; now hard-coded to `0`.

---

### POST `/api/VerifyLogin`

| Property | Value |
|---|---|
| **Auth** | None |
| **Rate Limit** | `auth-sensitive` |

#### Purpose

Re-verifies a stored JWT token. Used by the Xamarin client on app restart to confirm a previously saved token is still valid.

#### Request — `TextRequest`

```json
{
  "text": "eyJhbGciOi..."
}
```

#### Response — `AuthResponse`

Same shape as the `Login` response.

---

### POST `/api/RefreshToken`

| Property | Value |
|---|---|
| **Auth** | None |
| **Rate Limit** | `auth-sensitive` |

#### Purpose

Exchanges a refresh token for a new JWT + refresh token pair.

#### Request — `RefreshTokenRequest`

```json
{
  "refreshToken": "guid-string"
}
```

#### Response — `AuthResponse`

Same shape as the `Login` response.

---

### POST `/api/RequestPasswordReset`

| Property | Value |
|---|---|
| **Auth** | None |
| **Rate Limit** | `auth-sensitive` |

#### Purpose

Initiates a password-reset flow by sending a reset link/code to the user's email.

#### Request — `PasswordResetRequest`

Contains the user's email address.

#### Response — `ResponseObject`

```json
{
  "success": true,
  "status": 1,
  "message": "...",
  "errorMessage": null
}
```

---

### POST `/api/ConfirmPasswordReset`

| Property | Value |
|---|---|
| **Auth** | None |
| **Rate Limit** | `auth-sensitive` |

#### Purpose

Completes the password-reset flow by accepting the reset token and new password.

#### Request — `PasswordResetConfirmRequest`

Contains the reset token and the new password.

#### Response — `ResponseObject`

---

### POST `/api/VerifyEmail`

| Property | Value |
|---|---|
| **Auth** | None |
| **Rate Limit** | — |

#### Purpose

Verifies a user's email address using a verification token.

#### Request — `EmailVerificationRequest`

```json
{
  "userId": "guid-string",
  "token": "verification-token"
}
```

#### Response — `ResponseObject`

---

### POST `/api/ResendEmailVerification`

| Property | Value |
|---|---|
| **Auth** | **[Authorize]** — Bearer JWT required |
| **Rate Limit** | — |

#### Purpose

Resends the email-verification message for the authenticated user.

#### Request

No body required beyond the base `RequestObject`.

#### Response — `ResponseObject`

---

### GET `/api/Me`

| Property | Value |
|---|---|
| **Auth** | **[Authorize]** — Bearer JWT required |
| **Rate Limit** | — |

#### Purpose

Returns the current authenticated user's profile data.

#### Response — `AuthResponse`

Same shape as the `Login` response.

---

### POST `/api/Logout`

| Property | Value |
|---|---|
| **Auth** | **[Authorize]** — Bearer JWT required |
| **Rate Limit** | — |

#### Purpose

Invalidates the current session / refresh token.

#### Response — `ResponseObject`

---

## Security Notes

- All unauthenticated endpoints are protected by the `auth-sensitive` rate-limiting policy to mitigate brute-force and credential-stuffing attacks.
- Passwords are transmitted in plain text over HTTPS; the server hashes them before storage.
- JWT tokens should be treated as short-lived; use `RefreshToken` for renewal.
- The `VerifyLogin` endpoint effectively allows token introspection — ensure it is not abused for token enumeration.

## Versioning

- Route aliases (`/api/Authentication/*` vs `/api/*`) exist for backward compatibility with the legacy Xamarin client.
- The `/GameEngine/*` prefix is rewritten to `/api/*` at the nginx level.

## Potential Pitfalls

- `login` and `email` are interchangeable on the request side — both must be checked during validation.
- `teamName` and `managerName` aliasing can cause confusion; the canonical field is `managerName`.
- `level` is always `0` — do not rely on it for business logic.
- Guest registration (`isGuest: true`) auto-generates credentials that are returned in the response — these must be stored client-side or the account is irrecoverable.
