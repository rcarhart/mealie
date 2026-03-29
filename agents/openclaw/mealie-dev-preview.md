# Mealie Dev Preview Workflow

## Goal

Let the main agent delegate Mealie feature work to a specialized worker without risking the current production deployment.

Production Mealie should remain on the current image-based Docker deployment until a preview is reviewed and explicitly promoted.

## Source-of-truth model

### Production path

Production Mealie remains defined by:

- `app/mealie/docker-compose.yml`
- `app/mealie/.env` on the Docker VM
- `app/mealie/data/`
- `app/mealie/backups/`

This path stays image-based for now.

### Development path

A separate development area should contain:

- an upstream Mealie source checkout
- preview-specific environment config
- isolated preview runtime data
- notes about how the preview differs from production

Recommended location:

```text
homelab/
├─ app/
├─ dev/
│  └─ mealie-src/
└─ agents/
```

If you prefer to keep the source repo out of the homelab repo entirely, use a sibling path such as:

```text
/home/docker/dev/mealie-src
```

That is often cleaner because the source checkout is not itself part of the homelab config repo.

## Recommended workflow

1. main agent receives a Mealie feature or UI request
2. main agent delegates to the Mealie dev worker
3. Mealie dev worker updates the separate source checkout
4. worker builds or runs an isolated preview container
5. worker reports back with:
   - what changed
   - preview URL
   - screenshots or notes when useful
   - risks and migration notes
6. user reviews on phone or desktop
7. only after approval should the planner propose a production promotion path

## Preview environment rules

The preview must be isolated from production.

Use:

- separate port
- separate container name
- separate env file
- separate data volume or bind mount
- separate base URL

Do not:

- reuse production `data/`
- reuse production `.env`
- overwrite the production container
- point the preview at production stateful storage

## Suggested preview shape

Example concept:

```text
dev/mealie-src/
dev/mealie-preview/
├─ docker-compose.yml
├─ .env.example
└─ data/
```

Suggested preview values:

- container name: `mealie-preview`
- port: `9001` or `9926`
- separate hostname or subpath if later exposed externally
- preview-only auth/settings

## Worker responsibilities

The Mealie dev worker should be able to:

- pull or update the upstream Mealie source repo
- create feature branches for requested work
- implement code changes
- run a preview build or preview container
- summarize diffs for review
- provide a safe promotion recommendation

The worker should not:

- replace the production container by default
- deploy source builds directly to production
- mix preview state with production state
- change production `.env` without approval

## Approval output format

Every preview-ready change should report:

- request summary
- files changed
- preview URL
- whether DB or data shape changes are involved
- whether rollback is simple or complex
- recommended next action:
  - keep iterating
  - approve for further testing
  - propose promotion plan

## Recommended first implementation

Phase 1:

- document the external source checkout location
- create a preview workflow doc
- do not auto-pull or auto-build yet

Phase 2:

- add scripts for clone/update/build preview
- standardize preview env naming
- document promotion rules

Phase 3:

- optionally wire the workflow into an approval-friendly Discord flow
