---
description: Manual trade with strategy-rule validation. Usage: /trade SYMBOL SHARES buy|sell
---

Execute a manual trade with full rule validation. Refuse if any rule fails.

Args: SYMBOL SHARES SIDE (buy or sell). If missing, ask.

1. Pull state: `bash scripts/alpaca.sh account`, `bash scripts/alpaca.sh positions`, `bash scripts/alpaca.sh quote SYMBOL` (capture ask price P).

2. For BUY, validate all of the following — STOP and print failed checks if any fail:
   - Total positions after fill ≤ 6
   - Trades this week + 1 ≤ 3
   - SHARES × P ≤ 20% of equity
   - SHARES × P ≤ available cash
   - daytrade_count < 3
   - Catalyst documented (ask for thesis if not in today's RESEARCH-LOG)

3. For SELL, confirm position exists with right qty. No other checks.

4. Print order JSON + validation results, ask "Execute? (y/n)".

5. On confirm:
   ```
   bash scripts/alpaca.sh order '{"symbol":"SYM","qty":"N","side":"buy|sell","type":"market","time_in_force":"day"}'
   ```

6. For BUYs, immediately place 10% trailing stop GTC:
   ```
   bash scripts/alpaca.sh order '{"symbol":"SYM","qty":"N","side":"sell","type":"trailing_stop","trail_percent":"10","time_in_force":"gtc"}'
   ```

7. Log to memory/TRADE-LOG.md with full thesis, entry, stop, target, R:R.

8. `bash scripts/slack.sh` with trade details.
