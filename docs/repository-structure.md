# Repository Structure

This repo is organized so each major system has a clear source of truth without mixing deployment definitions, secrets, runtime state, and backups.

## Folder layout

```text
homelab/
├─ README.md
├─ agents/
│  ├─ README.md
│  ├─ providers.md
│  ├─ dashboard-access.md
│  └─ workers/
├─ openclaw/
│  ├─ README.md
│  ├─ .env.example
│  ├─ config/
│  ├─ scripts/
│  └─ docs/
├─ app/
├─ infrastructure/
├─ home-assistant/
└─ docs/
```

## Source of truth by area

### `app/` and `infrastructure/`
Use these for Dockerized services and infrastructure components.

Git should contain:

- `docker-compose.yml`
- `.env.example`
- `README.md`
- maintenance scripts
- human-managed config files

Git should not contain:

- real `.env` files
- databases
- uploaded media
- service backups
- logs and caches

### `home-assistant/`
Use this for curated, source-controlled Home Assistant configuration only.

Git should contain intentionally managed artifacts such as:

- `configuration.yaml`
- `dashboards/`
- `packages/`
- `themes/`
- `blueprints/`
- selected `custom_components/`
- selected `www/` assets
- `secrets.example.yaml`

Git should not contain runtime/generated/sensitive artifacts such as:

- `.storage/`
- `.cache/`
- `.cloud/`
- logs
- databases
- backups
- `deps/`
- `tts/`
- real `secrets.yaml`

### `agents/`
Use this for the human-readable agent control plane.

This directory documents:

- worker roles
- provider/model routing intent
- dashboard and access boundaries
- planning and worker responsibilities

### `openclaw/`
Use this for the OpenClaw deployment and operational model.

Git should contain:

- deployment definitions
- example env/config files
- scripts
- operations docs

Git should not contain:

- live secrets and tokens
- runtime databases
- generated session state
- logs and transient artifacts

## Per-service Docker pattern

Each Dockerized service should usually follow the same shape:

```text
service/
├─ docker-compose.yml
├─ .env.example
├─ README.md
├─ scripts/
└─ runtime folders ignored by git
```

## Environment file workflow

`git pull` does not copy secrets from `.env.example` into `.env`.

The intended workflow is:

1. Commit `.env.example` with placeholder values and variable names only.
2. Keep the real `.env` file out of git.
3. On the target machine, copy `.env.example` to `.env` once and fill in the real values.
4. Reuse that same `.env` on future pulls unless the example file adds new variables.

Example:

```bash
cd app/mealie
cp .env.example .env
docker compose up -d
```

## Recovery model

- Git stores desired config and human-managed artifacts
- running systems store live mutable state
- backups must cover the parts intentionally excluded from git
