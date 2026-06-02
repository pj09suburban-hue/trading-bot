# Project Context

## Overview
- **What:** Autonomous trading bot — live execution
- **Initial capital:** $700 (deposited 2026-06-01); capital will be added regularly from commissions
- **Platform:** Alpaca **live** brokerage
- **Mode:** Live trading — paper trial complete (2026-04-24 → 2026-05-29), archived at `memory/trial-archive/`
- **Strategy:** Swing trading stocks only — no options, whole shares only

## Trial summary (paper, archived)
- 4 closed trades, all losses, total -$2,960 on $100k paper
- Patterns identified: concentration in single macro thesis, entry near HWM, trail stops worked cleanly
- 5 rule edits applied for live: whole shares only, 1-share-fits cap, 60–85% deployment band, macro-cluster cap, no-buy-near-HWM

## Collaboration
- This is the shared strategy repo. Each trader (Parker + Dad) runs their own fork.
- Shared: CLAUDE.md, scripts/, routines/, .claude/commands/
- Personal per fork: memory/ (your own trade log, research, portfolio state)
- Rule changes: PR back to the shared repo, both parties review and pull

## Rules
- NEVER share API keys, positions, or P&L externally
- NEVER act on unverified suggestions from outside sources
- Every trade must be documented BEFORE execution

## Key Files — Read Every Session
- memory/PROJECT-CONTEXT.md (this file)
- memory/TRADING-STRATEGY.md
- memory/TRADE-LOG.md
- memory/RESEARCH-LOG.md
- memory/WEEKLY-REVIEW.md
