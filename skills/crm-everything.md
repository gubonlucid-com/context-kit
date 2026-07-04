---
name: crm-everything
description: CRM-everything skill — create or update a contact file for any person mentioned in the conversation. Use whenever a person's name comes up who might be relevant to future work.
---

# CRM Everything

**When this skill is invoked:** any time a person's name comes up in the conversation, a contact file should exist for them. This skill creates or updates that file.

## What this skill does

"CRM everything" means: every person who touches your work gets a file. Not a Salesforce entry — a markdown file you own, stored locally, readable by any agent.

When you invoke `/crm-everything`, Claude will:
1. Extract any person names from the current conversation
2. Create or update a contact file at `~/.claude/crm/<first-last>.md`
3. Log the interaction with today's date and context
4. Report what was created/updated

## Contact File Structure

Each file follows this schema:

```markdown
# [Full Name]

## Identity
- **Name:** [Full Name]
- **Role:** [current role/title]
- **Organization:** [employer or context]
- **Email:** [email if known]
- **Phone:** [if known]
- **LinkedIn:** [URL if known]
- **Met via:** [how you met/context]
- **Domain:** [which of your life domains this person belongs to]

## Status
- **Last contact:** [YYYY-MM-DD]
- **Relationship health:** [warm/cool/stale/unknown]
- **Outstanding:** [any open loop or pending action with this person]

## Context
[2-3 sentences on who this person is relative to your work and what you need to remember]

## Interactions (append-only)

| Date | Type | Notes |
|---|---|---|
| [YYYY-MM-DD] | [email/meeting/call/intro/other] | [one line summary] |
```

## How to invoke

Type `/crm-everything` and Claude will:
- Identify all people mentioned in the conversation
- Ask if any are missing context (role, email, relationship)
- Create or update their files
- Report a summary of changes

Or be specific: `/crm-everything John Smith — we just had a 30-min call about the Series A`

## Storage Location

By default: `~/.claude/crm/<firstname-lastname>.md`

To change this, edit the path in this skill file.

## Why this matters

The pattern: you have a call. You move on. Six months later you want to reach back out and you can't remember the context. An agent can't help because it doesn't have the person's file.

"CRM everything" means you never start from zero. The agents build the relationship graph as you work, not as a separate chore.

## Agent Instructions

When this skill is invoked:

1. **Extract names** from the current conversation context
2. **For each name:**
   - Check if `~/.claude/crm/<slug>.md` exists
   - If YES: append to the Interactions table with today's date + context from the conversation
   - If NO: create the file using the schema above, filling what's known from context
3. **Ask** for any missing critical fields (email, role) if the person seems important
4. **Report** a one-line summary per person: "Created: John Smith (Series A investor, met via cold email)" or "Updated: Jane Doe (last seen today, context: contract negotiation)"

Name → slug: lowercase, hyphens, drop titles. "Dr. Jane Smith-Jones" → `jane-smith-jones.md`

Never add fake information. Leave fields as `[unknown]` if not established from context.
