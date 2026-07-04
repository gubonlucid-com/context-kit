---
name: open-loops
description: Open-loops skill — extract promises and commitments from the current conversation and add them to your open-loops ledger. Use at the end of any conversation where tasks or commitments were made.
---

# Open Loops

**The problem this solves:** you have a great conversation. Someone says "I'll send you X." You say "let me look into Y." The conversation ends. Neither thing happens.

An "open loop" is any commitment that isn't yet a scheduled task. This skill extracts them before they're forgotten.

## What this skill does

When you invoke `/open-loops`, Claude will:
1. Scan the current conversation for:
   - Commitments you made ("I'll", "I'll send", "Let me", "I'll follow up")
   - Commitments others made to you ("I'll get you", "I'll send over", "I'll check")
   - Implied next steps ("we should", "we need to", "someone needs to")
2. Add them to your open-loops ledger at `~/.claude/open-loops.md`
3. Flag anything time-sensitive or high-priority

## Open Loops File Format

```markdown
# Open Loops

Last updated: [YYYY-MM-DD HH:MM]

## My Commitments (I owe someone)

| ID | Commitment | To | Context | Due | Priority | Status |
|---|---|---|---|---|---|---|
| OL-001 | Send the deck | John | Post-investor call | 2024-01-15 | P1 | open |

## Their Commitments (someone owes me)

| ID | Commitment | From | Context | Expected | Priority | Status |
|---|---|---|---|---|---|---|
| OL-002 | Send term sheet | Jane (VC) | Series A discussion | 2024-01-20 | P0 | watching |

## Closed Loops (resolved)

| ID | What | Resolved | How |
|---|---|---|---|
| OL-003 | Schedule follow-up | 2024-01-10 | Meeting booked for Jan 15 |
```

## How to invoke

`/open-loops` — scans current conversation, adds any found

`/open-loops list` — shows all open loops sorted by priority and due date

`/open-loops close OL-001` — marks a loop as resolved

`/open-loops check` — checks for stale open loops (>7 days old with no update)

## Priority Tiers

- **P0:** time-sensitive or high-stakes (revenue, relationships, deadlines)
- **P1:** important, within the week
- **P2:** good to track, no hard deadline
- **P3:** low-stakes reminder

## Agent Instructions

When this skill is invoked:

1. **Scan the full current conversation** for language indicating:
   - First-person future commitments: "I'll", "I will", "let me", "I can", "I should", "I plan to"
   - Third-party commitments: "[name] will", "[name] said they'd", "they'll send", "he/she promised"
   - Implied next steps: "we need to", "someone should", "this requires", "next step is"

2. **For each open loop found:**
   - Assign an ID (OL-NNN, incrementing from the highest existing)
   - Classify: my commitment vs their commitment
   - Extract the WHO, WHAT, and WHEN (infer if not explicit)
   - Assign priority based on context (explicit deadlines → P0/P1; implied → P2)

3. **Append to `~/.claude/open-loops.md`** (create if doesn't exist)

4. **Report:**
   - "Found N open loops: [brief list]"
   - Flag any P0s explicitly
   - Suggest follow-up timing for P1s

5. **Never add duplicate loops** — check if the commitment is already tracked before adding.

## The Open-Loops Doctrine

The goal isn't to capture everything. It's to capture the things that will damage a relationship or miss a deadline if they fall through. When in doubt about whether something is worth tracking: if you'd feel bad about dropping it in 2 weeks, it's an open loop.
