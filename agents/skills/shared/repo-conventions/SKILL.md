---
name: repo-conventions
description: Enforce repository structure and source-of-truth rules for this homelab. Use when reviewing, editing, or creating files under app/, infrastructure/, home-assistant/, docs/, agents/, or openclaw/, especially when deciding what belongs in git vs runtime state, how managed config differs from generated files, or where new documentation and worker artifacts should live.
---

# Repository conventions

Follow these rules when working in this homelab repo.

## Core source-of-truth model

Treat the repo as a home for:

- deployment intent
- managed configuration
- documentation
- scripts
- worker and skill definitions

Do not treat the repo as the home for:

- runtime-generated state
- secrets
- databases
- logs
- caches
- backup payloads
- device registries
- mutable system internals

## Directory intent

### `app/`
Use for user-facing Dockerized services.

Typical contents:

- `docker-compose.yml`
- `.env.example`
- `README.md`
- scripts
- managed config

Do not commit:

- real `.env`
- runtime app data
- uploads/media
- backups
- DB files
- logs

### `infrastructure/`
Use for supporting infrastructure and platform plumbing.

Keep only managed definitions and docs in git.

### `home-assistant/`
Use only for curated, human-managed Home Assistant configuration.

Allowed examples:

- `configuration.yaml`
- `dashboards/`
- `packages/`
- `themes/`
- `blueprints/`
- selected `custom_components/`
- selected `www/`
- `secrets.example.yaml`

Do not commit:

- `.storage/`
- `.cache/`
- `.cloud/`
- logs
- databases
- backups
- `deps/`
- `tts/`
- real `secrets.yaml`

Assume Home Assistant OS owns runtime state.
Assume the live config is separate from the repo.
Assume `home-assistant-legacy/` is not live.

### `agents/`
Use for worker definitions, OpenClaw operating docs, and project-local skills.

### `docs/`
Use for repo-level architecture, process, and recovery documentation.

## Editing rules

Before editing, identify:

1. is this file managed config, documentation, or runtime state?
2. should this live in git?
3. does this change affect a live system?
4. should this be proposal-first rather than directly edited?

If the answer is unclear, stop and propose rather than mutate.

## Preferred behavior

- preserve clear boundaries
- keep docs aligned with real operating model
- prefer small, explicit changes
- call out source-of-truth ambiguity
- avoid silently expanding scope
