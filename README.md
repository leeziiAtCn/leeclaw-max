# OpenClaw Continuity Backup

Automated backup of OpenClaw agent workspace files for disaster recovery and continuity.

## Structure

```
workspace/
├── main/        # Main agent (primary assistant)
│   ├── AGENTS.md
│   ├── SOUL.md
│   ├── IDENTITY.md
│   ├── USER.md
│   ├── MEMORY.md
│   ├── TOOLS.md
│   └── HEARTBEAT.md
├── coo/         # COO agent
└── cto/         # CTO agent
```

Also includes `openclaw-config-sanitized.json` — the Gateway config with all secrets redacted.

## Restore

Copy files from `workspace/<agent>/` back to:
- `main` → `~/.openclaw/workspace/`
- `coo`  → `~/.openclaw/workspace-COO/`
- `cto`  → `~/.openclaw/workspace-CTO/`

Then restart Gateway: `openclaw gateway restart`

## Automation

Backed up via OpenClaw cron job every 6 hours. Only commits when files change.

## What's Excluded

- All secrets (appSecrets, tokens, API keys)
- Auth profiles and session data
- SSH keys, .env files, credentials
- Logs, caches, OS junk files
