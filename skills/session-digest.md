---
name: session-digest
description: Session digest skill — generate an end-of-session summary that primes the next session. Captures decisions made, work shipped, open loops created, and context the next session needs. Run at the end of any meaningful working session.
---

# Session Digest

**The problem this solves:** every time you start a new Claude session, you lose context. You spend the first 5–10 minutes re-explaining what you're working on, what decisions were made, and where you left off.

A session digest is a structured summary written at the END of a session, designed to be READ at the START of the next one.

## What this skill generates

When you invoke `/session-digest`, Claude will:
1. Scan the current session for decisions made, actions taken, things shipped
2. Extract any new open loops or watchers that should be created
3. Identify the context the next session needs to be productive immediately
4. Write the digest to `~/.claude/sessions/<date>-<time>.md`

## Digest Format

```markdown
# Session Digest — [YYYY-MM-DD HH:MM]

## What Happened

[2-3 sentence summary of what this session accomplished. Write for someone who wasn't there.]

## Decisions Made

| Decision | Rationale | Reversible? |
|---|---|---|
| [Decision] | [Why] | [Y/N] |

## Work Shipped

- [Thing shipped or changed] — [where it lives / link]

## New Open Loops

(These should also be in your open-loops.md — this is a copy for session context)

- OL-XXX: [commitment] → [who] by [when]

## Context for Next Session

[The 3 most important things the next session should know before starting:]

1. [Most important context]
2. [Second most important]
3. [Third]

## Unfinished Work

[Things that were in progress but didn't complete. Concrete enough that the next session can pick them up.]

- [ ] [Thing] — context: [what the next step is]

## Files Changed

[List files that were created or modified, so the next session knows where to look]

- Created: [path]
- Modified: [path]

## Next Session Prompt (Optional)

[If there's a clear next step, write the ideal first message for the next session here.]

> [Example: "Continue from session digest [date]. The context-kit README needs the pricing table updated with the Agensi URL. The flagship essay draft is at ~/context-kit-essay.md and needs the second half written."]
```

## How to invoke

`/session-digest` — generate full digest for the current session

`/session-digest --quick` — just decisions + unfinished work + next session context

## Storage and Loading

Digests are stored at: `~/.claude/sessions/YYYY-MM-DD-HHMM.md`

To load the most recent digest at the start of a session, add to your CLAUDE.md:
```
At session start, read the most recent file in ~/.claude/sessions/ to restore context.
```

## Agent Instructions

When this skill is invoked:

1. **Scan the full conversation** for:
   - Decisions (anything where you or the user chose between options)
   - Actions taken (files created/modified, commands run, code shipped)
   - New commitments (things said that should become open loops)
   - Unresolved items (things started but not finished)

2. **Generate the digest** using the format above:
   - Keep "What Happened" under 100 words
   - Be specific in "Work Shipped" — include file paths and what changed
   - "Context for Next Session" is the most important section — be ruthless about what a fresh session actually needs

3. **Write to** `~/.claude/sessions/<YYYY-MM-DD>-<HHMM>.md` (create the directory if needed)

4. **Extract open loops** and offer to add them to open-loops.md if not already there

5. **Confirm** what was written and where

## The Philosophy

A good session digest takes 2 minutes to write and saves 10 minutes at the start of the next session. Write it like you're briefing a colleague who's taking over — not like you're writing a log for yourself.

The two questions that drive the format:
1. "If I came back to this cold tomorrow, what would I need to know?"
2. "What would a smart person get wrong about where we left off?"
