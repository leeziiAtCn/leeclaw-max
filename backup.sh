#!/usr/bin/env zsh
# OpenClaw workspace backup script
# Called by cron every 6 hours. Only commits if files changed.
set -euo pipefail

BACKUP_DIR="$HOME/.openclaw/backup-staging"
cd "$BACKUP_DIR"

# Refresh workspace files
refresh_agent() {
  local agent=$1
  local src_dir=$2
  local dst_dir="$BACKUP_DIR/workspace/$agent"

  mkdir -p "$dst_dir"
  for f in AGENTS.md SOUL.md USER.md IDENTITY.md TOOLS.md MEMORY.md HEARTBEAT.md; do
    [ -f "$src_dir/$f" ] && cp "$src_dir/$f" "$dst_dir/$f"
  done

  # memory/ and learnings/
  if [ -d "$src_dir/memory" ] && [ "$(ls -A "$src_dir/memory" 2>/dev/null)" ]; then
    mkdir -p "$dst_dir/memory"
    cp -rn "$src_dir/memory/"* "$dst_dir/memory/" 2>/dev/null || true
  fi
}

refresh_agent "main" "$HOME/.openclaw/workspace"
refresh_agent "coo"  "$HOME/.openclaw/workspace-COO"
refresh_agent "cto"  "$HOME/.openclaw/workspace-CTO"

# Sanitize config
python3 -c "
import json, sys
data = json.load(open('$HOME/.openclaw/openclaw.json'))
if 'channels' in data:
    for ch_cfg in data['channels'].values():
        if isinstance(ch_cfg, dict):
            for k in ('appSecret','appId','verificationToken','encryptKey'):
                ch_cfg.pop(k, None)
            if 'accounts' in ch_cfg:
                for acc in ch_cfg['accounts'].values():
                    if isinstance(acc, dict):
                        for k in ('appSecret','appId','token','botToken'):
                            acc.pop(k, None)
if 'gateway' in data and 'auth' in data['gateway']:
    for k in ('token','password'): data['gateway']['auth'].pop(k, None)
if 'auth' in data:
    data['auth'] = {'_redacted': True}
json.dump(data, open('$BACKUP_DIR/openclaw-config-sanitized.json','w'), indent=2, ensure_ascii=False)
"

# Commit only if changes
if [ -z "$(git status --porcelain 2>/dev/null)" ]; then
  exit 0
fi

git add -A
TIMESTAMP=$(date -u '+%Y-%m-%d %H:%M UTC')
CHANGED=$(git diff --cached --name-only | head -20 | tr '\n' ', ' | sed 's/,$//')
git commit -m "backup: $TIMESTAMP — $CHANGED"
