# Home Assistant Legacy Archive

This directory marks the legacy Home Assistant Docker-era config as archived.

- Archived from active repo path on 2026-03-29
- Raw local dump moved out of the git tree to: `/home/docker/home-assistant-legacy-archive-2026-03-29`
- Intended follow-up: delete the raw local archive after the review window if no longer needed

Why this is not stored in git:

- contains runtime state
- contains secrets/sensitive files
- contains databases, logs, and generated artifacts
- includes root-owned files that should not be versioned

The live source-of-truth model is now:

- `home-assistant/` for curated managed config
- Home Assistant OS VM for runtime state
- Home Assistant backups for full-fidelity recovery
