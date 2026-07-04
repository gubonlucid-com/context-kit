---
name: watchers
description: Watchers skill — set up durable "notify me when X" conditions that Claude checks on request. The primitive between a one-time todo and a standing cron job.
---

# Watchers

**The gap this fills:** you want to know when something happens — a reply lands, a file appears, a date approaches — but you don't want to manually check. Cron jobs are overkill. Open loops are passive. A watcher is in between: a registered condition that fires once when it's true.

## What this skill does

When you invoke `/watchers add`, Claude creates a watcher entry in your registry. On `/watchers check`, Claude evaluates each active watcher and reports any that have fired.

## Watcher Types

| Kind | What it watches | Example |
|---|---|---|
| `email` | Gmail/email for a matching message | "The contractor replied" |
| `file` | A file appearing, disappearing, or changing | "The report was updated" |
| `date` | A date approaching | "Invoice due in 3 days" |
| `condition` | A text condition you describe | "Check if [URL] is back up" |
| `custom` | Claude evaluates against context you provide | "Tell me when the PR is merged" |

## Watcher Registry Format

Stored at `~/.claude/watchers.md`:

```markdown
# Watcher Registry

## Active Watchers

| ID | Title | Kind | Condition | Escalation | Expires | Status |
|---|---|---|---|---|---|---|
| W-001 | Contractor reply | email | from:contractor@example.com after:2024-01-10 | "Contractor replied — {subject}" | 2024-02-10 | active |
| W-002 | Invoice due | date | 2024-01-20 - 3 days lead | "Invoice due in 3 days" | 2024-01-20 | active |

## Triggered Watchers

| ID | Title | Triggered | Evidence |
|---|---|---|---|
| W-003 | PR merged | 2024-01-15 | Found PR #42 closed |

## Expired Watchers

| ID | Title | Expired |
|---|---|---|
| W-004 | Old watch | 2024-01-01 |
```

## How to invoke

`/watchers add` — Claude prompts you for what to watch

`/watchers add "HydroJug warranty reply" -- email from:hydrojug.com, expires 30d` — direct add

`/watchers check` — Claude reviews active watchers and reports any triggered

`/watchers list` — show all active watchers

`/watchers done W-001` — manually resolve a watcher

## Design Rules

Every watcher must have:
- **Title** — human-readable name
- **Condition** — what Claude checks
- **Escalation message** — what you see when it fires (template with `{evidence}`)
- **Expiry** — mandatory, default +30 days (no immortal watchers)

## Agent Instructions

**When `/watchers add` is invoked:**
1. Ask: what should be watched? (if not specified)
2. Ask: what should happen when it fires? (the escalation message)
3. Ask: when should this expire? (default: 30 days from now)
4. Write the entry to `~/.claude/watchers.md`
5. Confirm: "Watcher W-XXX created: [title] — checks for [condition] — expires [date]"

**When `/watchers check` is invoked:**
1. Read `~/.claude/watchers.md`
2. For each ACTIVE watcher:
   - **email kind:** ask Claude to search email (if connected) or prompt user to check
   - **file kind:** use Bash to check if file exists/changed
   - **date kind:** calculate if the lead window has been reached
   - **condition/custom kind:** evaluate the described condition with available tools
3. Report triggered watchers: "FIRED: [title] — [evidence]"
4. Update triggered watchers to status "triggered" in the registry
5. Expire any watchers past their expiry date
6. Report clean summary: "X watchers checked, Y fired, Z expired"

**Key constraint:** a watcher fires ONCE. After triggering, it moves to "Triggered" and never re-pings. This is intentional — it's a one-shot sensor, not a recurring alert.

## Why watchers beat open loops for conditions

Open loops are passive. You note "waiting for contractor reply" and then manually check every few days. A watcher is active — when you run `/watchers check`, Claude does the checking. The discipline: add a watcher whenever you catch yourself thinking "I need to remember to check on X."

## Watcher Hygiene

- Expire watchers when they become moot (contract fell through, no longer relevant)
- Review active watchers weekly as part of morning briefing
- Keep expiry dates honest — if you don't need to know after 30 days, don't set 90
