# Phase 4 - Launch And Operations

This phase prepares the rebuilt game for staging, closed testing, and production launch. It exists separately because a football-manager backend with realtime, purchases, and scheduled jobs cannot be treated as finished when the code compiles.

## 4.1 Required environments

Create and maintain these environments:

- local development
- shared integration
- staging with production-like services
- production

Each environment needs:

- API host
- SignalR endpoints
- PostgreSQL database
- Redis if used
- FCM credentials
- billing verification credentials
- support identity integration if retained
- logging and metrics pipeline

## 4.2 Deployment artifacts and files

Create these operational files:

- `deploy/docker/api.Dockerfile`
- `deploy/docker/worker.Dockerfile`
- `deploy/docker/bots.Dockerfile`
- `deploy/compose/staging.yml`
- `deploy/compose/production.yml`
- `deploy/nginx/goaltactics.conf`
- `deploy/systemd/goaltactics-api.service`
- `deploy/systemd/goaltactics-worker.service`
- `deploy/systemd/goaltactics-bots.service`
- `docs/operations/deployment-checklist.md`
- `docs/operations/rollback-checklist.md`
- `docs/operations/database-migration-checklist.md`
- `docs/operations/alert-catalog.md`
- `docs/operations/backup-restore.md`

## 4.3 Database migration and seed process

Before every environment promotion:

- run schema migrations in a controlled step
- seed reference data for countries, tactics, formations, building types, sponsor templates, shop catalog, and notification defaults
- verify reference data checksums so the app and backend stay aligned
- snapshot the database before irreversible migrations

For launch, prepare seed scripts for:

- initial leagues and season structure
- bot population bootstrap
- shop catalog products and equipment
- sponsor template catalog
- chat channels and moderation defaults

## 4.4 Monitoring and alerting

At minimum expose and alert on:

- API request rate, latency, and error rate by route
- SignalR connection count and disconnect spikes
- failed login count
- failed purchase verification count
- match-resolution backlog size
- auction-settlement backlog size
- scouting-completion backlog size
- worker job retry count
- database CPU, connection count, slow queries, lock time
- Redis availability if used
- bot activity volume and error rate
- chat moderation actions
- stars and money mutation anomalies

## 4.5 Operational runbooks

Write explicit runbooks for:

- failed season rollover
- failed scheduled match batch
- stuck auction settlement
- purchase-verification outage
- FCM outage
- chat spam wave
- bot runaway behavior
- schema migration rollback
- hotfix deployment

Each runbook must name:

- symptom
- likely causes
- immediate containment action
- diagnostic queries or commands
- rollback path
- user-facing communication guidance

## 4.6 Closed beta and validation stages

Recommended rollout order:

1. Internal backend-only test with bots.
2. Internal mobile build against staging.
3. Closed beta with selected human managers plus live bots.
4. Production soft launch with limited user acquisition.
5. Full launch after stability targets hold.

For each stage, define exit gates for:

- crash rate
- API error rate
- successful login rate
- successful purchase-verification rate
- match-resolution correctness
- auction correctness
- bot behavior quality
- chat moderation quality

## 4.7 Rollback and data safety

The game needs rollback rules that preserve economic integrity.

Mandatory safeguards:

- pre-deploy database snapshot
- immutable ledger for money and stars
- idempotent purchase grants
- idempotent auction settlement
- ability to disable chat, purchases, bots, or ladder independently via feature flags
- feature flags for rewarded ads and sponsor refresh if needed

## 4.8 Post-launch review loop

After launch, review daily:

- economy inflation or deflation
- team insolvency rates
- ladder participation
- league completion health
- ad and purchase revenue integrity
- support ticket categories
- bot share of chat and transfer activity
- suspicious exploit patterns

Feed those findings back into mechanics tuning only after preserving an audit trail of the original shipped-game baseline.

## 4.9 Exit criteria

Phase 4 is complete only when:

- staging and production deployments are repeatable
- rollback is documented and tested
- monitoring covers gameplay, economy, realtime, and monetization
- the game can survive restarts, retries, and partial outages without corrupting club state