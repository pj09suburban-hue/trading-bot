# Trading Strategy

## Mission
Beat the S&P 500 over the challenge window. Stocks only — no options, ever.

## Capital & Constraints
- **Current (paper):** ~$100,000 on Alpaca paper account — all rules scale proportionally (20% max per position = $20k)
- **Future (live):** ~a few hundred dollars in a personal Alpaca account once paper performance is validated. At that scale, the current sizing rules break (5–6 positions × 20% = ~$60/position, too small for most stocks) — strategy will need a rewrite before going live.
- **Validation criterion (set 2026-05-05):** ≥6 closed trades AND ≥4 full trading weeks completed. Bot stays on paper until both are met. Rationale: exit/stop discipline must be observed under real conditions; unrealized paper P&L is not a validation signal. As of 2026-05-05: 0 closed trades, 2 full weeks done — gating factor is closed-trade count.
- Platform: Alpaca (paper now, live later)
- Instruments: Stocks ONLY
- PDT limit: 3 day trades per 5 rolling days (account < $25k) — applies once live

## Core Rules
1. NO OPTIONS — ever
2. 75–85% deployed at all times
3. 5–6 positions max, 20% of equity max per position
4. 10% trailing stop on every position as a real GTC order — never mental
5. Cut losers at -7% manually. No hoping, no averaging down.
6. Tighten trail to 7% at +15%, to 5% at +20%
7. Never tighten within 3% of current price; never move a stop down
8. Max 3 new trades per week
9. Follow sector momentum — don't force a thesis if the sector is rolling over
10. Exit a sector after 2 consecutive failed trades in that sector
11. Patience > activity — a week with zero trades can be the right answer
12. Post-earnings entries (entry within 3 days of earnings print): set initial trailing stop at 7% instead of 10%. The -7% manual cut rule still applies normally. Rationale: sell-the-news dynamics produce elevated near-term volatility; 3 instances confirmed (CEG -9.06%, NVDA -7.62%, AVGO -6.06%) across weeks 4–7. (Added 2026-06-05)

## Entry Checklist
Before placing any buy, document all four:
- [ ] Specific catalyst today?
- [ ] Sector in momentum?
- [ ] Stop level (7–10% below entry)
- [ ] Target (minimum 2:1 R:R)
- [ ] Live quote verified via `bash scripts/alpaca.sh quote SYM` — confirm fill price × shares ≤ 20% equity before submitting (gap-up protection, added 2026-05-01)

## Buy-Side Gate (all must pass)
- Total positions after fill ≤ 6
- Trades this week ≤ 3
- Position cost ≤ 20% of equity
- Position cost ≤ available cash
- PDT day-trade count < 3
- Catalyst documented in today's RESEARCH-LOG
- Instrument is a stock

## Sell-Side Rules
- Unrealized loss ≤ -7% → close immediately
- Thesis broken → close even before -7%
- Up ≥ +20% → tighten trail to 5%
- Up ≥ +15% → tighten trail to 7%
- 2 consecutive failed trades in a sector → exit all positions in that sector
