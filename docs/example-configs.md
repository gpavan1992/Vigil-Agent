# VIGIL — Example Configurations

Ready-to-paste `agent_config` rows for common use cases.

---

## Legal AI / LegalTech

```sql
INSERT INTO agent_config (pm_name, your_product_name, your_product_description, industry, watch_keywords, competitors, telegram_chat_id)
VALUES (
  'Your Name',
  'Your Legal AI Product',
  'AI-native legal work platform for law firms and in-house teams.',
  'legal AI / LegalTech',
  ARRAY['MCP', 'agentic', 'legal AI', 'copilot', 'contract analysis', 'document review'],
  '[
    {"name": "Harvey", "blog_url": "https://www.harvey.ai/blog", "linkedin_handle": "harvey-ai", "g2_slug": "harvey", "custom_rss": []},
    {"name": "Lexis+ AI", "blog_url": "https://www.lexisnexis.com/en-us/products/lexis-plus-ai.page", "linkedin_handle": "lexisnexis", "g2_slug": "lexis-plus-ai", "custom_rss": []},
    {"name": "Ironclad", "blog_url": "https://ironcladapp.com/blog", "linkedin_handle": "ironcladapp", "g2_slug": "ironclad", "custom_rss": []}
  ]'::jsonb,
  'YOUR_TELEGRAM_CHAT_ID'
);
```

---

## Frontier AI Models

```sql
INSERT INTO agent_config (pm_name, your_product_name, your_product_description, industry, watch_keywords, competitors, telegram_chat_id)
VALUES (
  'Your Name',
  'Claude',
  'Anthropic flagship AI assistant and API, used by developers and enterprises worldwide.',
  'frontier AI / large language models',
  ARRAY['model release', 'benchmark', 'pricing', 'open source', 'agentic', 'MCP', 'API'],
  '[
    {"name": "OpenAI", "blog_url": "https://openai.com/blog", "linkedin_handle": "openai", "g2_slug": "chatgpt", "custom_rss": []},
    {"name": "Google DeepMind", "blog_url": "https://blog.google/technology/ai", "linkedin_handle": "google-deepmind", "g2_slug": "google-gemini", "custom_rss": []},
    {"name": "Meta AI", "blog_url": "https://ai.meta.com/blog", "linkedin_handle": "meta", "g2_slug": "meta-ai", "custom_rss": []},
    {"name": "Mistral AI", "blog_url": "https://mistral.ai/news", "linkedin_handle": "mistral-ai", "g2_slug": "mistral-ai", "custom_rss": []},
    {"name": "xAI", "blog_url": "https://x.ai/news", "linkedin_handle": "xai-corp", "g2_slug": "grok", "custom_rss": []},
    {"name": "DeepSeek", "blog_url": "https://www.deepseek.com", "linkedin_handle": "deepseek-ai", "g2_slug": "deepseek", "custom_rss": []}
  ]'::jsonb,
  'YOUR_TELEGRAM_CHAT_ID'
);
```

---

## Enterprise HR Tech

```sql
INSERT INTO agent_config (pm_name, your_product_name, your_product_description, industry, watch_keywords, competitors, telegram_chat_id)
VALUES (
  'Your Name',
  'Your HR Product',
  'AI-powered HR platform for talent acquisition, performance management, and employee experience.',
  'enterprise HR technology / HCM',
  ARRAY['AI recruiting', 'skills matching', 'employee experience', 'performance AI', 'HRIS'],
  '[
    {"name": "Workday", "blog_url": "https://blog.workday.com", "linkedin_handle": "workday", "g2_slug": "workday", "custom_rss": []},
    {"name": "Rippling", "blog_url": "https://www.rippling.com/blog", "linkedin_handle": "rippling", "g2_slug": "rippling", "custom_rss": []},
    {"name": "Lattice", "blog_url": "https://lattice.com/blog", "linkedin_handle": "latticeapp", "g2_slug": "lattice", "custom_rss": []}
  ]'::jsonb,
  'YOUR_TELEGRAM_CHAT_ID'
);
```

---

## Indian Fintech

```sql
INSERT INTO agent_config (pm_name, your_product_name, your_product_description, industry, watch_keywords, competitors, telegram_chat_id)
VALUES (
  'Your Name',
  'Your Fintech Product',
  'Consumer fintech platform for payments, lending, and wealth management in India.',
  'Indian fintech / digital payments',
  ARRAY['UPI', 'BNPL', 'digital lending', 'neo bank', 'wealth management', 'SEBI', 'RBI'],
  '[
    {"name": "Razorpay", "blog_url": "https://razorpay.com/blog", "linkedin_handle": "razorpay", "g2_slug": "razorpay", "custom_rss": []},
    {"name": "PhonePe", "blog_url": "https://www.phonepe.com/blog", "linkedin_handle": "phonepe", "g2_slug": "phonepe", "custom_rss": []},
    {"name": "Zerodha", "blog_url": "https://zerodha.com/z-connect", "linkedin_handle": "zerodha", "g2_slug": "zerodha", "custom_rss": []}
  ]'::jsonb,
  'YOUR_TELEGRAM_CHAT_ID'
);
```
