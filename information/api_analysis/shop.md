# Shop API — ShopController

> **Source:** `src/GoalTactics.Api/Controllers/ShopController.cs`
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

### POST `/api/GetProducts`

#### Purpose

Returns the list of available in-app purchase (IAP) products.

#### Request — `RequestObject`

Standard base request object.

#### Response — `ShopProductsResponse`

Contains product definitions including IDs, names, descriptions, and prices. These map to platform-specific IAP product identifiers (App Store / Google Play).

---

### POST `/api/GetEquipment`

#### Purpose

Returns the full equipment catalog available for purchase with in-game or premium currency.

#### Request — `RequestObject`

Standard base request object.

#### Response — `ShopEquipmentResponse`

Approximate payload size: **~34KB**.

Contains all available equipment items (heads, bodies, gloves, shoes, shirts) that can be applied to players.

#### Xamarin Client Notes

**⚠️ The Xamarin client calls this endpoint 3 TIMES on shop screen load.** This appears to be a client-side bug where multiple view models independently request the equipment catalog. The response is ~34KB each time, resulting in ~102KB of redundant data transfer on every shop visit.

---

### POST `/api/VerifyPurchase`

#### Purpose

Verifies a platform-specific in-app purchase receipt and grants the purchased items/currency.

#### Request — `ShopPurchaseVerifyRequest`

```json
{
  "platform": "ios",
  "productIdentifier": "com.goaltactics.premium100",
  "purchaseToken": "receipt-or-token-string"
}
```

| Field | Type | Notes |
|---|---|---|
| `platform` | `string` | Platform identifier (`"ios"`, `"android"`). |
| `productIdentifier` | `string` | Platform-specific product ID. |
| `purchaseToken` | `string` | Purchase receipt/token from the platform's billing API. |

#### Response — `ResponseObject`

---

### POST `/api/BuyProduct`

#### Purpose

Purchases a product using in-game or premium currency (not IAP — this is for virtual-currency purchases).

#### Request — `IdRequest`

```json
{
  "id": "product-guid"
}
```

#### Response — `ResponseObject`

---

### POST `/api/UseEquipment`

#### Purpose

Equips an owned equipment item on a player.

#### Request — `IdRequest`

```json
{
  "id": "equipment-guid"
}
```

#### Response — `ResponseObject`

---

### POST `/api/WatchAd`

| Property | Value |
|---|---|
| **Alias** | `/api/ClaimAdReward` |

#### Purpose

Claims a reward for watching an advertisement. The client signals that the ad was viewed, and the server grants the reward.

#### Request — `RequestObject`

Standard base request object.

#### Response — `ResponseObject`

---

## Security Notes

- All endpoints require `[Authorize]`.
- **`VerifyPurchase` is a critical security endpoint:**
  - Must validate the purchase receipt with Apple/Google servers before granting items.
  - Must prevent receipt replay attacks (same receipt used multiple times).
  - Must validate the `productIdentifier` matches the receipt.
  - Must handle platform-specific receipt formats correctly.
- `BuyProduct` must validate sufficient in-game/premium currency balance.
- `WatchAd` / `ClaimAdReward` should be rate-limited and validated server-side — the client's claim of "ad watched" should be verified if possible (e.g., via ad network callbacks).

## Versioning

- `WatchAd` ↔ `ClaimAdReward` are aliases for backward compatibility.

## Potential Pitfalls

- **`GetEquipment` is called 3 times per shop screen load** by the Xamarin client — this is a known inefficiency. The ~34KB response × 3 calls = ~102KB of redundant transfer. Consider:
  - Server-side response caching.
  - Client-side fix to deduplicate the calls.
  - ETags / conditional requests.
- `VerifyPurchase` handles both iOS and Android receipt formats — these are fundamentally different:
  - iOS: App Store receipt (base64 encoded).
  - Android: Google Play purchase token + product ID.
- The `WatchAd` endpoint trusts the client to report ad completion — without server-side verification, this is exploitable.
- Equipment items affect player stats — `UseEquipment` changes game state and should be validated for item ownership.
- `GetProducts` returns IAP product definitions; actual prices come from the platform stores. Ensure product IDs are kept in sync with store configurations.
