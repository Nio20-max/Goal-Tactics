# Realtime Reconnection Plan (Phase 3)

Target hubs:
- `wss://gt.nikolai-linschmann.de/chat`
- `wss://gt.nikolai-linschmann.de/auc`

## Goals
- Keep chat and auction state fresh after app resume, network switches, and token refresh.
- Avoid duplicate subscriptions and stale event handlers.
- Preserve clear user-visible connection status.

## Connection lifecycle

### Startup
- Load JWT token from secure storage.
- Create hub connections with bearer auth.
- Register handlers before `StartAsync`.
- Start chat and auction hubs lazily when their screens become active.

### Resume and reconnect
- On app resume:
- if disconnected, reconnect with exponential backoff (1s, 2s, 5s, 10s, 20s, max 30s).
- after reconnect:
- chat: call `/api/GetChatHistory` to close missed message gaps.
- auction: refresh current watched listings and details via `/api/GetTransferDetails` and search route.

### Token refresh
- If auth token changes:
- stop hubs,
- recreate connection with new token provider,
- resubscribe handlers,
- reconnect.

### Logout/account switch
- Explicitly stop hubs.
- Clear handler registrations and connection references.
- Clear pending reconnect timers.

## Event subscriptions

### Chat hub (`/chat`)
- `Typing(Guid, string)`
- `Post(Guid, ChatMessage)`

### Auction hub (`/auc`)
- `Bidded(JsonRealtimeBid)`

## UI state model
- `Connecting`
- `Connected`
- `Reconnecting`
- `StaleData`
- `Offline`

Rules:
- Show `StaleData` if reconnect succeeds but snapshot refresh fails.
- Keep send/bid actions disabled while disconnected.
- Present a small non-blocking banner while reconnecting.

## Reliability guards
- Debounce reconnect triggers to prevent connection storms.
- Cap retries and fall back to manual retry button after prolonged failure.
- Log hub close reason and reconnect attempt count.

## Telemetry
- Track:
- connection open/close counts
- reconnect success rate
- average reconnect duration
- post-reconnect snapshot latency

## Validation checklist
- Resume app while online: hubs reconnect and snapshots refresh.
- Resume app after network loss: hubs reconnect after network returns.
- Token expiration: hubs reconnect after reauth.
- Logout/login as another user: no stale events from previous account.
