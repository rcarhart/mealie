# Agents

This directory is the source-controlled home for the homelab's agent system design.

It documents:

- worker roles
- provider/model routing
- access boundaries
- prompt and role design intent

This is the human-readable control plane for how assistants should behave in this repo.

## Structure

```text
agents/
├─ README.md
├─ providers.md
├─ dashboard-access.md
└─ workers/
   ├─ planner.md
   ├─ ha-designer.md
   └─ backup-auditor.md
```

## Source of truth

Use `agents/` for things like:

- what each worker is responsible for
- which provider/model should be used for which class of work
- what dashboards or systems agents may access
- role boundaries and handoff rules

Do not use this directory for runtime state, tokens, logs, or generated artifacts.
Those belong in the running OpenClaw environment, not in git.
