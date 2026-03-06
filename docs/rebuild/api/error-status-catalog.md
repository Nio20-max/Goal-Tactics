# Error And Status Catalog (Phase 0)

## Phase 0 Step Log
1. Extracted status/error envelope behavior from response base classes.
2. Reviewed viewmodel branches where responses are interpreted.
3. Defined backend error taxonomy for stable client behavior.

## Exact from client/docs
- Response envelope uses `ResponseObject.Status` and `ResponseObject.ErrorMessage`.
- Client frequently checks `Status == OK`; otherwise shows `ErrorMessage` in popup.
- Some flows consume `Resolution` (contracts) for user-readable explanations.

## Exact from decompiled logic
Observed handling patterns:
- Bidding flow shows `ErrorMessage` directly when bid placement fails.
- Contract flow uses `Resolution` string if no contract options are returned.
- Delete account flow requires status success and may stop silently on failure.

## Server status contract to freeze
Recommended enum mapping:
- `OK`
- `FailedValidation`
- `Unauthorized`
- `Forbidden`
- `NotFound`
- `Conflict`
- `RateLimited`
- `Maintenance`
- `ServerError`

## Fallback model selected after testing
- None. This is a deterministic API behavior contract.

## Backend policy note
- Every failed write route must emit a meaningful `ErrorMessage` safe for end users.
- All economy failures must include precise reason (`insufficient stars`, `insufficient money`, `auction closed`, `lineup locked`, `contract unavailable`).
