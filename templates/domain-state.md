# domain-state.md — Domain State File Template

> **What this file is:** the convention for per-domain state files. Each of your 8 life domains gets one. Agents read the domain's state file before surfacing information or taking action in that domain.
>
> **Where it lives:** `~/clawd/domains/<domain-name>/state/state.md` (or wherever your CLAUDE.md points)
>
> **Who reads it:** the domain's assigned agent, the CEO orchestrator, the morning briefing generator.
>
> **How often it updates:** agents update it after any material action in the domain. You update it when you have context agents don't.

---

# [Domain Name] — State File

Last updated: [YYYY-MM-DD]
Updated by: [agent name or "JD"]

---

## Current Status

[FILL: one paragraph summary of where this domain stands right now. What's the most important thing to know? What's the current priority? What's blocking progress?]

**Status:** [GREEN / YELLOW / RED]
- GREEN = operating normally, no blockers
- YELLOW = minor issues, watching
- RED = blocked or urgent action needed

---

## Active Projects

[FILL: projects under this domain that are actively in flight. Link to project WORKPLAN files.]

| Project | Status | Target | Blocker |
|---|---|---|---|
| [name] | [active/stalled/blocked] | [date or milestone] | [none or description] |

---

## Open Loops

[FILL: promises, waiting-on items, and pending obligations in this domain.]

| Item | Created | Owner | Due | Status |
|---|---|---|---|---|
| [Promise or obligation] | [date] | [me/other] | [date or "on demand"] | [open/watching] |

**Instructions for agents:** when an open loop is resolved, move it to the Closed section below and note how it resolved.

---

## Key Metrics

[FILL: the numbers that define success in this domain. Update when they change.]

| Metric | Current | Target | Trend |
|---|---|---|---|
| [metric name] | [value] | [target] | [↑/↓/→] |

---

## Standing Context

[FILL: stable context that rarely changes but agents need to know. People, resources, constraints, conventions.]

- **Key people:** [names + roles relevant to this domain]
- **Key resources:** [tools, accounts, subscriptions, files that matter here]
- **Key constraints:** [budget, time, dependencies that agents must respect]
- **Recurring obligations:** [regular commitments in this domain — meetings, dues, deadlines]

---

## Action Queue

[FILL: next actions agents should take in this domain, in priority order.]

- [ ] P0: [urgent action] — [context]
- [ ] P1: [important action] — [context]
- [ ] P2: [nice-to-have] — [context]

**Instructions for agents:** when you complete an action, check it off and add a one-line note. Don't delete items — the history matters.

---

## Closed / Resolved

[Record of resolved items. Append-only.]

Format: `YYYY-MM-DD — [What was resolved] — [How]`

- [FILL]
