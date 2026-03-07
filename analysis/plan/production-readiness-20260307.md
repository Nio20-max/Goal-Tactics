# Production Readiness Report - 2026-03-07

## Outcome

The live GoalTactics stack was not production ready at the start of this audit. The main deployment and runtime gaps were fixed, the live services were redeployed, and the resulting system now passes the core production checks listed below.

## Issues Found And Fixed

1. The API systemd unit on the host was stale and still ran `dotnet run` from the source tree as `root`.
   - Fixed by publishing release binaries to `/opt/goaltactics`.
   - Fixed by updating API and worker units to run the published DLLs as `www-data`.
   - Fixed by wiring both services to the mounted SQLite database at `/mnt/website/goal_tactics/data/goaltactics.db`.

2. The API had no production health endpoint.
   - Fixed by adding `/health` to the backend.

3. The API emitted reverse-proxy and key-storage production warnings.
   - Fixed by enabling forwarded headers handling for nginx.
   - Fixed by persisting ASP.NET Core data-protection keys to `/mnt/website/goal_tactics/data-protection`.
   - Removed internal HTTPS redirection from the backend process, since TLS termination already happens at nginx.

4. The backup service was not production safe.
   - Fixed the DB path mismatch so backup reads the mounted production database.
   - Fixed the systemd execution path so the backup job runs from `/opt/goaltactics/bin/backup-goaltactics.sh` instead of `/root/...`.
   - Fixed a corrupted deployed script artifact that caused post-backup failure even after writing the snapshot.
   - Kept compressed snapshot retention at 288 files, which is 24 hours at a 5 minute interval.

5. Log rotation was too minimal.
   - Added `dateext`, `delaycompress`, and explicit `create` ownership in logrotate.

6. Test expectations were out of sync with the requested league rules.
   - Updated the league contract test to expect `Dismount = 6` for the tier used by new human onboarding.

## Runtime Verification

The following checks passed on the live host after redeploy:

1. `goaltactics-api.service`, `goaltactics-worker.service`, and `goaltactics-backup.timer` are active.
2. The API listens on `127.0.0.1:5195` from the published install path `/opt/goaltactics/api/GoalTactics.Api.dll`.
3. Direct local health check returns `200` with body `{"success":true,"message":"pong"}` on `http://127.0.0.1:5195/health`.
4. Public health check returns `200` with the same backend body on `https://gt.nikolai-linschmann.de/health`.
5. Public compatibility routing still behaves correctly:
   - `POST /api/Login` with empty JSON returns `400` validation output through nginx.
   - `GET /chat` returns `401`, which confirms routing reaches the protected backend path.
6. Manual backup succeeds and writes compressed snapshots to `/mnt/website/goal_tactics/backup/`.
7. Mounted logging is active under `/mnt/website/goal_tactics/logs/`.

## Game World Verification

1. Registration succeeded for a live smoke user.
2. The user was assigned to a third-league bot club:
   - Team: `Bot FC 3-1-1`
   - `league_tier = 3`
3. Stadium and facilities were reset for the human takeover:
   - `stadium_name = My Stadium`
   - `grass_quality = 80`
   - `office_level = 1`
   - `training_center_level = 1`
   - `medical_center_level = 1`
   - `youth_academy_level = 1`
   - `fan_shop_level = 1`
   - `parking_level = 1`
4. League pyramid exists in the mounted production database with the requested structure:
   - Tier 1: 1 league
   - Tier 2: 5 leagues
   - Tier 3: 15 leagues
   - Tier 4: 45 leagues

## Test Verification

Release test runs completed successfully:

1. `GoalTactics.UnitTests`: 6 passed
2. `GoalTactics.ContractTests`: 21 passed
3. `GoalTactics.SimulationTests`: 1 passed

## Deployment Assets Updated

1. `scripts/deploy-live-services.sh`
2. `scripts/backup-goaltactics.sh`
3. `deploy/systemd/goaltactics-api.service`
4. `deploy/systemd/goaltactics-worker.service`
5. `deploy/systemd/goaltactics-backup.service`
6. `deploy/systemd/goaltactics-backup.timer`
7. `deploy/logrotate/goaltactics`
8. `src/GoalTactics.Api/Program.cs`
9. `tests/GoalTactics.ContractTests/League/LeagueControllerTests.cs`

## Remaining Operational Note

Backups are now production-functional, but they are snapshot backups every 5 minutes, not true point-in-time recovery. That means service crash and reboot continuity is covered by the persisted mounted SQLite database and systemd restart policy, while disaster rollback is covered by frequent compressed snapshots. Exact transaction-by-transaction recovery between snapshots would require a different persistence and backup strategy.