# Transfer Market API — TransferMarketController

> **Source:** `src/GoalTactics.Api/Controllers/TransferMarketController.cs`
> **Route prefixes:** `api`, `api/Transfermarket`

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

### POST `/api/SearchTransfermarket`

| Property | Value |
|---|---|
| **Alias** | `/api/Transfermarket/Search` |

#### Purpose

Searches the transfer market for players matching the given criteria.

#### Request — `TransferSearchRequest`

```json
{
  "talent": {
    "min": 5,
    "max": 10
  },
  "skillIndex": 3,
  "minimumBid": 100000,
  "strength": 60.0,
  "onlyKeeper": false
}
```

| Field | Type | Notes |
|---|---|---|
| `talent.min` | `int` | Minimum talent rating (1–10). |
| `talent.max` | `int` | Maximum talent rating (1–10). |
| `skillIndex` | `int` | Specific skill index to sort/filter by (0–13). |
| `minimumBid` | `decimal` | Minimum current bid to filter by. |
| `strength` | `float` | Minimum overall strength. |
| `onlyKeeper` | `bool` | If `true`, only return goalkeepers. |

#### Response — `TransferSearchResponse`

Contains a list of players currently on the transfer market matching the search criteria, with their current bid amounts and auction end times.

---

### POST `/api/GetTransferDetails`

| Property | Value |
|---|---|
| **Alias** | `/api/Transfermarket/GetDetails` |

#### Purpose

Returns detailed information about a specific transfer listing including bid history.

#### Request — `TransferDetailsRequest`

```json
{
  "transferId": "transfer-guid"
}
```

#### Response — `TransferDetailsResponse`

Contains full player details, current bid, bid history, auction end time, and seller information.

---

### POST `/api/BidPlayer`

| Property | Value |
|---|---|
| **Alias** | `/api/Transfermarket/PlaceBid` |
| **Rate Limit** | `mutation-write` |

#### Purpose

Places a bid on a player listed on the transfer market.

#### Request — `BidRequest`

```json
{
  "id": "transfer-guid",
  "bid": 500000
}
```

| Field | Type | Notes |
|---|---|---|
| `id` | `string` | Transfer listing identifier. |
| `bid` | `decimal` | Bid amount (must exceed current highest bid). |

#### Response — `ResponseObject`

---

### POST `/api/UpdateTransfermarketFavourites`

| Property | Value |
|---|---|
| **Rate Limit** | `mutation-write` |

#### Purpose

Toggles a transfer listing as a favourite (adds or removes from the user's watched list).

#### Request — `IdRequest`

```json
{
  "id": "transfer-guid"
}
```

#### Response — `ResponseObject`

---

### POST `/api/GetTransfermarketFavourites`

#### Purpose

Returns the user's favourited/watched transfer listings.

#### Request — `RequestObject`

#### Response — `TransferSearchResponse`

Same format as the search results — returns only the user's favourited listings.

---

### POST `/api/SellPlayer`

| Property | Value |
|---|---|
| **Alias** | `/api/Transfermarket/ListPlayer` |
| **Rate Limit** | `mutation-write` |

#### Purpose

Lists a player from the user's squad on the transfer market for auction.

#### Request — `SellPlayerRequest`

```json
{
  "playerId": "player-guid",
  "startingBid": 200000
}
```

#### Response — `ResponseObject`

---

## Real-Time Integration

The transfer market is supplemented by the **AuctionHub** SignalR hub (see `realtime_hubs.md`) at `/auc`. Bid updates are broadcast in real-time to connected clients watching a transfer listing.

---

## Security Notes

- All endpoints require `[Authorize]`.
- `BidPlayer` and `SellPlayer` are rate-limited under `mutation-write` to prevent bid manipulation and market flooding.
- `BidPlayer` must validate:
  - The bid exceeds the current highest bid.
  - The user has sufficient funds.
  - The auction has not ended.
  - The user is not bidding on their own player.
- `SellPlayer` must validate the player belongs to the authenticated user and is not already listed.
- `UpdateTransfermarketFavourites` is rate-limited to prevent abuse.

## Versioning

- Dual route prefixes (`/api/*` and `/api/Transfermarket/*`) for backward compatibility.
- Note the British spelling: `Favourites` (not `Favorites`).
- Note the German-influenced spelling: `Transfermarket` (not `TransferMarket`) in the route prefix.

## Potential Pitfalls

- **`SellPlayer` exists in both SquadController and TransferMarketController** — the SquadController version may route to the same logic but they are separate endpoints. Ensure consistency.
- The `skillIndex` in search maps to the same 14-skill array as in `SquadResponse` — the index meaning must be consistent.
- Transfer auctions have time-limited windows — `BidPlayer` calls after auction end should be gracefully rejected.
- The `mutation-write` rate limit is shared across all mutation endpoints — heavy bidding activity could impact other write operations.
- The AuctionHub provides real-time updates, but the REST endpoints are the source of truth for bids.
