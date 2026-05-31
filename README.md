# VIGIL — Autonomous Competitive Intelligence Agent

> Replace manual competitor research. Run every Monday. Get one digest: "What changed this week, and what does it mean for my product?"

VIGIL is a fully autonomous competitive intelligence agent built on Claude's managed agent platform. It monitors LinkedIn, blogs, press, and user voice (G2/Reddit/Capterra) across a configurable competitor list, scores every signal, routes priority signals through specialist sub-agents, and delivers a ranked digest to Telegram every week.

**Fully industry-agnostic.** Zero hardcoded domain knowledge. Configure once for legal AI, deploy the same YAML for fintech, SaaS, or consumer health.

Engineered with Claude Code.

---

## How It Works

```
agent_config (Supabase)
        ↓
VIGIL loads config at runtime
        ↓
4 signal channels in parallel:
  LinkedIn → Blogs/Changelogs → Press/News → User Voice (G2/Reddit)
        ↓
Score every signal (1–10)
  7–10 → Specialist sub-agent analysis
  4–6  → Secondary signal (one-liner)
  1–3  → Log only
        ↓
Compose digest → Save to Supabase → Deliver via Telegram (4 messages)
        ↓
Update trend_memory (pattern tracking across weeks)
```

---

## Stack

| Layer | Tool |
|-------|------|
| Agent runtime | Claude Managed Agents (Agents SDK YAML) |
| Engineering | Claude Code |
| Database | Supabase (Postgres) |
| Telegram proxy | Supabase Edge Function (Deno) |
| Web research | Claude built-in web_search + web_fetch |
| Memory | Supabase `trend_memory` table |

---

## Quick Start

### 1. Clone the repo

```bash
git clone https://github.com/gpavan1992/Vigil-Agent.git
cd Vigil-Agent
```

### 2. Set up Supabase

Create a new Supabase project, then paste `supabase/schema.sql` into the Supabase SQL editor.

### 3. Configure your competitors

Insert your config into the `agent_config` table:

```sql
INSERT INTO agent_config (
  pm_name,
  your_product_name,
  your_product_description,
  industry,
  watch_keywords,
  competitors,
  telegram_chat_id
) VALUES (
  'Your Name',
  'Your Product',
  'One sentence description of your product.',
  'Your industry (e.g. legal AI, fintech, HR tech)',
  ARRAY['keyword1', 'keyword2', 'keyword3'],
  '[
    {"name": "Competitor A", "blog_url": "https://...", "linkedin_handle": "...", "g2_slug": "...", "custom_rss": []},
    {"name": "Competitor B", "blog_url": "https://...", "linkedin_handle": "...", "g2_slug": "...", "custom_rss": []}
  ]'::jsonb,
  'YOUR_TELEGRAM_CHAT_ID'
);
```

### 4. Deploy the Telegram proxy

```bash
npx supabase login
npx supabase functions deploy telegram-proxy --project-ref YOUR_PROJECT_REF
```

Set your bot token in the Supabase dashboard under **Settings → Edge Function Secrets**:
- Name: `TELEGRAM_BOT_TOKEN`
- Value: your bot token from @BotFather

### 5. Create your Telegram bot

1. Message `@BotFather` on Telegram
2. Send `/newbot` and follow the prompts
3. Copy the bot token
4. Find your chat ID by messaging your bot, then calling:
   ```
   https://api.telegram.org/botYOUR_TOKEN/getUpdates
   ```
5. Update `agent_config` with your `telegram_chat_id`

### 6. Load the VIGIL YAML

Paste the contents of `vigil.yaml` into your Claude Managed Agents dashboard and save.

### 7. Run VIGIL

Trigger manually with:

```
Run your weekly competitive intelligence digest
```

Or schedule it for Monday 08:00 in your timezone via the agent scheduler.

---

## Configuration Reference

| Field | Type | Description |
|-------|------|-------------|
| `pm_name` | text | Your name (used in sub-agent prompts) |
| `your_product_name` | text | Your product name |
| `your_product_description` | text | One sentence description |
| `industry` | text | Industry context for research framing |
| `watch_keywords` | text[] | Keywords that boost signal scores |
| `competitors` | jsonb | Array of competitor objects |
| `telegram_chat_id` | text | Your Telegram chat ID for delivery |

**Competitor object:**
```json
{
  "name": "Competitor Name",
  "blog_url": "https://competitor.com/blog",
  "linkedin_handle": "competitor-handle",
  "g2_slug": "competitor-name",
  "custom_rss": []
}
```

---

## Database Schema

| Table | Purpose |
|-------|---------|
| `agent_config` | Runtime configuration — competitors, keywords, Telegram ID |
| `signal_log` | Every signal found each run, scored and classified |
| `weekly_digest` | Full digest markdown saved per run |
| `trend_memory` | Patterns tracked across weeks — the agent's memory |

---

## Scoring Logic

```
Final score (1–10):
  base score (1–5)
  +2 if signal is directly relevant to your product
  +1 per watch_keyword match
  +1 if direct competitor
  +1 if confirms existing trend_memory pattern
  cap at 10

Routing:
  7–10 → priority → specialist sub-agent analysis
  4–6  → secondary → one-liner in digest
  1–3  → log only, never surfaced
```

---

## Example Configs

See `docs/example-configs.md` for ready-to-paste configs for legal AI, frontier AI models, enterprise HR tech, and Indian fintech.

---

## Limitations

- Cannot access paywalled content (The Information, private LinkedIn posts)
- G2 reviews sourced via web search — no official API
- LinkedIn signals come from web search, not the LinkedIn API
- Rate limits on the Claude API may interrupt runs with many competitors (>5) — retry if this happens
- Telegram delivery requires sending `/start` to your bot first

---

## License

MIT
