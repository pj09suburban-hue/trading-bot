# Project Context

## Overview
- **What:** Autonomous trading bot challenge
- **Starting capital:** ~$10,000
- **Platform:** Alpaca
- **Trial end criterion (set 2026-05-05):** ≥6 closed trades AND ≥4 full trading weeks completed. Until both are met, bot stays on paper. Rationale: live trial is meaningless until exit/stop discipline has been observed under real conditions; pure unrealized P&L on paper is not a validation signal.
- **Trial start:** 2026-04-24 (Week 1, partial Friday launch)
- **Earliest possible live-go date:** End of Week 5 (~2026-05-22) — and only if the 6-closed-trades floor is met by then
- **Strategy:** Swing trading stocks only — no options

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
