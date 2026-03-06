# Auction Hub Spec (Phase 0)

## Phase 0 Step Log
1. Confirmed auction hub path and event names from recovered docs.
2. Verified bid update consumption pattern in decompiled `AuctionViewModel`.
3. Added event-order and reconnect guarantees required for consistency.

## Exact from client/docs
- Hub path: `/auc`.
- Client subscription:
  - `Bidded(JsonRealtimeBid payload)`
- HTTP companion endpoints:
  - `POST /api/PlaceBid`
  - `POST /api/GetDetails`
  - `POST /api/Search`
  - favorites endpoints.

## Exact from decompiled logic
- Client updates in-memory bid values from realtime payload and recomputes `CanMakeBid` as:
  - `money >= currentBid + bidIncrement`.
- Client treats frozen auction state as short timer state and non-frozen by `EndDate` countdown.

## Behavior contract to implement
- Authenticate users with JWT.
- Emit `Bidded` only after accepted bid transaction commits.
- Include at minimum: auction id, bid team id/name/logo, bid value, bid increment, end date.
- Guarantee monotonic bid sequence per auction.
- On reconnect, client can recover by calling details endpoint; hub does not need full replay stream if snapshot endpoint is reliable.
- Settlement event handling must avoid duplicate winner assignment.

## Fallback model selected after testing
- Bid increment server formula remains partially unknown; current evidence supports a capped behavior near 150,000 after high bid thresholds. Candidate models required in transfer-market mechanics file.
