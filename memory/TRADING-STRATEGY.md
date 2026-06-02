# Trading Strategy

## Mission
Beat the S&P 500 over the challenge window. Stocks only — no options, ever.

## Capital & Constraints
- **Account:** Alpaca **live** brokerage. Initial deposit $700 (2026-06-01). Capital will be added regularly from commissions — bot reads current equity at every routine via `bash scripts/alpaca.sh account` and sizes accordingly.
- **All sizing rules are percentage-based** so they auto-scale with deposits — no edits needed when topping up.
- Platform: Alpaca live
- Instruments: Stocks ONLY — **whole shares only**, no fractional, no notional orders (preserves GTC trail-stop discipline; fractional shares cannot hold stop orders on Alpaca).
- PDT limit: 3 day trades per 5 rolling days while account < $25k — auto-disappears once over.

## Core Rules
1. NO OPTIONS — ever
2. **Whole shares only** — no fractional, no notional orders
3. 60–85% capital deployed at all times (wider band accommodates share-price granularity at small account sizes; non-binding once account is large)
4. 5–6 positions max, 20% of equity max per position
5. **Skip entry if 1 whole share at current price > 20% of equity** — natural universe filter that auto-widens as account grows
6. **Max 1 position per macro-thesis cluster** (e.g., one energy bet, not two; one AI-power bet, not two)
7. 10% trailing stop on every position as a real GTC order — never mental
8. Cut losers at -7% manually. No hoping, no averaging down.
9. Tighten trail to 7% at +15%, to 5% at +20%
10. Never tighten within 3% of current price; never move a stop down
11. Max 3 new trades per week
12. Follow sector momentum — don't force a thesis if the sector is rolling over
13. Exit a sector after 2 consecutive failed trades in that sector
14. Patience > activity — a week with zero trades can be the right answer

## Entry Checklist
Before placing any buy, document all five:
- [ ] Specific catalyst today?
- [ ] Sector in momentum?
- [ ] Stop level (7–10% below entry)
- [ ] Target (minimum 2:1 R:R)
- [ ] Live quote verified via `bash scripts/alpaca.sh quote SYM` — confirm 1-share price ≤ 20% equity AND fill price × shares ≤ 20% equity (gap-up protection)
- [ ] Entry price ≥ 0.5% below current-day HWM (or this is a pullback-day re-entry after the catalyst)

## Buy-Side Gate (all must pass)
- Total positions after fill ≤ 6
- Trades this week ≤ 3
- Position cost ≤ 20% of equity
- 1 whole share at current price ≤ 20% of equity (universe filter)
- Position cost ≤ available cash
- PDT day-trade count < 3 (if account < $25k)
- Catalyst documented in today's RESEARCH-LOG
- Instrument is a stock — whole share, no fractional/notional
- No existing position in the same macro-thesis cluster
- Entry price ≥ 0.5% below current-day HWM (or documented as pullback re-entry)

## Sell-Side Rules
- Unrealized loss ≤ -7% → close immediately
- Thesis broken → close even before -7%
- Up ≥ +20% → tighten trail to 5%
- Up ≥ +15% → tighten trail to 7%
- 2 consecutive failed trades in a sector → exit all positions in that sector
