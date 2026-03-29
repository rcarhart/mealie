# OpenClaw

This directory is the source-controlled home for the homelab's OpenClaw deployment and operations documentation.

Use it for:

- deployment definitions
- example environment/config files
- scripts for maintenance and recovery
- OpenClaw-specific operational docs

Do not store live secrets, tokens, runtime databases, or generated session state in git.

## Suggested structure

```text
openclaw/
├─ README.md
├─ .env.example
├─ config/
├─ scripts/
└─ docs/
```

## Source of truth

- Git stores deployment intent, examples, and procedures
- the live OpenClaw runtime stores working state and secrets
- backups should cover anything needed for recovery that is not represented in git
