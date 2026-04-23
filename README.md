# Trading Bot

Autonomous AI trading bot running on Claude Code. Five cron jobs fire each weekday — Claude is the bot.

## How It Works

Each scheduled run clones this repo fresh, reads memory, checks live account state, decides on action, places orders if warranted, commits updated memory files, and sends a Slack notification.

No separate process. No server. Claude + Git + Alpaca.

## Setup

1. **Fork this repo** into your own GitHub account (each trader runs their own fork)
2. **Clone your fork** locally
3. **Copy credentials:** `cp env.template .env` then fill in your API keys
4. **Smoke test:** open the repo in Claude Code, run `/portfolio` — you should see your account print cleanly
5. **Configure cloud routines** in Claude Code settings (see `routines/README.md`)

## Prerequisites

- [Alpaca](https://alpaca.markets) account (paper is fine to start)
- [Perplexity API](https://www.perplexity.ai/api) key
- [Slack](https://slack.com) workspace with a bot app (`chat:write` scope) invited to your notifications channel
- Claude Code with cloud routines enabled

## Repository Layout

```
├── CLAUDE.md              # Agent rulebook — auto-loaded every session
├── env.template           # Credential template — copy to .env, never commit .env
├── scripts/               # API wrappers — all external calls go through here
├── routines/              # Cloud routine prompts (production cron)
├── .claude/commands/      # Local slash commands for manual/test runs
└── memory/                # Persistent agent state — committed after every run
```

## Collaboration

This is the shared **strategy repo**. Each trader forks it and runs independently against their own Alpaca account. Strategy rule changes are PR'd here; both parties pull them into their forks.

## The Five Daily Jobs

| Time (ET) | Workflow | What It Does |
|---|---|---|
| Pre-market | `routines/pre-market.md` | Research catalysts, write trade ideas |
| 8:30 AM | `routines/market-open.md` | Execute trades, set trailing stops |
| 12:00 PM | `routines/midday.md` | Scan positions, cut losers, tighten stops |
| 3:00 PM | `routines/daily-summary.md` | EOD snapshot, send Slack recap |
| 4:00 PM Fri | `routines/weekly-review.md` | Weekly stats, grade, update strategy |
