# Providers

This file documents the intended provider and model routing strategy for homelab agent work.

## Goals

- use the simplest capable model for routine work
- reserve stronger models for planning, migration, architecture, and risk-sensitive tasks
- make worker selection understandable to humans maintaining the repo

## Suggested routing

### Planner
Use a stronger planning/reasoning model for:

- architecture decisions
- migration planning
- repo organization
- change sequencing
- recovery and rollback planning

### Home Assistant designer
Use a model that is strong at YAML, UI layout, and Home Assistant-specific configuration work for:

- Lovelace dashboards
- packages and includes
- entity naming consistency
- dashboard usability and layout refinement

### Backup auditor
Use a careful, detail-oriented model for:

- backup coverage review
- restore path validation
- retention checks
- identifying gaps between config, state, and recovery procedures

## Operating principle

Provider choice should follow task risk:

- low-risk routine edits -> economical/default model
- medium-risk config work -> capable general model
- high-risk planning or migration work -> strongest available model

Keep the decision logic simple enough that future maintainers can understand it quickly.
