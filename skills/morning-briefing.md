---
name: morning-briefing
description: Morning briefing skill — generate a grounded morning status report from your PCA files, domain state files, open loops, and watchers. Replaces the "what should I focus on today?" conversation.
---

# Morning Briefing

**What this replaces:** the daily "what should I focus on?" spin cycle. Instead of starting from zero, Claude reads your state files and surfaces what matters.

## What this skill generates

When you invoke `/morning-briefing`, Claude will:
1. Read your PCA files (who you are, your priorities, your protocols)
2. Read domain state files for your active domains
3. Check open loops (any P0/P1 items, anything overdue)
4. Check watchers (anything triggered overnight)
5. Generate a structured briefing

## Briefing Format

```markdown
# Morning Briefing — [Day, Date]

## Status

Overall: [GREEN / YELLOW / RED]

[One sentence on the most important thing happening today]

## Today's Priorities

1. **[P0 item]** — [context, why it matters today]
2. **[P1 item]** — [context]
3. **[P1 item]** — [context]

## Open Loops Needing Action

- [ ] [OL-XXX] **[Title]** — [due date] — [who it's with]
  → Suggested action: [what Claude recommends]

## Watchers Triggered

[Any watchers that fired since yesterday's briefing]

## Domain Status

| Domain | Status | Most Important Thing |
|---|---|---|
| [Domain] | 🟢/🟡/🔴 | [one sentence] |

## Optional: Today's Intent

[A brief statement of what you want to have accomplished by end of day — fill this in yourself]
```

## How to invoke

`/morning-briefing` — generate the full briefing

`/morning-briefing --short` — just priorities and P0 open loops (for phone)

`/morning-briefing --domain health` — focus on one domain

## State Files Claude Reads

Configure which files Claude reads in this skill or in your CLAUDE.md:

```
PCA files:
- ~/.claude/context/pca-wiki.md
- ~/.claude/context/pca-mental-models.md
- ~/.claude/context/pca-protocols.md

Open loops: ~/.claude/open-loops.md
Watchers: ~/.claude/watchers.md

Domain states: (configure paths in your CLAUDE.md)
```

## Agent Instructions

When this skill is invoked:

1. **Read** all configured PCA files and state files
2. **Check** open-loops.md for:
   - Any P0 items (surface immediately)
   - Any P1 items due today or overdue
   - Any "their commitment" loops where the expected date has passed
3. **Check** watchers.md for any triggered watchers since yesterday
4. **Generate** the briefing using the format above
5. **Keep it tight** — the briefing should be readable in 3 minutes. No padding.

**Briefing quality rules:**
- Surface REAL conflicts (two P1 things scheduled at the same time)
- Surface items that will become P0 soon if not addressed (early warning)
- Do NOT surface everything — that's noise. Prioritize ruthlessly.
- If nothing is urgent: say so. A calm day is information.

## The Philosophy

The morning briefing's job is to make the first 15 minutes of work productive instead of orienting. It answers: what needs me today? What would I regret not doing? What can wait?

It should feel like a smart chief of staff reading you in — not a dashboard you have to interpret.
