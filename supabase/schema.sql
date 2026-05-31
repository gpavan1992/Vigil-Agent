-- VIGIL Competitive Intelligence Agent
-- Database Schema
-- Run this in your Supabase SQL editor before first use

-- ============================================================
-- agent_config
-- ============================================================
CREATE TABLE IF NOT EXISTS agent_config (
  id                       uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  pm_name                  text NOT NULL,
  your_product_name        text NOT NULL,
  your_product_description text,
  industry                 text NOT NULL,
  watch_keywords           text[] DEFAULT '{}',
  competitors              jsonb NOT NULL DEFAULT '[]',
  telegram_chat_id         text,
  created_at               timestamptz DEFAULT now(),
  updated_at               timestamptz DEFAULT now()
);

-- ============================================================
-- signal_log
-- ============================================================
CREATE TABLE IF NOT EXISTS signal_log (
  id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  run_date        date NOT NULL DEFAULT CURRENT_DATE,
  competitor_name text NOT NULL,
  channel         text NOT NULL,
  signal_type     text NOT NULL,
  headline        text NOT NULL,
  source_url      text,
  source_date     date,
  base_score      integer CHECK (base_score BETWEEN 1 AND 5),
  final_score     integer CHECK (final_score BETWEEN 1 AND 10),
  surfaced        boolean DEFAULT false,
  notes           text,
  created_at      timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS signal_log_run_date_idx    ON signal_log (run_date DESC);
CREATE INDEX IF NOT EXISTS signal_log_competitor_idx  ON signal_log (competitor_name);
CREATE INDEX IF NOT EXISTS signal_log_final_score_idx ON signal_log (final_score DESC);

-- ============================================================
-- weekly_digest
-- ============================================================
CREATE TABLE IF NOT EXISTS weekly_digest (
  id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  run_date        date NOT NULL DEFAULT CURRENT_DATE,
  digest_markdown text NOT NULL,
  signal_count    integer DEFAULT 0,
  priority_count  integer DEFAULT 0,
  created_at      timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS weekly_digest_run_date_idx ON weekly_digest (run_date DESC);

-- ============================================================
-- trend_memory
-- ============================================================
CREATE TABLE IF NOT EXISTS trend_memory (
  id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  competitor_name text NOT NULL,
  pattern_label   text NOT NULL,
  signal_type     text,
  signal_count    integer DEFAULT 1,
  first_seen      date DEFAULT CURRENT_DATE,
  last_confirmed  date DEFAULT CURRENT_DATE,
  notes           text,
  created_at      timestamptz DEFAULT now(),
  updated_at      timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS trend_memory_competitor_idx ON trend_memory (competitor_name);

-- ============================================================
-- Example agent_config — uncomment and edit before running
-- ============================================================

-- INSERT INTO agent_config (
--   pm_name,
--   your_product_name,
--   your_product_description,
--   industry,
--   watch_keywords,
--   competitors,
--   telegram_chat_id
-- ) VALUES (
--   'Your Name',
--   'Your Product',
--   'One sentence description of what your product does.',
--   'Your Industry (e.g. legal AI, fintech, enterprise HR)',
--   ARRAY['keyword1', 'keyword2', 'keyword3'],
--   '[
--     {
--       "name": "Competitor A",
--       "blog_url": "https://competitora.com/blog",
--       "linkedin_handle": "competitora",
--       "g2_slug": "competitor-a",
--       "custom_rss": []
--     },
--     {
--       "name": "Competitor B",
--       "blog_url": "https://competitorb.com/blog",
--       "linkedin_handle": "competitorb",
--       "g2_slug": "competitor-b",
--       "custom_rss": []
--     }
--   ]'::jsonb,
--   'YOUR_TELEGRAM_CHAT_ID'
-- );
