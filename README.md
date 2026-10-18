<p align="center">
  <a href="https://www.sociahive.com">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/sociahive/.github/main/assets/brand/logo-dark.svg">
      <img alt="SociaHive" src="https://raw.githubusercontent.com/sociahive/.github/main/assets/brand/logo-light.svg" width="220">
    </picture>
  </a>
</p>

<p align="center">Short 1080p product clips of SociaHive for your videos, posts and ads.</p>

<p align="center">
  <a href="https://www.sociahive.com">Website</a> ·
  <a href="https://www.sociahive.com/connect-ai">Connect your AI</a> ·
  <a href="https://www.sociahive.com/brand">Brand</a>
</p>

# SociaHive motion clips

Short 1080p product clips of [SociaHive](https://www.sociahive.com), the Social AI Layer,
for anyone making a video about it: AI publishing, bulk scheduling, comment-to-DM lead
capture, any MCP agent, permission checks, results, and brand cards.

The clip list, with what each shows and when to use it, is in [`SKILL.md`](SKILL.md).
The same list for scripts is in [`clips.json`](clips.json) (id, files, frames, seconds,
width, height, fps, bytes_mp4, bytes_webm, description, tags). Every clip is 1920x1080,
30 fps, silent, as `.mp4` (H.264) and `.webm` (VP9). The whole folder is about 16 MB.

**Preview:** an animated preview is coming. Until then, open any `.mp4` in [`clips/`](clips/) to watch it.

## The clips

| Clip | Seconds | What it shows |
|---|---|---|
| `brand_logo_category` | 2.5 | The SociaHive logo and "The Social AI Layer". |
| `agentic_publish_everywhere` | 5 | "Give your AI access to" with the platform names rolling. |
| `agentic_bulk_schedule_calendar` | 6 | A spreadsheet of ideas in chat, then the SociaHive calendar fills with posts. |
| `agentic_comment_to_dm_funnel` | 6 | A comment-to-DM automation as plain steps. |
| `normal_connect_any_agent` | 4 | Claude, ChatGPT, Claude Code and any MCP client connecting. |
| `agentic_confirm_and_scopes` | 4 | Publishing asks for confirmation; a read-only key is refused a delete. |
| `normal_results_outcome_strip` | 3 | Results coming back to your AI: posts, impressions, comments and leads (sample numbers). |
| `brand_mcp_api_cli` | 2.5 | Full-screen card ending on MCP, API and CLI. |
| `brand_end_card_cta` | 3.5 | End card with the logo, feature pills and the Connect your AI link. |

## Use it as an agent skill

Copy or link this folder into your agent's skills folder (for example
`~/.claude/skills/sociahive-motion-clips`). The agent reads `SKILL.md` and picks clips by
what they show.

## Use with Remotion

Put `clips/` under your project's `public/` folder, then:

```tsx
import { OffthreadVideo, Sequence, staticFile } from 'remotion'

export const Promo = () => (
  <>
    <Sequence durationInFrames={150}>
      <OffthreadVideo src={staticFile('clips/agentic_publish_everywhere.mp4')} />
    </Sequence>
    <Sequence from={150} durationInFrames={180}>
      <OffthreadVideo src={staticFile('clips/agentic_comment_to_dm_funnel.mp4')} />
    </Sequence>
  </>
)
```

At 30 fps, a clip's frame count is `seconds * 30` from `clips.json`.

## Use with HyperFrames (or any HTML video tool)

Reference the `.webm` file in a `<video>` element, muted, with the duration from
`clips.json`:

```html
<video src="clips/normal_connect_any_agent.webm" muted playsinline data-duration="4"></video>
```

## Use with ffmpeg

Join clips end to end:

```bash
printf "file 'clips/%s.mp4'\n" brand_logo_category agentic_bulk_schedule_calendar brand_end_card_cta > list.txt
ffmpeg -f concat -safe 0 -i list.txt -c copy promo.mp4
```

Make a vertical 1080x1920 version with the clip centred on white:

```bash
ffmpeg -i clips/agentic_comment_to_dm_funnel.mp4 \
  -vf "scale=1080:-2,pad=1080:1920:(ow-iw)/2:(oh-ih)/2:white" vertical.mp4
```

Add music:

```bash
ffmpeg -i promo.mp4 -i music.mp3 -shortest -c:v copy -c:a aac promo-with-music.mp4
```

## How the clips are made

They are cut from the `SocialAiLayerLaunch` Remotion composition in the SociaHive
monorepo, which renders the real app components with sample data.
`scripts/render.sh` re-renders them from a monorepo checkout.

## Licence

See [`LICENSE.md`](LICENSE.md). In short: free to use to promote or show SociaHive,
in any video, post or ad. Do not modify the SociaHive logo.
