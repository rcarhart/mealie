# OpenClaw Worker Architecture

## Goal

Create a practical worker system for the homelab with one main conversational agent and a small set of specialized workers.

## Recommended pattern

- one main agent for all user interaction
- planner/supervisor for sequencing and delegation
- specialized workers for narrow domains
- shared skills for recurring safety and repo rules
- proposal-first workflows before any production mutation

## Workers

### Main agent

Responsibilities:

- talk to the user
- decide when delegation is useful
- collect outputs from workers
- request approval for impactful actions
- keep production changes explicit

### Planner / Supervisor

Use for architecture, sequencing, migration plans, and cross-repo change coordination.

### UI Worker

Use for Home Assistant dashboard design and managed HA config improvements.

### Mealie Dev Worker

Use for upstream Mealie source-code work in a separate dev checkout and preview environment.
Production Mealie should remain image-based until previewed changes are approved.

### Backup Auditor

Use for read-only backup coverage review and restore-gap detection.

### Security / Repo Auditor

Use for repo hygiene, secret-handling review, and risky-pattern detection.

## Safety boundaries

- no broad production write access by default
- no direct Home Assistant Samba writes by default
- no secret rotation by default
- no automatic backup deletion
- no replacing production Mealie with a dev build without approval
- no hidden hooks or unattended mutation

## Rollout principle

Start with documentation and read-mostly workflows first.
Add scoped implementation power only after the worker boundaries are proven useful.
