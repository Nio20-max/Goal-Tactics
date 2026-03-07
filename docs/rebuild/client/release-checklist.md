# Client Release Checklist (Phase 3)

## Environment and routing
- [x] API base configured to `https://gt.nikolai-linschmann.de/api/` (validated 2026-03-07)
- [x] Chat hub configured to `wss://gt.nikolai-linschmann.de/chat` (validated route/auth challenge 2026-03-07)
- [x] Auction hub configured to `wss://gt.nikolai-linschmann.de/auc` (validated route/auth challenge 2026-03-07)
- [ ] No active `/GameEngine/*` runtime dependency remains (compat mode intentionally still supports legacy routes)

## Backend alignment
- [x] Backend environment points to production deployment (`gt.nikolai-linschmann.de`)
- [ ] `/chat` and `/auc` hubs reachable from mobile network (public probes pass; mobile runtime verification pending)
- [ ] Auth token renewal works across API and hubs (requires authenticated on-device run)

## Firebase and billing
- [ ] Correct `google-services.json` for release environment
- [ ] Correct billing product ids configured
- [ ] Test purchase verification succeeds against rebuilt backend

## Signing and versioning
- [ ] Correct keystore and alias selected
- [ ] `versionCode` bumped
- [ ] `versionName` bumped
- [ ] Release signing passwords supplied securely

## Functional smoke tests
- [ ] Login/register/session restore (device/emulator pending)
- [ ] Team overview/resources/mail
- [ ] Lineup fetch/edit/save and lock display
- [ ] League table, fixtures, match details
- [ ] Squad actions (rename/shirt/origin/heal/contract/upgrade/skill)
- [ ] Training (team/tactic/individual/camps)
- [ ] Scouting (standard/premium/speedup/recruit)
- [ ] Stadium actions (build/build places/grass/speedup/rename)
- [ ] Sponsor negotiation and acceptance
- [ ] Transfer search/details/favorites/bid/live updates
- [ ] Chat history/post/typing/reconnect
- [ ] Daily reward, preferences, support user info
- [ ] Account update and delete flow

## Artifacts
- [ ] Debug APK produced
- [ ] Release APK or AAB produced
- [ ] Symbols/mapping artifacts archived

## Signoff
- [ ] Core gameplay smoke-test approved
- [ ] Realtime reconnect behavior approved
- [ ] Monetization flow approved
