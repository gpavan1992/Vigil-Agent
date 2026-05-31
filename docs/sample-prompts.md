# VIGIL — Sample Prompts

Copy-paste these prompts directly into your VIGIL agent session.

---

## Weekly Digest (default)

```
Run your weekly competitive intelligence digest
```

---

## Industry-Specific Weekly Runs

**Legal AI:**
```
Run weekly digest for legal AI — last 7 days only. Competitors: Harvey, Lexis+ AI, Ironclad. My product is CoCounsel.
```

**Frontier AI Models (split into two runs to avoid rate limits):**

Run 1:
```
Deep dive on frontier AI models this week (last 7 days only) — OpenAI, Google DeepMind, Mistral. Focus on model releases, benchmark claims, pricing moves, open source drops. My product is Claude. Limit to past 7 days only.
```

Run 2 (wait 2-3 minutes after Run 1):
```
Deep dive on frontier AI models this week (last 7 days only) — Meta AI, xAI, DeepSeek. Focus on model releases, benchmark claims, pricing moves, open source drops. My product is Claude. Limit to past 7 days only.
```

**Enterprise HR Tech:**
```
Run weekly digest for enterprise HR tech — last 7 days only. Competitors: Workday, Rippling, Lattice. My product is [your product]. Limit to past 7 days only.
```

**Indian Fintech:**
```
Run weekly digest for Indian fintech — last 7 days only. Competitors: Razorpay, PhonePe, Zerodha. My product is [your product]. Limit to past 7 days only.
```

---

## Focused Deep Dives

**Single competitor threat assessment:**
```
Is [Competitor] a threat right now? Deep dive on their last 7 days — product moves, partnerships, user sentiment. My product is [your product].
```

**Funding and M&A pulse:**
```
Any major funding rounds, acquisitions, or partnerships in [your industry] this week (last 7 days only)? My product is [your product].
```

**User voice only:**
```
What are users saying about [Competitor] this week on G2 and Reddit (last 7 days)? Focus on complaints — what unmet needs do they reveal? My product is [your product].
```

**Pricing moves only:**
```
Any pricing changes or new tiers from [Competitor A], [Competitor B], or [Competitor C] in the last 7 days? My product is [your product].
```

---

## Tips

- **Rate limits:** If you get an API rate limit error, split runs across 2-3 competitors at a time and wait 2-3 minutes between runs.
- **7-day window:** Always include "last 7 days only" to keep runs focused and token-efficient.
- **Override config:** You can override competitors inline without changing your Supabase config — just name them in the prompt.
