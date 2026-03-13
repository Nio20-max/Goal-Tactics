# Chat API — ChatController

> **Source:** `src/GoalTactics.Api/Controllers/ChatController.cs`
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

### POST `/api/GetChatHistory`

#### Purpose

Retrieves recent chat message history for the user's chat channel(s).

#### Request — `RequestObject`

Standard base request object.

#### Response — `ChatHistoryResponse`

Contains an array of recent chat messages with sender info, timestamps, and message content.

---

### POST `/api/PostChatMessage`

| Property | Value |
|---|---|
| **Rate Limit** | `chat-write` |

#### Purpose

Sends a chat message to the user's chat channel.

#### Request — `ChatPostRequest`

```json
{
  "message": "Hello everyone!",
  "channel": "league-chat"
}
```

| Field | Type | Notes |
|---|---|---|
| `message` | `string` | The chat message text. |
| `channel` | `string` | Target chat channel identifier. |

#### Response — `ResponseObject`

---

### POST `/api/Post`

| Property | Value |
|---|---|
| **Rate Limit** | `chat-write` |

#### Purpose

**Alias for `PostChatMessage`.** Sends a chat message to the user's chat channel.

#### Request — `ChatPostRequest`

Same as `PostChatMessage`.

#### Response — `ResponseObject`

---

### POST `/api/Typing`

| Property | Value |
|---|---|
| **Rate Limit** | `chat-write` |

#### Purpose

Notifies other users in the chat channel that the authenticated user is typing. Used for "user is typing…" indicators.

#### Request — `RequestObject`

Standard base request object.

#### Response — `ResponseObject`

---

## Real-Time Integration

The REST chat endpoints are supplemented by the **ChatHub** SignalR hub (see `realtime_hubs.md`). The typical flow is:

1. Client calls `GetChatHistory` to load recent messages on screen entry.
2. Client connects to the `/chat` SignalR hub for real-time message push.
3. Client calls `PostChatMessage` (or `Post`) to send messages.
4. Client calls `Typing` to broadcast typing indicators.

New messages are pushed to connected clients via SignalR; the REST endpoint is the write path.

---

## Security Notes

- All endpoints require `[Authorize]`.
- All write endpoints (`PostChatMessage`, `Post`, `Typing`) are rate-limited under the `chat-write` policy to prevent spam and abuse.
- Chat messages should be sanitised for XSS and profanity before storage/broadcast.
- The `Typing` endpoint is rate-limited to prevent flooding the typing indicator.

## Versioning

- `/api/Post` is a short alias for `/api/PostChatMessage`, maintained for legacy client compatibility.

## Potential Pitfalls

- `PostChatMessage` and `Post` are identical — ensure both routes are tested.
- `Typing` indicators are fire-and-forget from the client perspective; the response is not used.
- Chat history is not paginated in the current implementation — very active channels could return large payloads.
- The `chat-write` rate limit applies to all three write endpoints collectively — a user spamming `Typing` could exhaust their write budget.
