---
name: sociahive-motion-clips
description: Short 1080p product clips of SociaHive (AI publishing, bulk scheduling, comment-to-DM, any MCP agent, permission checks, results, brand cards) that an agent can drop into promo videos, launch posts and walkthroughs. Use when a video about SociaHive needs product footage.
---

# SociaHive Motion Clips

Short clips cut from the SociaHive launch film. Every product shot is the real SociaHive
app rendered with sample data, and every scene shows something live for paying users.
Use them to show SociaHive in promo videos, social posts, launch videos and demos.

# What is SociaHive?

SociaHive is the Social AI Layer: it lets your AI (Claude, ChatGPT, Claude Code or any MCP
client) publish and schedule posts across Instagram, Facebook, X, LinkedIn, TikTok and more,
build comment-to-DM automations that capture leads, and read the results back.
Website: https://www.sociahive.com. Connect your AI: https://www.sociahive.com/connect-ai.

## Library

All clips: 1920x1080, 30 fps, silent, each in `clips/` as `.mp4` (H.264) and `.webm` (VP9).
`clips.json` has the same list in machine-readable form.

| File | Seconds | What it shows | When to use |
| --- | ---: | --- | --- |
| `brand_logo_category` | 2.5 | Logo, then "The Social AI Layer" | Opener, or a brand beat between sections |
| `agentic_publish_everywhere` | 5.0 | An AI chat posts one photo to Instagram, X and TikTok; tool calls tick | Showing that an AI can publish for you |
| `agentic_bulk_schedule_calendar` | 6.0 | A spreadsheet of ideas in chat, then the calendar fills with posts (the clip shows a sample run: 80 ideas, 60 posts) | Bulk scheduling, content calendars |
| `agentic_comment_to_dm_funnel` | 6.0 | Comment-to-DM steps next to the Instagram DM thread that captures an email | Lead capture, Instagram automation, "turn posts into leads" |
| `normal_connect_any_agent` | 4.0 | Claude, ChatGPT, Claude Code and any MCP client switch to Connected | MCP support, "works with your AI" |
| `agentic_confirm_and_scopes` | 4.0 | Publish needs a confirm; a read-only key is refused | Safety, permissions, trust |
| `normal_results_outcome_strip` | 3.0 | Counters for posts, impressions, comments, leads (sample numbers) | Analytics and results |
| `brand_mcp_api_cli` | 2.5 | Full-screen card, split-flap board "MCP · API · CLI" | Developer videos, or a transition |
| `brand_end_card_cta` | 3.5 | End card with feature pills, "Connect your AI", sociahive.com/connect-ai | Outro and call to action |
| `full_social_ai_layer_launch` (mp4 only) | 39.0 | The whole launch film, with music and sound effects | Posting the film as is |

## Naming

- `agentic_*`: an AI does the work (chat, tool calls).
- `normal_*`: a product screen or interaction.
- `brand_*`: logo, title and end cards.

## Usage notes

- Keep file names as they are when you reference clips from scripts or compositions.
- Scene clips are silent; add your own music. The music in the full film is Mixkit
  (free for use inside a video, not as a separate file).
- Clips from `agentic_publish_everywhere` to `normal_results_outcome_strip` carry a small
  frame: the logo top left, a chapter counter ("01 / 06" to "06 / 06") top right, and "The Social AI Layer"
  and "sociahive.com" at the bottom. Crop or cover the counter if it reads out of order in
  your edit.
- Most clips fade in at the start and fade out at the end, so they cut together cleanly.
- The results numbers are sample numbers and the clip says so; do not present them as
  customer results.
- Do not alter, recolour or crop into the SociaHive logo.
