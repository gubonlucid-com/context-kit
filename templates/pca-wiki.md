# pca-wiki.md — Personal Context Artifact #1: Who I Am

> **What this file is:** the canonical "who am I" reference. Any agent that drafts as you, decides on your behalf, or surfaces information to you reads this first.
>
> **Who reads it:** CEO orchestrator, Executive Assistant, draft-as-me email pipelines, any agent making decisions on your behalf.
>
> **When you update it:** quarterly minimum; immediately on big life events (job change, family milestone, major project pivot).
>
> **Companion files:** `pca-mental-models.md` (how you decide), `pca-voice.md` (how you write), `pca-protocols.md` (hard rules).

---

## Identity

- **Name:** [FILL: your name]
- **Location:** [FILL: city, timezone]
- **Age:** [FILL]
- **Phone:** [FILL]
- **Email (primary):** [FILL]
- **Email (work):** [FILL]
- **LinkedIn:** [FILL]
- **Website:** [FILL]

### Family

[FILL: relationship status, partner's name, kids (names/ages), family priorities]

Example format:
- **Partner:** [name]. [One sentence on relationship context agents need to know.]
- **Kids:** [name] ([age]), [name] ([age])
- **Faith/values:** [Any faith tradition or values framework that should shape decisions]

### Background

[FILL: 3–5 sentence professional bio. Include most recent role, prior notable experiences, what you're known for. This is what Claude reads before drafting your intro or recommending career moves.]

Example:
> Principal PM at [Company] where I led [X]. Prior: [roles]. Built [thing]. Strong in [domains].

### Current Life-State

- **Career status:** [FILL: employed/between roles/student/founder; what's primary]
- **Primary work location:** [FILL]
- **Income sources:** [FILL: salary, consulting, passive, etc. — agents use this for financial advice]
- **Time horizon for current chapter:** [FILL: "next 2 years while I do X", "until Y"]

---

## Domains (8-Domain Structure)

Structure your life into 8 domains. Agents route tasks, conversations, and projects to the right domain.

| Domain | Scope | Current priority | Owner agent |
|---|---|---|---|
| **Health** | Physical/mental wellness, sleep, fitness, nutrition | [HIGH/MED/LOW] | [FILL or "none"] |
| **Family** | Partner, kids, extended family, home | [HIGH/MED/LOW] | [FILL or "none"] |
| **Work** | Career, employer, Siemens/[company] | [HIGH/MED/LOW] | [FILL or "none"] |
| **School** | Education, courses, degrees in progress | [HIGH/MED/LOW] | [FILL or "none"] |
| **Growth** | Personal brand, content, social, learning | [HIGH/MED/LOW] | [FILL or "none"] |
| **AI Foundry** | AI projects, agent system, side builds | [HIGH/MED/LOW] | [FILL or "none"] |
| **Consulting** | Client work, freelance, advisory | [HIGH/MED/LOW] | [FILL or "none"] |
| **Life Ops** | Admin, finances, logistics, household | [HIGH/MED/LOW] | [FILL or "none"] |

[FILL: customize domain names to match your life. The 8-domain structure is a convention, not a constraint.]

---

## Current Projects (agent-facing snapshot)

[FILL: 3–10 active projects. Enough for an agent to understand what you're working on without reading every WORKPLAN.]

Format:
```
- **[Project name]** ([domain]): [one-sentence what/why]. Status: [active/stalled/blocked]. Target: [date or milestone].
```

---

## Top 20 People

[FILL: the 20 people most relevant to your work right now. Agents use this when routing relationship tasks and drafting outreach.]

Format:
```
- **[Name]** ([role/relationship]): [one sentence on the relationship + what you need to remember]
```

---

## How to Use This File

1. Fill in every `[FILL]` section
2. Update quarterly or on major life events
3. Reference it in your CLAUDE.md: "Read `~/.claude/context/pca-wiki.md` at session start"
4. Let agents read it before making any recommendation on your behalf

**What NOT to put here:**
- Passwords, API keys, or secrets (use `.env` files)
- Ephemeral tasks (use your task manager)
- Detailed project context (use per-project WORKPLAN files)
