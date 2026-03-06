# Frontend Rebuild Analysis (Very Detailed)

This document is a reconstruction blueprint for rebuilding the Goal Tactics frontend without running the original app. It assumes all image assets are available.

## 1. Product-Level Frontend Model

Goal Tactics frontend is a management UI, not a live player-control football UI.

- User behavior is menu-driven and form-driven.
- Most interactions are read state, adjust configuration, confirm action.
- The app is timer-rich and server-state-driven.
- Main architecture pattern is shell navigation + domain screens + modal confirmations.
- The visual loop is: dashboard check, decision, action, wait, update.

## 2. Global Navigation Information Architecture

The app should be rebuilt as a persistent shell with section navigation and many deep subpages.

Primary sections to implement:

- Club
- Finances
- Stadium
- Squad
- Lineup
- Training
- Scouting
- Transfer Market
- League
- GT Ladder
- Friends
- Chat
- Live
- Shop
- Support

Recommended rebuild shell:

- Root screen: tab bar or segmented top navigation with notification badges.
- Secondary navigation: per-section list/header tabs.
- Modal layer: all paid/risky actions are confirmation dialogs.
- Inbox/toast layer: system messages and event reminders.

## 3. Core UI Patterns Used Everywhere

These reusable components are required because they appear across nearly all features.

- Currency bar component with Money and Stars.
- Countdown/timer component (`HH:MM:SS`) for builds, trainings, auctions.
- Card list row with title, subtitle, stats, CTA button.
- Confirm dialog with positive and cancel choices.
- Locked-state overlay for unavailable actions.
- Status chip component: active, expired, complete, pending.
- Empty-state component for no records (`NoFinance`, `NoFinanceHistory`, etc.).
- Badge/counter component for unread mail, pending bids, challenges.

## 4. Shared Interaction Rules

Implement these behavioral rules globally.

- Every action that spends Stars needs explicit confirmation.
- Every destructive action (fire player, delete mail, cancel camp) needs explicit confirmation.
- If server says lineup is locked, all lineup editing controls become read-only.
- If a timer is active, action button label changes to progress state.
- If an action is impossible due to prerequisites, show requirement text, not generic error.
- If backend state changed while user is on screen, screen refreshes without app restart.

## 5. Club Section Rebuild Spec

Screens:

- Club overview
- Accomplishments
- Mail/Inbox
- Sponsor summary
- Rename team and rename stadium controls

Main components:

- Club profile card with team name, manager name, league info.
- Accomplishment list with unlocked/locked visual state.
- Inbox list grouped by unread/read state.
- Sponsor panel with current contract and expiration timer.

Key interactions:

- Rename flows open text input modal, validate, submit, refresh title in shell.
- Mail interactions support mark one read, mark all read, delete one, delete read.

## 6. Finances Section Rebuild Spec

Screens:

- Finances overview
- Finance history timeline

Main components:

- Current balance summary.
- Income/expense grouped list.
- Period filter (daily windows are relevant in game notes).
- Empty-state text when history not available.

Display categories to include:

- Audience earnings
n- Goal bonus
- Win bonus
- Championship bonus
- Running costs

Critical behavior:

- Numbers are rendered as absolute and trend-friendly (positive/negative visual coding).
- History must remain scrollable and stable as new entries arrive.

## 7. Stadium And Building Section Rebuild Spec

Screens:

- Stadium overview
- Building list
- Building detail/upgrade dialog

Main components:

- Building card with level, current effect, next effect.
- Upgrade CTA with money cost and duration.
- Active build progress bar and completion timer.
- Speed-up CTA using Stars.

Rules:

- If build already running, disable new build for that slot.
- Show requirement messages when player cannot upgrade.
- Rename stadium as separate modal action.
- Pitch resurfacing shown as dedicated maintenance action.

## 8. Squad Section Rebuild Spec

Screens:

- Squad list
- Player detail
- Player action modals

Main components:

- Player table/cards with name, position, quality, age, salary, contract.
- Detail panel with full stats and role assignments.
- Action buttons: rename, change origin, change shirt number, captain assignment, role assignment.
- Progression controls: upgrade quality with Stars, use skill cards.
- Lifecycle controls: renew contract, sell, fire, heal with medipacks.

Quality labels to render:

- Rookie
- Weak
- Average
- Good
- Very good
- Outstanding
- Magnificent
- Superstar
- Legend

Rules:

- Contract expiration risk state must be highly visible.
- Healing button appears only when injury exists.
- Upgrade and card-use actions require currency check + confirm.

## 9. Lineup And Tactics Rebuild Spec

Screens:

- Formation selection
- Match lineup editor
- Player roles assignment
- Tactics selection

Main components:

- Formation grid and draggable player slots.
- Bench list with swap interaction.
- Role controls for captain and set-piece takers.
- Tactic picker with seven tactics.

Tactics to include:

- Standard
- Pressing
- One-touch
- Through the middle
- Counterattack
- Over the flank
- Kick and rush

Rules:

- Save action validates complete lineup.
- If incomplete, show dedicated message and block final save.
- If lineup lock threshold reached (one hour before match), read-only mode.
- Multi-match preparation support should allow next-match contexts.

## 10. Training Rebuild Spec

Screens:

- Team training
- Individual training
- Training camp
- Tactic training

Main components:

- Skill selection controls for team and individual plans.
- Training progress indicators.
- Expiration and renew buttons.
- Camp booking cards and cancellation actions.

Rules:

- Individual training can expire; renew one or renew all.
- Camp actions update active timer immediately.
- Training efficiency panel must be visible in this section.

## 11. Scouting Rebuild Spec

Screens:

- Scout dashboard
- Scout result list
- Recruit confirmation

Main components:

- Standard scout CTA.
- Special scout CTA with position focus.
- Cooldown timer display.
- Result cards with youth player snapshots.
- Speed-up action for special scout.

Rules:

- If no player found, show dedicated no-result feedback.
- Recruit action opens accept/decline flow.
- Premium scout pricing and cooldown labels must be explicit.

## 12. Transfer Market Rebuild Spec

Screens:

- Search/filters
- Search result list
- Player detail bid view
- Favorites
- My bids
- My auctions

Main components:

- Filter panel for quick and advanced search.
- Auction cards with current bid, highest bidder, time left.
- Bid input and confirmation modal.
- Favorite toggle and favorite list sync.

Rules:

- Auction timers must be accurate and visible at all times.
- Overbid updates should appear live when possible.
- Ending-soon visual urgency state is required.

## 13. League Section Rebuild Spec

Screens:

- League table
- Home/away split tables
- Fixtures by matchday
- Goalscorers
- Match result history
- Team and season statistics

Main components:

- Table grid with ranking movement indicators.
- Match row with opponent, score, date, status.
- Goalscorer ranking list.
- Statistic cards (biggest win/loss, draws, win rate, goal diff).

Rules:

- Preserve chronology and matchday grouping.
- Support drilldown from fixture row to match details.

## 14. GT Ladder Section Rebuild Spec

Screens:

- Ladder overview
- Challenge screen
- Stamina restoration

Main components:

- Rank and ladder progression panel.
- Challenge target list.
- Match run CTA.
- Stamina value and restore action.

Rules:

- Block challenge action when stamina insufficient.
- Reflect rank changes after match completion refresh.

## 15. Friends And Friendly Matches Rebuild Spec

Screens:

- Friend list
- Challenges received/sent
- Find friend
- Friendly creation/accept/decline

Main components:

- Friend card with team snapshot.
- Challenge action buttons.
- Invite/link deep-link handling status.

Rules:

- Add-friend and challenge accept deep links route to this area.
- Challenge responses should mutate lists immediately.

## 16. Chat Section Rebuild Spec

Screens:

- Global chat thread

Main components:

- Chat history list.
- Message composer.
- Typing indicator rows.

Rules:

- Load recent history first, then subscribe to live updates.
- Typing indicator auto-expires client-side.
- Scroll behavior should preserve reading while new messages arrive.

## 17. Live Match And Match Detail Rebuild Spec

Screens:

- Live ticker
- Match detail timeline

Main components:

- Event timeline by minute.
- Score header with home/away team.
- Tactical/lineup context block if available.

Rules:

- Live updates can be periodic polling if SignalR unavailable.
- Historical matches should render final immutable timeline.

## 18. Shop, Ads, And Purchase Rebuild Spec

Screens:

- Product catalog
- Equipment catalog
- Purchase verification states
- Rewarded ad reward confirmation

Main components:

- Product cards with money/stars bundles.
- Equipment cards with buy/use actions.
- Purchase result banners.
- Rewarded video loading/reward dialogs.

Rules:

- Purchase outcomes should always be server-verified before granting value.
- Delay noncritical in-app notifications while rewarded video is open.

## 19. Support Section Rebuild Spec

Screens:

- Help/Support entry
- In-app support chat bridge

Rules:

- Use external support SDK panel behavior equivalent to Helpshift embed.
- Preserve app context identifiers where possible.

## 20. Notification UX Rebuild Spec

Types to implement:

- Auction ending soon
- Building complete
- Inactivity reminder
- Contract expiration
- Season end/start
- Single training expiration
- Sponsor expiration

Rules:

- Notifications deep-link to exact relevant screen.
- Notification open state should be tracked to avoid duplicate actions.

## 21. Frontend State Model To Implement

Minimum persistent state stores:

- Session/auth state
- Club identity state
- Currency state
- Timers state
- Squad and lineup state
- Market/live data state
- Messaging state
- Preferences/tutorial state

Client update strategy:

- REST snapshot fetch for initial page load.
- Event stream updates for chat and transfer bids.
- Optimistic UI only for low-risk toggles; otherwise server-confirmed updates.

## 22. UX Priority Order For Rebuild

1. Shell navigation and global currency/timer bars.
2. Squad + lineup + training flows.
3. Transfer market + live updates.
4. League/ladder + match details.
5. Club/finances/stadium systems.
6. Social/chat/support/shop.

This order reproduces the playable management loop earliest.

## 23. Validation Checklist For Rebuilt Frontend

- User can navigate all major sections without dead ends.
- All spend actions use confirm modals.
- Countdown-based features visibly progress.
- Lineup lock behavior is enforced.
- Squad management supports full lifecycle actions.
- Transfer market screens support search, bid, and favorites.
- Chat supports history + live posts + typing indicator.
- Notifications open relevant screens correctly.

If these pass, the rebuilt frontend behavior will match the original app model closely enough for functional parity.