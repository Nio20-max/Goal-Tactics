# Real-Time Hubs — SignalR

> **Source:** SignalR Hub implementations in `src/GoalTactics.Api/`

---

## Global Notes

- All requests use **HTTP POST** with `Content-Type: application/json` (legacy Xamarin design) for REST endpoints.
- Base `RequestObject` has legacy fields: `signature`, `token`, `locale`, `utcOffset`, `culture`, `platform` — accepted but ignored.
- Base `ResponseObject` has: `success`, `message`, `status` (1 = OK / 2 = Error), `errorMessage`, `punishment`.
- Authentication via **Bearer JWT** in the `Authorization` header.
- Legacy Xamarin client also sends the token in the request body and as a query param `?access_token=`.
- Legacy routes existed at `/GameEngine/*` (nginx rewrites to `/api/`).
- The Xamarin client (v1.2.4) uses both old `/GameEngine/*` and new `/api/*` URL patterns.

---

## Overview

The application uses **ASP.NET Core SignalR** for real-time bidirectional communication. Two hubs are configured:

| Hub | Path | Purpose |
|---|---|---|
| **ChatHub** | `/chat` | Real-time chat messaging |
| **AuctionHub** | `/auc` | Real-time transfer market bid updates |

Both hubs require authentication and have common filters applied.

---

## ChatHub — `/chat`

### Authentication

**Required.** The SignalR connection must be authenticated via a Bearer JWT token. The token can be provided:
- In the `Authorization` header during the initial HTTP handshake.
- As a query parameter `?access_token=<token>` (for WebSocket transport compatibility).

### Filters

| Filter | Purpose |
|---|---|
| `AuthHubFilter` | Validates the JWT token and extracts user identity. |
| `RateLimitHubFilter` | Applies rate limiting to hub method invocations. |

### Purpose

Provides real-time chat functionality including:
- **Receiving messages:** The server pushes new chat messages to connected clients.
- **Typing indicators:** The server broadcasts "user is typing" notifications.
- **Presence:** Connection/disconnection events can be used for online status.

### Integration with REST

The ChatHub works alongside the REST `ChatController` endpoints:
- `GetChatHistory` (REST) — loads initial message history.
- `PostChatMessage` / `Post` (REST) — sends messages (write path).
- `Typing` (REST) — sends typing indicators.
- **ChatHub** (SignalR) — receives real-time message pushes and typing indicators.

### Connection Flow

1. Client authenticates via `/api/Login` and obtains a JWT token.
2. Client establishes a SignalR connection to `/chat` with the token.
3. Client receives real-time message and typing events via the hub.
4. Client sends messages via the REST `PostChatMessage` endpoint (not via SignalR).

---

## AuctionHub — `/auc`

### Authentication

**Required.** Same authentication mechanism as ChatHub.

### Filters

| Filter | Purpose |
|---|---|
| `AuthHubFilter` | Validates the JWT token and extracts user identity. |
| `RateLimitHubFilter` | Applies rate limiting to hub method invocations. |

### Purpose

Provides real-time transfer market updates including:
- **Bid notifications:** When a new bid is placed on a watched player, all connected watchers receive the update.
- **Auction completion:** Notifies clients when an auction ends and the winner is determined.
- **Outbid alerts:** Notifies a user when they have been outbid.

### Integration with REST

The AuctionHub works alongside the REST `TransferMarketController` endpoints:
- `SearchTransfermarket` (REST) — searches for players.
- `GetTransferDetails` (REST) — loads transfer details.
- `BidPlayer` / `PlaceBid` (REST) — places a bid (write path).
- **AuctionHub** (SignalR) — receives real-time bid updates and auction events.

### Connection Flow

1. Client authenticates via `/api/Login` and obtains a JWT token.
2. Client establishes a SignalR connection to `/auc` with the token.
3. Client subscribes to specific transfer listings by joining groups.
4. Client receives real-time bid updates via the hub.
5. Client places bids via the REST `BidPlayer` endpoint (not via SignalR).

---

## Common Hub Infrastructure

### Hub Filters

Both hubs share the same filter pipeline:

#### `AuthHubFilter`

- Validates the JWT token on every hub method invocation.
- Extracts the user identity (user ID, team ID, etc.) from the token claims.
- Rejects unauthenticated or expired-token invocations.

#### `RateLimitHubFilter`

- Applies per-user rate limiting to hub method invocations.
- Prevents flooding/abuse of real-time channels.
- Rate limits are configured separately from REST endpoint limits.

### Transport

SignalR supports multiple transports with automatic fallback:
1. **WebSockets** (preferred) — full-duplex, lowest latency.
2. **Server-Sent Events (SSE)** — server-to-client only, with REST for client-to-server.
3. **Long Polling** — fallback for environments that don't support WebSockets/SSE.

The Xamarin client typically uses WebSockets when available.

### Token Delivery for WebSocket Transport

WebSocket connections cannot send custom HTTP headers after the initial handshake. For WebSocket transport, the JWT token is delivered as a query parameter:

```
wss://server/chat?access_token=eyJhbGciOi...
```

This is a standard SignalR pattern and is handled automatically by the SignalR client library.

---

## Security Notes

- Both hubs require authenticated connections.
- `AuthHubFilter` runs on every method invocation, not just connection establishment — this prevents use of expired tokens.
- `RateLimitHubFilter` prevents real-time channel abuse.
- The `?access_token=` query parameter is logged in server access logs — ensure logs are treated as sensitive data.
- WebSocket connections are long-lived — token expiration must be handled gracefully (disconnect + reconnect with new token).

## Potential Pitfalls

- **Token in query string:** The `?access_token=` parameter may appear in server logs, proxy logs, and browser history. This is an inherent SignalR/WebSocket limitation.
- **Connection lifecycle:** SignalR connections can drop and reconnect. Clients must handle reconnection gracefully and re-subscribe to groups.
- **Hub filters run per-invocation:** Unlike REST middleware that runs per-request, hub filters run on every method call. This adds overhead but provides stronger security.
- **No direct hub writes from client:** The current architecture uses REST endpoints for writes (sending messages, placing bids) and SignalR for receiving real-time updates. This simplifies the server-side logic but means write operations have REST latency, not WebSocket latency.
- **Scaling considerations:** SignalR hubs maintain in-memory connection state. For multi-server deployments, a SignalR backplane (Redis, Azure SignalR Service) is required for cross-server message delivery.
