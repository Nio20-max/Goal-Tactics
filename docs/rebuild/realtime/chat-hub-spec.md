# Chat Hub Spec (Phase 0)

## Phase 0 Step Log
1. Confirmed hub path and event names from recovered contract docs.
2. Cross-checked decompiled code for chat API/hub usage.
3. Added production rules for replay, moderation, and bot participation.

## Exact from client/docs
- Hub path: `/chat`.
- Client subscriptions:
  - `Typing(Guid userId, string message)`
  - `Post(Guid userId, ChatMessage payload)`
- HTTP companion endpoints:
  - `POST /api/Typing`
  - `POST /api/Post`
  - `POST /api/GetChatHistory`

## Exact from decompiled logic
- Chat is integrated with token-authenticated service layer and common response envelopes.

## Behavior contract to implement
- Authentication: JWT required for connect and send.
- Presence: user connection registry keyed by user id and connection id.
- Typing throttling: minimum interval per user to avoid spam.
- Message persistence: persist first, then broadcast.
- History retrieval: API-driven, bounded by page size and retention policy.
- Moderation: apply profanity/spam filters to both human and bot messages.
- Reconnect: on reconnect, client must be able to call history and recover missing messages.

## Bot policy
- Bots participate in public chat.
- Bots must use template-constrained text and same moderation limits as humans.

## Fallback model selected after testing
- None for transport/events.
- Chat content generation behavior for bots will be tuned with simulation tests.
