# Discord Setup Checklist for Main-Agent Approvals

## Goal

Create one simple Discord entry point so the user can talk to the main agent from a phone and approve worker results safely.

## Recommended setup

Use:

- one private Discord server
- one bot
- one primary channel or DM path for the main agent
- internal worker delegation behind the scenes

Do not start with separate worker-facing channels.

## Step 1 - create the bot

In the Discord Developer Portal:

- create a new application
- add a bot
- enable Message Content Intent
- enable Server Members Intent
- copy the bot token

Recommended permissions:

- View Channels
- Send Messages
- Read Message History
- Embed Links
- Attach Files
- Add Reactions

Avoid Administrator.

## Step 2 - invite it to a private server

Recommended pattern:

- private server that you control
- at first, one main channel for agent interaction
- optionally also use DMs

Collect and save:

- Server ID
- your User ID
- one channel ID for the main channel

## Step 3 - configure OpenClaw safely

Set the bot token as an environment secret on the gateway host.
Do not paste the token into normal chat.

Recommended pattern from the OpenClaw docs:

```bash
export DISCORD_BOT_TOKEN="YOUR_BOT_TOKEN"
openclaw config set channels.discord.token --ref-provider default --ref-source env --ref-id DISCORD_BOT_TOKEN
openclaw config set channels.discord.enabled true --strict-json
openclaw gateway restart
```

## Step 4 - pair DM access first

Use DM pairing first because it is the simplest and safest path.

From Discord:

- DM the bot
- receive a pairing code

Approve with:

```bash
openclaw pairing list discord
openclaw pairing approve discord <CODE>
```

Once paired, DMs can serve as the highest-trust mobile approval path.

## Step 5 - add one guild channel for the main agent

After DM access works, allow one channel in your private server for the main agent.

Recommended settings:

- `groupPolicy: allowlist`
- allowlist only your server
- allowlist only your user
- allowlist only one starting channel
- `requireMention: true` at first

This keeps the bot from becoming noisy or too open.

## Step 6 - approval language

Keep early approvals explicit.

Good examples:

- "approve this repo change"
- "approve this Mealie preview for testing"
- "approve moving to a production promotion plan"
- "approve this documentation update"

Avoid vague approvals like:

- "sure"
- "go ahead"
- "do it"

for anything production-impacting unless the main agent is clearly summarizing a single pending action.

## Step 7 - what to allow early

Safe early Discord use cases:

- planning
- reviewing diffs
- reviewing preview links
- approving repo documentation changes
- approving a Mealie preview build for review

Do not allow early:

- direct production deployment from Discord
- deleting backups from Discord
- rotating credentials from Discord
- direct Home Assistant Samba writes from Discord
- replacing the production Mealie path with a dev build from a casual message

## Best operating model

- DM = highest-trust approval path
- one private server channel = day-to-day conversation path
- main agent = only user-facing agent
- workers = internal implementation roles
