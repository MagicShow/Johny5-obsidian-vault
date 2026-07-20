# ObsidianVault

Managed by Johny5 (AI agent) running on the VPS.

## Purpose
- Automated notes from our work sessions
- Project notes, decisions, and context
- Long-term memory for the agent
- Daily standup and check-in logs

## Vault Structure

```
ObsidianVault/
├── README.md              # This file
├── Decisions.md           # Key decisions made across projects
├── Projects/
│   ├── ContractorHub.md   # ContractorHub (collar-blue) project notes
│   └── QuestLog.md        # QuestLog personal productivity app notes
├── Sessions/
│   └── session-YYYY-MM-DD.md   # Session logs
└── Daily/
    └── YYYY-MM-DD.md     # Daily standup/check-in notes
```

## How It Works
- Vault path: `/home/ubuntu/ObsidianVault`
- Managed by: Johny5 🤖
- Synced to GitHub: MagicShow/Johny5-obsidian-vault
- Auto-sync: every 15 minutes via cron
- Johny5 reads and writes to this vault during sessions

## For Johny5
- Check Projects/ for full context on active builds
- Check Sessions/ for session history
- Update Decisions.md when key choices are made
- Daily/ folder for daily standup notes
