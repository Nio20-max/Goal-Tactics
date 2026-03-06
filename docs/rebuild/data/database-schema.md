# Database Schema Draft (Phase 0)

## Phase 0 Step Log
1. Derived entity set from recovered APIs, DTOs, and mechanics requirements.
2. Cross-checked with decompiled state objects for required fields.
3. Aligned schema with authoritative backend model and job mutation needs.

## Exact from client/docs
Domains requiring persistence:
- users and auth sessions
- teams/resources/news/mail/accomplishments
- players/skills/contracts/injuries/cards/stats
- lineups/formations/tactics/match reports/events
- leagues/seasons/fixtures/tables/goalgetters
- ladder entries/challenges/stamina
- scouting assignments/prospects
- stadium/buildings/construction
- sponsors/offers/payouts
- training plans/camps/individual slots
- transfer market auctions/bids/favorites
- products/equipment/purchases/daily rewards
- friends/friendlies/chat/preferences/tutorial

## Exact from decompiled logic
Mechanics-driving fields observed in client contracts:
- transfer min/max offers and auction max hours
- max upgrade strength and role bonuses
- training prices and boredom date
- mood and mood modifiers
- stadium visitors/earnings/running cost related fields

## Fallback model selected after testing
- None for table existence.
- Some numeric derivations (attendance/income formulas) remain model-calibrated but still need storage columns now.

## Proposed tables (minimum)
- `users`, `user_sessions`, `user_preferences`, `tutorial_states`, `punishments`
- `teams`, `team_resources`, `team_news`, `mail_messages`, `team_accomplishments`, `finance_ledger_entries`
- `players`, `player_skill_values`, `player_contracts`, `player_injuries`, `player_card_states`, `player_statistics`, `player_upgrade_history`
- `seasons`, `leagues`, `league_memberships`, `matches`, `match_lineups`, `match_lineup_players`, `match_events`, `match_reports`, `goal_getter_rows`
- `ladder_seasons`, `ladder_entries`, `ladder_challenges`
- `team_training_plans`, `tactic_training_plans`, `tactic_bonus_values`, `training_camp_bookings`, `individual_training_plans`
- `scout_assignments`, `scouted_prospects`
- `stadiums`, `stadium_buildings`, `stadium_construction_jobs`
- `sponsor_offers`, `active_sponsors`
- `product_catalog_items`, `equipment_items`, `team_equipment`, `purchase_records`, `daily_reward_claims`
- `auctions`, `auction_bids`, `auction_favorites`
- `friend_relations`, `friendly_challenges`, `chat_messages`, `chat_presence`

## Migration and indexing notes
- Add unique constraints on user identity keys, active auction/player invariants, and one active tutorial state per user.
- Index all foreign keys plus time-window job fields (`ends_at`, `ready_at`, `scheduled_at`).
- Finance ledger must be append-only.

## Simulated walkthrough
Auction settlement transaction:
1. Lock `auctions` row by id.
2. Select winning `auction_bids` row by highest bid then earliest tie-break.
3. Update `players.team_id` and auction status.
4. Insert finance ledger entries for buyer debit, seller credit, fee sink.
5. Commit and emit `/auc` settlement notifications.

What this accomplishes:
- consistent ownership transfer and auditable economy mutation.
