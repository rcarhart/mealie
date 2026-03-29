# Worker Rollout Plan

## Phase 1 - minimal and safe

Start with:

- one main conversational agent
- planner/supervisor
- UI worker
- backup auditor

Defaults:

- read-only first
- repo-only changes
- proposal-first behavior
- explicit approval before impactful mutations

Avoid in this phase:

- direct production writes
- direct Home Assistant Samba sync
- broad shell access
- automatic backup cleanup
- hooks and unattended mutation

## Phase 2 - useful specialization

Add:

- Mealie dev worker
- security/repo auditor
- shared skills for repo conventions and prod safety
- Mealie dev-preview workflow documentation

Defaults:

- use a separate Mealie source checkout for code changes
- use isolated preview containers for Mealie review
- continue keeping production Mealie image-based
- keep preview data, env, and ports fully separate from production

## Phase 3 - controlled operational helpers

Add carefully:

- scheduled read-only audits
- validation scripts
- more detailed review workflows
- optional controlled deploy checklists

Still keep production writes gated.

## Phase 4 - advanced behavior only if needed

Possible later additions:

- approval-based promotion from preview to production
- controlled Home Assistant sync helpers
- limited operational automation with explicit rollback notes

Only add these if the earlier phases remain predictable and easy to reason about.
