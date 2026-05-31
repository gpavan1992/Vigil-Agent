import { serve } from "https://deno.land/std@0.168.0/http/server.ts"

/**
 * VIGIL Telegram Proxy
 *
 * Accepts GET requests from the VIGIL agent (which can only make GET requests
 * via web_fetch) and forwards them as POST requests to the Telegram Bot API.
 *
 * Usage:
 *   GET /telegram-proxy?chat_id=123456789&text=Your+message+here
 *
 * Set TELEGRAM_BOT_TOKEN as a Supabase Edge Function secret, or hardcode it
 * below for quick testing (not recommended for production).
 */

serve(async (req) => {
  const url = new URL(req.url)
  const text = url.searchParams.get("text")
  const chat_id = url.searchParams.get("chat_id")

  const BOT_TOKEN = Deno.env.get("TELEGRAM_BOT_TOKEN")

  if (!BOT_TOKEN) {
    return new Response(
      JSON.stringify({ ok: false, error: "TELEGRAM_BOT_TOKEN not configured" }),
      { status: 500, headers: { "Content-Type": "application/json" } }
    )
  }

  if (!text) {
    return new Response(
      JSON.stringify({ ok: false, error: "Missing required parameter: text" }),
      { status: 400, headers: { "Content-Type": "application/json" } }
    )
  }

  if (!chat_id) {
    return new Response(
      JSON.stringify({ ok: false, error: "Missing required parameter: chat_id" }),
      { status: 400, headers: { "Content-Type": "application/json" } }
    )
  }

  const response = await fetch(
    `https://api.telegram.org/bot${BOT_TOKEN}/sendMessage`,
    {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        chat_id,
        text: text.substring(0, 4096),
      }),
    }
  )

  const data = await response.json()
  return new Response(JSON.stringify(data), {
    headers: { "Content-Type": "application/json" },
  })
})
