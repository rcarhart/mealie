# Discord Channel for Agent Access and Approvals

## Goal

Allow the user to talk to the main agent from a phone and review worker results in a Discord channel without granting broad autonomous production power.

## Recommended pattern

- connect OpenClaw to Discord
- use one primary channel or direct-message path for talking to the main agent
- keep the main agent as the approval and delegation front door
- let workers remain an internal implementation detail unless there is a clear reason to expose them separately

## Safety recommendations

Start with:

- one main Discord entry point
- human approval required before impactful actions
- read-mostly worker behavior
- no hidden production mutations triggered from casual chat

Avoid early:

- separate channels for every worker
- broad write access from mobile-first conversations
- direct production deployment from a worker completion event
- implicit approvals from vague messages

## Suggested workflow

1. user asks the main agent for work in Discord
2. main agent delegates internally when useful
3. worker produces a plan, diff, preview link, or audit summary
4. main agent returns an approval-ready summary
5. user approves explicitly before production-impacting actions

## Good early approval cases

- approve a repo change
- approve a preview build for Mealie review
- approve a safe documentation update
- approve a production promotion plan after preview review

## Not recommended as early mobile approvals

- deleting backups
- rotating credentials
- broad infrastructure changes
- direct Home Assistant live writes without review
- replacing the production Mealie path with a dev build

## Setup note

Document the Discord channel configuration and approval language before enabling any production-impacting workflows.
Keep the first version simple and explicit.
