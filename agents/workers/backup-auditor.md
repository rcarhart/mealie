# Backup Auditor Worker

## Role

The backup auditor worker evaluates whether important homelab systems are actually recoverable.

## Good fits

- verifying backup coverage
- checking restore paths
- identifying systems with config in git but no data backup
- identifying systems with backups but unclear recovery instructions
- validating retention expectations

## What to check

- Docker app data backups
- Home Assistant full-system backup coverage
- whether secrets are reproducible or safely stored
- whether restore steps are documented
- whether the repo clearly distinguishes config from live state

## Operating principle

A backup is not just a file. It is only useful if there is a believable restore path.

## In this homelab

Special attention should be given to the split source-of-truth model:

- Git stores desired config and managed artifacts
- running systems store live mutable state
- backups must cover the parts that git intentionally excludes
