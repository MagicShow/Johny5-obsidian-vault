#!/bin/bash
# Obsidian Vault Sync Script — pulls remote changes then pushes local changes

cd /home/ubuntu/ObsidianVault

# Pull any remote changes first (merge non-conflicting ones)
git pull origin main --no-edit 2>/dev/null

# Check for local changes
if [ -n "$(git status --porcelain)" ]; then
    git add -A
    git commit -m "Vault sync $(date '+%Y-%m-%d %H:%M UTC') — automated"
    git push origin main
    echo "✅ Synced at $(date)"
else
    echo "✅ No changes to sync at $(date)"
fi
