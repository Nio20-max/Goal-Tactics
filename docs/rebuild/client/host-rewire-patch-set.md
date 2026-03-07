# Host Rewire Patch Set (Phase 3)

Target host:
- `https://gt.nikolai-linschmann.de`

This patch set describes the exact source edits required in the recovered client code paths.

## URL helper

### Before
- `ProdUrl = "https://engine.goaltactics.de/GameEngine/"`
- `BaseServiceUrl` used by active services.

### After
- `NewBackendUrl = "https://gt.nikolai-linschmann.de"`
- Active services use `NewBackendUrl + "api/"`.
- Legacy `BaseServiceUrl` only allowed for dead code paths pending deletion.

## Base service layer

### Before
- `BaseService<T>.GenerateApi(URLHelper.BaseServiceUrl + ServiceName)`
- legacy signed envelope path for active calls.

### After
- Active registration path uses `RestService.For<T>(URLHelper.NewBackendUrl + "api/" + ServiceName, ...)`.
- Remove signing envelope dependency from migrated services.

## Realtime wiring

### Auction
- Hub URL: `URLHelper.NewBackendUrl + "/auc"`
- Keep `Bidded` event subscription.

### Chat
- Hub URL: `URLHelper.NewBackendUrl + "/chat"`
- Keep `Typing` and `Post` subscriptions.

## Headers and auth
- Keep `x-goaltactics-version` and `x-goaltactics-capabilities`.
- Ensure bearer token is attached to API calls and hub connections.

## Safety checks
- Search gate before release:
- No runtime service points to `engine.goaltactics.de/GameEngine`.
- No migrated flow calls legacy `Json*` service wrappers.

## Verification commands
- `grep -R "GameEngine" <client-source-root>` should return no active runtime references.
- `grep -R "gt.nikolai-linschmann.de" <client-source-root>` should show URL helper and environment setup points.
