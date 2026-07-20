# QuestLog — Project Notes

## Overview
Gamified personal command center — video game style task/quest tracker for MagicShow's personal productivity. Cyberpunk aesthetic, Conan the Barbarian adventure mode.

**GitHub:** https://github.com/MagicShow/quest-log

**Stack:** React 18 + Vite, localStorage persistence, plain CSS

---

## Features

### Core Quest System
- Quests with difficulty: Easy (+10 XP), Medium (+25 XP), Hard (+50 XP), Epic (+100 XP)
- Quest types: Urgent [!], Important [*], Optional [~]
- Energy cost per quest: 5/10/20/35 energy
- Projects (Campaigns): Life Admin ⚔️, Home 🏠, Apps 🚀, Family 👨‍👧‍👦, Self 💪

### Energy System
- 0-100 energy bar
- Depletes as quests are completed
- Overnight recovery (refills on new day)
- Visual: bar turns orange <30, red <15, pulses when critical

### Leveling
- XP needed per level: level × 100
- Level up: full-screen gold flash + modal
- Progress bar beneath level badge in header

### Streak System
- Daily check-in = maintain streak
- Resets if no quest completed in 24h
- Milestones: 3, 7, 14, 30, 60, 100 days

### Achievements (12 total)
First Blood, Hot Streak (7-day), Epic Win, Decimation (10 quests/day), Battle Tested (100 total), Decision Speed (<5 min), Veteran (Lv.5), Elite (Lv.10), Two Weeks (14-day), Monthly Grind (30-day), Diversified (all 5 projects), Energy Manager (finish day 50+ energy)

### Night Agent
- Cron job: 10 PM UTC daily
- Analyzes: completion rate, energy trends, streak, pending quest patterns
- Outputs: 1 actionable optimization tip per night
- Tip delivered in chat the next morning

---

## Adventure Mode (Conan)

### Zelda-Style World Map
Horizontal side-scrolling game world. Conan walks right as quests are completed.

**5 Levels:**
1. The Swamp of Sloth → Life Admin (easy enemies)
2. The Forest of Doubt → Home (wolves, orcs)
3. The Mountain of Resistance → Apps (ogres, trolls)
4. The Vendor Lair → Self (demon boss)
5. The Throne of Focus → Family (dragon final boss)

**Movement:**
- Easy quest: +5% map progress
- Medium quest: +10% map progress
- Hard quest: +15% + enemy fight animation
- Epic quest: +20% + boss fight animation

**Level cleared:** +200 XP bonus, unlock next level

---

## Tech Details

### File Structure
```
src/
  components/
    ConanCharacter.jsx    # SVG pixel art, 5 animation states
    GameWorld.jsx         # Side-scrolling world map, enemies, portal
    QuestBoard.jsx        # Main quest list
    QuestCard.jsx         # Individual quest
    Header.jsx            # Player stats, level, energy bar
    ProjectSidebar.jsx    # Campaign filter
    RightPanel.jsx        # Night Agent + Achievements
    EnergyBar.jsx
    LevelUpModal.jsx
  context/
    GameContext.jsx       # Game state + reducer
  utils/
    gameLogic.js          # XP calc, level calc, achievements, Night Agent tips
    storage.js            # localStorage read/write
  styles/
    index.css             # ~600 lines, full design system
```

### State (localStorage key: `questlog_state`)
```js
{
  player: { name, level, xp, energy, maxEnergy, streak, gold, achievements, lastCheckIn },
  quests: [{ id, title, difficulty, type, project, completed, xpReward, energyCost, createdAt, completedAt }],
  projects: [{ id, name, icon, color }],
  achievements: [{ id, name, description, icon, unlocked, unlockedAt }],
  dailyStats: { "YYYY-MM-DD": { completed, xpGained, energySpent } },
  nightAgentTips: [{ date, tip }],
  gameWorld: { currentLevel, conanPosition, levelComplete, gameComplete, defeatedEnemies, currentEnemy }
}
```

---

## Cron Jobs
- **Night Agent:** `0 22 * * *` (10 PM UTC) — isolated session, analyzes and delivers tip
- **Obsidian Sync:** `*/15 * * * *` (every 15 min) — pulls + pushes vault to GitHub
