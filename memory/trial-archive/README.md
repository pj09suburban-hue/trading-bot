# Trial Archive — Paper Account (2026-04-24 → 2026-05-29)

Frozen on **2026-06-01** when the bot cut over to a live Alpaca account.

These three files capture the full paper-trading trial:

- `TRADE-LOG.md` — every paper trade + daily EOD snapshots
- `RESEARCH-LOG.md` — daily pre-market research entries
- `WEEKLY-REVIEW.md` — weekly performance reviews

## Headline trial results

- **Window:** 2026-04-24 (Week 1, partial Friday) → 2026-05-29 (Week 5 close)
- **Starting equity:** ~$100,000 (paper)
- **Closed trades:** 4 (CVX, XOM, CEG, FCX) — **all losses, total -$2,960**
- **Patterns identified:** concentration in single macro thesis (CVX+XOM = -$1,173); entry near HWM (CEG = -$1,726); trailing stops worked cleanly (FCX = -$60)

## What carried forward to live

- **Strategy rules** (see `../TRADING-STRATEGY.md`) with 5 edits applied 2026-06-01: whole shares only, 1-share-fits cap, 60–85% deployment band, macro-cluster cap, no-buy-near-HWM
- **Cloud routines + IDs** — same 5 routines, env vars swapped to live account
- **Lessons / memory** — `~/.claude/projects/.../memory/` retains all observations

## What was reset

- Live account started fresh at **$700** (Parker, 2026-06-01)
- Empty `TRADE-LOG.md`, `RESEARCH-LOG.md`, `WEEKLY-REVIEW.md` initialized in `memory/`
- No open positions carried over (paper positions don't transfer to a different account)

Git history preserves every paper-era commit if you need to dig further.
