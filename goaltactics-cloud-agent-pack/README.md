# GoalTactics Cloud Agent Deployment Pack

This pack is intentionally outside the repository so an automation/cloud agent can build and operate the project without relying on editor context.

## Scope
- Exact build and publish commands
- Runtime paths used by the deployed services
- Live nginx config copy
- Live systemd unit copies
- Logrotate config copy
- Operational and verification commands

## Host Paths (authoritative)
- Repository path: /root/projekte/Goal-Tactics
- Install root: /opt/goaltactics
- API publish dir: /opt/goaltactics/api
- Worker publish dir: /opt/goaltactics/worker
- Utility scripts dir: /opt/goaltactics/bin
- App data root: /mnt/website/goal_tactics
- SQLite DB: /mnt/website/goal_tactics/data/goaltactics.db
- Data-protection key ring: /mnt/website/goal_tactics/data-protection
- App logs: /mnt/website/goal_tactics/logs
- Backup snapshots: /mnt/website/goal_tactics/backup
- Temp dir: /mnt/website/goal_tactics/tmp

## Included Configuration Copies
- Live nginx main config: configs/nginx/nginx.conf
- Live site config: configs/nginx/gt.nikolai-linschmann.de
- Live systemd units:
  - configs/systemd/goaltactics-api.service
  - configs/systemd/goaltactics-worker.service
  - configs/systemd/goaltactics-backup.service
  - configs/systemd/goaltactics-backup.timer
- Live logrotate: configs/logrotate/goaltactics
- In-repo deploy templates (reference): repo-deploy-templates/*
- Deployment scripts copied from repo: scripts/*

## Build Requirements
- OS: Linux
- .NET SDK 10
- nginx
- systemd
- sqlite3
- python3
- certbot (already reflected in live nginx file)

## Exact Build + Deploy Procedure
Run as root (or with sudo where needed).

1. Build and publish API + Worker

```bash
cd /root/projekte/Goal-Tactics

dotnet publish src/GoalTactics.Api/GoalTactics.Api.csproj -c Release -o /opt/goaltactics/api/
dotnet publish src/GoalTactics.Worker/GoalTactics.Worker.csproj -c Release -o /opt/goaltactics/worker/
```

2. Install utility scripts

```bash
install -d /opt/goaltactics/bin
install -m 0755 /root/projekte/Goal-Tactics/scripts/backup-goaltactics.sh /opt/goaltactics/bin/backup-goaltactics.sh
install -m 0755 /root/projekte/Goal-Tactics/scripts/restore-goaltactics.sh /opt/goaltactics/bin/restore-goaltactics.sh
```

3. Install systemd units

```bash
install -m 0644 /root/projekte/Goal-Tactics/deploy/systemd/goaltactics-api.service /etc/systemd/system/goaltactics-api.service
install -m 0644 /root/projekte/Goal-Tactics/deploy/systemd/goaltactics-worker.service /etc/systemd/system/goaltactics-worker.service
install -m 0644 /root/projekte/Goal-Tactics/deploy/systemd/goaltactics-backup.service /etc/systemd/system/goaltactics-backup.service
install -m 0644 /root/projekte/Goal-Tactics/deploy/systemd/goaltactics-backup.timer /etc/systemd/system/goaltactics-backup.timer
```

4. Install logrotate

```bash
install -m 0644 /root/projekte/Goal-Tactics/deploy/logrotate/goaltactics /etc/logrotate.d/goaltactics
```

5. Ensure runtime dirs

```bash
install -d -o www-data -g www-data \
  /mnt/website/goal_tactics/data \
  /mnt/website/goal_tactics/data-protection \
  /mnt/website/goal_tactics/logs \
  /mnt/website/goal_tactics/backup \
  /mnt/website/goal_tactics/tmp
```

6. Reload and start services

```bash
systemctl daemon-reload
systemctl enable goaltactics-api.service goaltactics-worker.service goaltactics-backup.timer
systemctl restart goaltactics-api.service
systemctl restart goaltactics-worker.service
systemctl restart goaltactics-backup.timer
```

7. Configure nginx (if needed)

```bash
# Current live config source in this pack:
# /root/goaltactics-cloud-agent-pack/configs/nginx/gt.nikolai-linschmann.de

nginx -t
systemctl reload nginx
```

## Fast One-Shot Script
The repository already includes:
- scripts/deploy-live-services.sh

Equivalent usage:

```bash
cd /root/projekte/Goal-Tactics
bash scripts/deploy-live-services.sh
```

## Runtime Verification

1. Service status

```bash
systemctl status goaltactics-api.service --no-pager
systemctl status goaltactics-worker.service --no-pager
systemctl status goaltactics-backup.timer --no-pager
```

2. Health and API probes

```bash
curl -sS http://127.0.0.1:5195/health
curl -sS -X POST http://127.0.0.1:5195/api/GetCountries -H 'Content-Type: application/json' -d '{}'
```

3. Public host probes

```bash
curl -k -sS https://gt.nikolai-linschmann.de/health
curl -k -sS -X POST https://gt.nikolai-linschmann.de/api/Login -H 'Content-Type: application/json' -d '{}'
curl -k -sS -X POST https://gt.nikolai-linschmann.de/GameEngine/Login -H 'Content-Type: application/json' -d '{}'
```

4. Tail logs

```bash
tail -f /mnt/website/goal_tactics/logs/api.log
tail -f /mnt/website/goal_tactics/logs/worker.log
journalctl -u goaltactics-api.service -f
journalctl -u goaltactics-worker.service -f
```

## Backup / Restore Operations

- Backup job command: /opt/goaltactics/bin/backup-goaltactics.sh
- Timer: every 5 minutes (goaltactics-backup.timer)

Manual restore:

```bash
/opt/goaltactics/bin/restore-goaltactics.sh /mnt/website/goal_tactics/backup/goaltactics_<TIMESTAMP>.db.gz
systemctl restart goaltactics-api.service
systemctl restart goaltactics-worker.service
```

## Nginx Routing Notes (important for legacy client)
The live site config includes:
- /api/* rewrites for service-name prefixes
- /GameEngine/* compatibility rewrites to /api/*
- SignalR hubs exposed at /chat and /auc

These rewrites are mandatory for legacy APK compatibility.

## Secrets / Sensitive Settings
- JWT signing key currently comes from appsettings in repo (development default value present).
- For production hardening, set secure values via environment or managed secrets.

## Agent Working Rules
- Always run build from: /root/projekte/Goal-Tactics
- Never reset DB unless explicitly requested:
  - Program supports destructive reset via Maintenance settings
- Validate nginx with nginx -t before reload
- Validate systemd with daemon-reload before restart
- Confirm /health after every deploy
