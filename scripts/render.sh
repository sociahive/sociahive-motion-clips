#!/bin/bash
# Renders the clips from the SociaHive monorepo (run from its root, after npm ci).
# Needs remotion.config.ts at the repo root and src/remotion/launch/stubs/avatar-src.ts
# (both untracked in the monorepo as of 2026-10-18), plus `npm run video:css`.
# Needs ~3 GB free disk (frames are written to the temp folder before stitching).
set -e
OUT="${1:?usage: render.sh <clips-repo>/clips}"
R=./node_modules/.bin/remotion
ENV=$(mktemp)
# The bundle imports the browser Supabase client; it is never called in a render.
printf 'NEXT_PUBLIC_SUPABASE_URL=https://example.supabase.co\nNEXT_PUBLIC_SUPABASE_ANON_KEY=render-placeholder\n' > "$ENV"
B=$(mktemp -d)
$R bundle src/remotion/index.ts --out-dir="$B"
while read -r id a b; do
  e=$((b-1))
  $R render "$B" SocialAiLayerLaunch "$OUT/$id.mp4" --frames=$a-$e --muted --codec=h264 --crf=18 --env-file="$ENV" --log=error
  $R render "$B" SocialAiLayerLaunch "$OUT/$id.webm" --frames=$a-$e --muted --codec=vp9 --crf=28 --env-file="$ENV" --log=error
done <<LIST
brand_logo_category 75 150
agentic_publish_everywhere 150 300
agentic_bulk_schedule_calendar 300 480
agentic_comment_to_dm_funnel 480 660
normal_connect_any_agent 660 780
agentic_confirm_and_scopes 780 900
normal_results_outcome_strip 900 990
brand_mcp_api_cli 990 1065
brand_end_card_cta 1065 1170
LIST
# Full film with its music and sound effects (Mixkit licence: fine inside a video).
$R render "$B" SocialAiLayerLaunch "$OUT/full_social_ai_layer_launch.mp4" --codec=h264 --crf=20 --env-file="$ENV" --log=error
rm -rf "$B" "$ENV"
