# Cloud Routines

These prompts are the production path. Each one is configured as a separate cloud routine in Claude Code and fires on a cron schedule Mon–Fri.

## Setup (do this once per fork)

1. In Claude Code, go to **Settings → Routines → New Routine**
2. For each file below, create a routine:
   - Paste the full contents of the `.md` file as the prompt
   - Set the cron schedule shown
   - Set all environment variables from `env.template`
3. Install the Claude GitHub App on your fork so routines can clone and push

## Schedule

| File | Cron | Notes |
|---|---|---|
| `pre-market.md` | `0 8 * * 1-5` | 8:00 AM ET Mon–Fri |
| `market-open.md` | `30 8 * * 1-5` | 8:30 AM ET Mon–Fri |
| `midday.md` | `0 12 * * 1-5` | 12:00 PM ET Mon–Fri |
| `daily-summary.md` | `0 15 * * 1-5` | 3:00 PM ET Mon–Fri |
| `weekly-review.md` | `0 16 * * 5` | 4:00 PM ET Friday only |

## Required Environment Variables (set on each routine)

```
ALPACA_API_KEY
ALPACA_SECRET_KEY
PERPLEXITY_API_KEY
SLACK_BOT_TOKEN
SLACK_CHANNEL_ID
```

Optional (wrappers default if unset): `ALPACA_ENDPOINT`, `ALPACA_DATA_ENDPOINT`, `PERPLEXITY_MODEL` (defaults to `sonar`).

**Never put real credentials in any file committed to this repo.**
