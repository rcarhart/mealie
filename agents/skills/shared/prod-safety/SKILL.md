---
name: prod-safety
description: Apply conservative production safety rules for this homelab. Use when work may affect live systems, Home Assistant, Docker apps, backups, secrets, or infrastructure; when deciding between read-only review and mutation; or when planning any task that could reach production state, service uptime, or sensitive data.
---

# Production safety

Use conservative defaults.

## Core rule

Prefer:

- read-only inspection first
- proposal before mutation
- scoped changes over broad changes
- repo edits before production edits
- explicit approval before impactful actions

## Production boundaries

Treat these as production-sensitive:

- live Home Assistant config on the HA OS VM
- Docker app runtime data
- `.env` files and secrets
- backup targets and retention
- infrastructure access config
- service restart behavior
- tokens, credentials, and auth stores

## Default operating mode

Start with:

- read-only review
- findings
- diff proposal
- staged implementation plan

Only mutate after approval.

## Hard guardrails

Do not do these by default:

- write to the live Home Assistant Samba share
- modify real secrets or `.env`
- rotate tokens or credentials
- delete backups
- prune runtime data
- run broad shell commands across the host
- restart live services without approval
- deploy directly to production
- assume archived folders are safe to delete without confirmation

## Home Assistant guardrails

- treat `home-assistant/` as managed artifacts only
- never treat runtime dumps as authoritative
- prefer repo edits plus a manual copy/reload workflow
- call out when reload vs restart is needed
- keep assumptions about entities and integrations explicit

## Mealie guardrails

- edit repo files and scripts first
- use a separate source checkout for code work
- keep production on the image-based path until review is complete
- do not modify live `.env`
- do not assume production data is disposable
- document preview vs production boundaries clearly

## Backup guardrails

- inspect backup health before proposing retention changes
- never delete or rewrite backups automatically
- favor reports and recommendations over mutation
- require explicit approval for any restore-affecting action

## Repo safety guardrails

- do not commit secrets
- do not commit runtime state accidentally
- update `.gitignore` when patterns show drift
- prefer lightweight archive markers in git over raw runtime dumps

## Output style

When risk exists, produce:

- what may be affected
- what is safe to inspect
- what requires approval
- rollback or recovery considerations
