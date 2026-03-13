# Common API — CommonController

> **Source:** `src/GoalTactics.Api/Controllers/CommonController.cs`
> **Route prefix:** `api`

---

## Global Notes

- All requests use **HTTP POST** with `Content-Type: application/json` (legacy Xamarin design), except where noted as GET.
- Base `RequestObject` has legacy fields: `signature`, `token`, `locale`, `utcOffset`, `culture`, `platform` — accepted but ignored.
- Base `ResponseObject` has: `success`, `message`, `status` (1 = OK / 2 = Error), `errorMessage`, `punishment`.
- Authentication via **Bearer JWT** in the `Authorization` header.
- Legacy Xamarin client also sends the token in the request body and as a query param `?access_token=`.
- Legacy routes existed at `/GameEngine/*` (nginx rewrites to `/api/`).
- The Xamarin client (v1.2.4) uses both old `/GameEngine/*` and new `/api/*` URL patterns.

---

## Authentication

**None of the endpoints in this controller require authentication.**

---

## Endpoints

### GET `/api/Ping`

#### Purpose

Health-check endpoint. Returns a simple "pong" response.

#### Request

No body. Standard HTTP GET.

#### Response — `ResponseObject`

```json
{
  "success": true,
  "status": 1,
  "message": "pong"
}
```

---

### GET `/api/GetVersion`

#### Purpose

Returns the current API version string.

#### Request

No body. Standard HTTP GET.

#### Response — `string`

```
"1.0"
```

Returns a plain string, not wrapped in a `ResponseObject`.

---

### POST `/api/GetCurrentAppVersion`

#### Purpose

Returns the current expected client application version. Used by the Xamarin client to check if a forced update is required.

#### Request — `RequestObject`

Standard base request object (legacy fields accepted but ignored).

#### Response — `string`

Returns a version string (e.g., `"1.2.4"`).

---

### POST `/api/GetCountries`

#### Purpose

Returns the list of available countries for team registration and player origins.

#### Request — `RequestObject`

Standard base request object.

#### Response — `CountriesResponse`

```json
{
  "success": true,
  "status": 1,
  "countries": [
    {
      "id": 1,
      "name": "Germany",
      "isoCode": "DE",
      "short": "GER"
    },
    {
      "id": 2,
      "name": "United Kingdom",
      "isoCode": "GB",
      "short": "ENG"
    }
  ]
}
```

| Field | Type | Notes |
|---|---|---|
| `id` | `int` | Unique country identifier used in registration. |
| `name` | `string` | Full country name. |
| `isoCode` | `string` | ISO 3166-1 alpha-2 code. |
| `short` | `string` | Short display code (3 letters). |

---

### POST `/api/GetSeasonInfo`

#### Purpose

Returns metadata about the current in-game season including timing information for matchday scheduling.

#### Request — `RequestObject`

Standard base request object.

#### Response — `TextResponse`

The `text` field contains a **JSON-encoded string** (double-serialised) that must be parsed by the client:

```json
{
  "success": true,
  "status": 1,
  "text": "{\"seasonNumber\":3,\"seasonStart\":\"2024-01-01T00:00:00Z\",\"seasonEnd\":\"2024-06-30T23:59:59Z\",\"matchdayDuration\":\"1.00:00:00\"}"
}
```

Parsed inner JSON:

```json
{
  "seasonNumber": 3,
  "seasonStart": "2024-01-01T00:00:00Z",
  "seasonEnd": "2024-06-30T23:59:59Z",
  "matchdayDuration": "1.00:00:00"
}
```

| Field | Type | Notes |
|---|---|---|
| `seasonNumber` | `int` | Current season number. |
| `seasonStart` | `datetime` | ISO 8601 UTC start of the season. |
| `seasonEnd` | `datetime` | ISO 8601 UTC end of the season. |
| `matchdayDuration` | `timespan` | Duration of each matchday (e.g., `"1.00:00:00"` = 1 day). |

---

## Security Notes

- No authentication required on any endpoint — these are public utility endpoints.
- `GetCountries` and `GetSeasonInfo` return static/semi-static data suitable for aggressive caching.
- No rate limiting is explicitly configured on these endpoints.

## Versioning

- `GetVersion` returns a hard-coded `"1.0"` — this is the API version, not the app version.
- `GetCurrentAppVersion` returns the expected client version for update-gate checks.

## Potential Pitfalls

- `GetSeasonInfo` returns double-serialised JSON (a JSON string inside a `TextResponse`). The Xamarin client manually parses the inner string — this is a common source of bugs if the inner format changes.
- `GetVersion` and `GetCurrentAppVersion` return raw strings, not wrapped in the standard `ResponseObject` envelope. Client code must handle this difference.
- `Ping` is the standard health-check target for load balancers and monitoring.
