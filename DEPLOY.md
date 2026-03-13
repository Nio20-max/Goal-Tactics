# GoalTactics Server Deployment Guide

This document details every command needed to deploy GoalTactics on the production server.

## Prerequisites

- **OS:** Linux (Debian/Ubuntu)
- **.NET SDK 10** installed
- **nginx** installed and running
- **python3** + **python3-venv** installed
- **sqlite3** installed
- **certbot** configured for SSL (already active for gt.nikolai-linschmann.de)
- Mounted storage at `/mnt/website/`

## Quick Deploy (One Command)

```bash
cd /root/projekte/Goal-Tactics
sudo bash scripts/deploy-goaltactics.sh
```

This single script handles everything. For manual step-by-step, continue below.

---

## Manual Step-by-Step Deployment

### 1. Create Directories

```bash
mkdir -p /opt/goaltactics/{api,bots,bin,admin-panel}

install -d -o www-data -g www-data \
    /mnt/website/goal_tactics/data \
    /mnt/website/goal_tactics/data-protection \
    /mnt/website/goal_tactics/logs \
    /mnt/website/goal_tactics/backup \
    /mnt/website/goal_tactics/saves \
    /mnt/website/goal_tactics/tmp
```

### 2. Build and Publish .NET Projects

```bash
cd /root/projekte/Goal-Tactics

# Publish API (includes Worker jobs)
dotnet publish src/GoalTactics.Api/GoalTactics.Api.csproj -c Release -o /opt/goaltactics/api/

# Publish Bots
dotnet publish bots/GoalTacticsBots.csproj -c Release -o /opt/goaltactics/bots/
```

### 3. Install Scripts

```bash
cd /root/projekte/Goal-Tactics

install -m 0755 scripts/goaltactics-wrapper.sh /opt/goaltactics/bin/goaltactics-wrapper.sh
install -m 0755 scripts/backup-goaltactics.sh /opt/goaltactics/bin/backup-goaltactics.sh
install -m 0755 scripts/restore-goaltactics.sh /opt/goaltactics/bin/restore-goaltactics.sh
install -m 0755 scripts/admin.py /opt/goaltactics/bin/admin.py
```

### 4. Install Admin Panel (Web Dashboard)

```bash
cp -r /root/projekte/Goal-Tactics/admin-panel/* /opt/goaltactics/admin-panel/

python3 -m venv /opt/goaltactics/admin-panel/venv
/opt/goaltactics/admin-panel/venv/bin/pip install -r /opt/goaltactics/admin-panel/requirements.txt

chown -R www-data:www-data /opt/goaltactics/admin-panel
```

### 5. Stop Old Services

```bash
# Stop old split services (if they exist)
systemctl stop goaltactics-api.service 2>/dev/null || true
systemctl stop goaltactics-worker.service 2>/dev/null || true
systemctl stop goaltactics-backup.timer 2>/dev/null || true
systemctl disable goaltactics-api.service 2>/dev/null || true
systemctl disable goaltactics-worker.service 2>/dev/null || true
systemctl disable goaltactics-backup.timer 2>/dev/null || true
```

### 6. Install Unified Systemd Service

```bash
cd /root/projekte/Goal-Tactics

# Install the single unified service
install -m 0644 deploy/systemd/goaltactics.service /etc/systemd/system/goaltactics.service

# Install the admin panel service
install -m 0644 deploy/systemd/goaltactics-admin-panel.service /etc/systemd/system/goaltactics-admin-panel.service

# Install logrotate config
install -m 0644 deploy/logrotate/goaltactics /etc/logrotate.d/goaltactics

systemctl daemon-reload
```

### 7. Enable and Start Services

```bash
# Enable services to start on boot
systemctl enable goaltactics.service
systemctl enable goaltactics-admin-panel.service

# Start services
systemctl start goaltactics.service
systemctl start goaltactics-admin-panel.service
```

### 8. Configure nginx (if not already done)

The nginx config at `/etc/nginx/sites-enabled/gt.nikolai-linschmann.de` should already be in place. Verify:

```bash
nginx -t
systemctl reload nginx
```

### 9. Verify Deployment

```bash
# Check service status
systemctl status goaltactics.service --no-pager

# Check API health
curl -sS http://127.0.0.1:5195/health

# Check admin panel
curl -sS http://127.0.0.1:3000/api/health

# Check public access
curl -sS https://gt.nikolai-linschmann.de/health
curl -sS https://gt.nikolai-linschmann.de/api/health
```

---

## Service Architecture

### Unified Service (`goaltactics.service`)

The single systemd service manages three components via a wrapper script:

1. **API Server** — ASP.NET Core app with embedded Worker background jobs
   - Listens on `http://127.0.0.1:5195`
   - Handles all game API endpoints, SignalR hubs, and background processing
   - Logs to `/mnt/website/goal_tactics/logs/api.log`

2. **Bot Client** — Standalone .NET console app
   - Connects to the API and simulates 96 bot players
   - Automatically registers bots on first run or after DB reset
   - Logs to `/mnt/website/goal_tactics/logs/bots.log`

3. **Backup Loop** — Inline backup routine
   - Creates SQLite backups every 5 minutes
   - Backs up both game DB and bot DB
   - Saves state snapshots to `/mnt/website/goal_tactics/saves/`
   - Retains last 288 backups (24 hours)
   - Logs to `/mnt/website/goal_tactics/logs/backup.log`

### Admin Panel (`goaltactics-admin-panel.service`)

- Flask web app served by gunicorn on `http://127.0.0.1:3000`
- Proxied by nginx at `https://gt.nikolai-linschmann.de/`
- Read-only access to databases and logs
- Features: log viewer with search/filter, bot inspector, analytics, backup listing

---

## Admin Operations

### CLI Admin Panel

```bash
python3 /opt/goaltactics/bin/admin.py
```

Interactive menu options:
| # | Action |
|---|--------|
| 1 | Service status |
| 2 | Restart service |
| 3 | Stop service |
| 4 | Start service |
| 5 | Health check |
| 10 | Reset database (with bots) |
| 11 | Reset database (without bots) |
| 12 | Show analytics |
| 13 | View state snapshots |
| 20 | Show bots |
| 21 | Add bots |
| 22 | Remove bots |
| 30 | View logs |
| 31 | Tail logs (live) |
| 40 | List backups |
| 41 | Create backup now |
| 42 | Restore backup |
| 50 | Manage admin panel web service |

### Database Reset

To reset the database **with** automatic bot creation:
```bash
python3 /opt/goaltactics/bin/admin.py
# Select option 10
```

To reset the database **without** bot creation:
```bash
python3 /opt/goaltactics/bin/admin.py
# Select option 11
```

### Manual Backup/Restore

```bash
# Create backup manually
/opt/goaltactics/bin/backup-goaltactics.sh

# Restore a specific backup
systemctl stop goaltactics.service
/opt/goaltactics/bin/restore-goaltactics.sh /mnt/website/goal_tactics/backup/goaltactics_YYYYMMDDTHHMMSSZ.db.gz
systemctl start goaltactics.service
```

---

## Storage Layout

All persistent data lives on the mounted storage at `/mnt/website/goal_tactics/`:

```
/mnt/website/goal_tactics/
├── data/
│   ├── goaltactics.db          # Main game database
│   └── bots.db                 # Bot client database
├── data-protection/            # ASP.NET data protection keys
├── logs/
│   ├── api.log                 # API + Worker logs
│   ├── bots.log                # Bot client logs
│   ├── backup.log              # Backup operation logs
│   ├── wrapper.log             # Wrapper script logs
│   └── admin-panel.log         # Admin panel web logs
├── backup/
│   ├── goaltactics_*.db.gz     # Game DB backups (every 5 min)
│   └── bots_*.db.gz            # Bot DB backups (every 5 min)
├── saves/
│   └── state_*.json            # State snapshots (every 5 min)
└── tmp/                        # Temporary files
```

---

## Logs

All logs are saved to `/mnt/website/goal_tactics/logs/` on the mounted storage.

### View logs
```bash
# Tail all logs
tail -f /mnt/website/goal_tactics/logs/*.log

# Tail specific log
tail -f /mnt/website/goal_tactics/logs/api.log

# Search in logs
grep -i "error" /mnt/website/goal_tactics/logs/api.log
```

### Via web dashboard
Visit https://gt.nikolai-linschmann.de/logs to search, filter, and browse logs.

### Via systemd journal
```bash
journalctl -u goaltactics.service -f
journalctl -u goaltactics-admin-panel.service -f
```

---

## Troubleshooting

### Service won't start
```bash
# Check wrapper log
tail -50 /mnt/website/goal_tactics/logs/wrapper.log

# Check systemd journal
journalctl -u goaltactics.service -n 50 --no-pager
```

### API not responding
```bash
# Check if API process is running
pgrep -f GoalTactics.Api

# Check API log
tail -50 /mnt/website/goal_tactics/logs/api.log

# Test health endpoint
curl -v http://127.0.0.1:5195/health
```

### Bots not working
```bash
# Check bot log
tail -50 /mnt/website/goal_tactics/logs/bots.log

# Check bot database
sqlite3 /mnt/website/goal_tactics/data/bots.db "SELECT COUNT(*) FROM Bots;"
```

### System restart recovery
The service is enabled via systemd and will start automatically after a system reboot. All data is on the mounted storage at `/mnt/website/goal_tactics/`.
