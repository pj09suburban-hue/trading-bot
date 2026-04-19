# Trading Strategy

## Mission
Beat the S&P 500 over the challenge window. Stocks only — no options, ever.

## Capital & Constraints
- Starting capital: ~$10,000
- Platform: Alpaca
- Instruments: Stocks ONLY
- PDT limit: 3 day trades per 5 rolling days (account < $25k)

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

## Entry Checklist
Before placing any buy, document all four:
- [ ] Specific catalyst today?
- [ ] Sector in momentum?
- [ ] Stop level (7–10% below entry)
- [ ] Target (minimum 2:1 R:R)

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
