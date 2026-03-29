# Dashboard Access

This file documents intended boundaries for agent access to dashboards and household control surfaces.

## Purpose

Agents may help design, document, and validate dashboards, but access should be scoped deliberately.

## Principles

- prefer least privilege
- separate design access from operational control when possible
- do not treat dashboard access as permission to modify unrelated systems
- keep secrets and tokens out of git

## Home Assistant dashboards

Agents may assist with:

- Lovelace YAML design
- dashboard organization
- card layout and readability improvements
- documentation of dashboard intent

Agents should not assume unrestricted access to live household controls unless explicitly granted in the runtime environment.

## External dashboards and admin panels

Examples include:

- OpenClaw control surfaces
- Portainer
- backup consoles
- reverse proxy dashboards

Document access paths and guardrails outside git when they contain sensitive connection details.
Keep only policy and workflow documentation here.

## Source of truth

This file is for policy and intent.

Live credentials, URLs tied to a private network, and machine-specific admin access details should remain outside version control.
