# Context Kit — Your Personal AI Operating System

[![GitHub stars](https://img.shields.io/github/stars/JDDavenport/context-kit?style=social)](https://github.com/JDDavenport/context-kit/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-compatible-blueviolet)](https://claude.ai/code)

> The thing every commercial AI assistant lacks — deep, longitudinal, structured personal context — packaged so anyone running Claude Code can install it in an afternoon.

**Context Kit** is a collection of templates, skills, and conventions that transform Claude Code from a generic assistant into a system that deeply knows you. 4 PCA templates + 5 skills. Free and open-source.

```bash
# One-command install
bash <(curl -fsSL https://raw.githubusercontent.com/JDDavenport/context-kit/main/scripts/install.sh)
```

**[Read the essay: I ran my life on a fleet of AI agents for 6 months →](https://docs.agenttree.army/articles/personal-ai-os/)**

---

## What's included

```
templates/
  pca-wiki.md           — who you are (roles, background, relationships, domains)
  pca-mental-models.md  — how you decide (money, time, risk, energy priors)
  pca-voice.md          — how you write (examples, anti-examples, channel rules)
  pca-protocols.md      — your hard rules (non-negotiables, time rules, comms rules)
  domain-state.md       — per-domain state file convention
  CLAUDE.md.template    — starter CLAUDE.md that loads your PCA files

skills/
  crm-everything.md     — never forget a person: create/update contact files
  open-loops.md         — capture & track promises before they become dropped balls
  watchers.md           — durable "notify me when X" conditions via Claude
  morning-briefing.md   — generate a grounded morning status from your state files
  session-digest.md     — end-of-session summary that feeds the next session
```

---

## Install (2 minutes)

```bash
# Option A — one-liner (recommended)
bash <(curl -fsSL https://raw.githubusercontent.com/JDDavenport/context-kit/main/scripts/install.sh)

# Option B — clone and run
git clone https://github.com/JDDavenport/context-kit.git
cd context-kit
bash scripts/install.sh
```

The installer:
1. Copies PCA templates to `~/.claude/context/` (or your chosen path)
2. Installs skills to `~/.claude/skills/`
3. Prints next steps for filling in your templates

---

## The 4 PCA Files

Personal Context Artifacts (PCAs) answer 4 questions every AI agent needs to do its job well:

| File | Question | What goes in it |
|---|---|---|
| `pca-wiki.md` | Who am I? | Background, family, domains, goals, current life-state |
| `pca-mental-models.md` | How do I decide? | Money/time/risk priors, decision frameworks |
| `pca-voice.md` | How do I write? | Writing examples, anti-examples, channel-specific rules |
| `pca-protocols.md` | What are my hard rules? | Non-negotiables that agents must never violate |

Once filled in, reference them in your CLAUDE.md so every Claude session loads them:

```markdown
## Personal Context
Read these files at session start:
- `~/.claude/context/pca-wiki.md` — who I am
- `~/.claude/context/pca-mental-models.md` — how I decide
- `~/.claude/context/pca-voice.md` — how I write
- `~/.claude/context/pca-protocols.md` — my hard rules
```

You start context-full, not context-zero.

---

## The 5 Skills

Skills are Claude Code slash commands. Install them, then invoke with `/skill-name`.

| Skill | Invoke | What it does |
|---|---|---|
| CRM Everything | `/crm-everything` | Creates or updates a contact file for any person mentioned |
| Open Loops | `/open-loops` | Extracts promises/commitments from the current conversation |
| Watchers | `/watchers` | Sets up a "notify me when X" condition Claude checks on request |
| Morning Briefing | `/morning-briefing` | Generates a grounded morning status from your state files |
| Session Digest | `/session-digest` | End-of-session summary that primes the next session |

---

## Pricing

The templates and this README are free. The skills pack adds 5 working slash commands + advanced templates.

| Tier | What you get | Price |
|---|---|---|
| **Free** | All 4 PCA templates + CLAUDE.md scaffold | Free (this repo) |
| **Skills Pack** | All 5 skills + advanced templates + updates | [$39 →](https://buy.stripe.com/3cI7sL9SfbUsa1fe1RdIA0e) |
| **Course** | "Build your personal AI OS" — recorded walkthrough + Q&A | $149 (pre-order) |
| **Sponsorware** | Early access to new skills + private build log | $10/mo |

---

## Who this is for

You're already running Claude Code. You've gotten it to do impressive things. But every session you're re-explaining yourself — your goals, your constraints, your voice, your context.

The commercial alternatives (Lindy, Claude.ai, the OpenAI agents) are building the same thing but they keep the context locked in their walled garden. Switch providers — start over.

These are Markdown files. They're yours. They work with any model, any tool, forever.

---

## Built from receipts

This system was extracted from 6 months of running a real agent fleet:
- **133 projects** managed by AI agents
- **28 domain agents** covering health, family, work, school, investing, consulting
- **47+ cron jobs** — autonomous, recurring work
- **203 automation scripts**

Not a thought experiment. A distillation of what actually worked.

---

## Contributing

Open a [Discussion](https://github.com/JDDavenport/context-kit/discussions) to share your PCA setup, suggest new skills, or ask questions.

If Context Kit is useful to you, a star helps others find it.

---

Built by JD Davenport · [Essay](https://docs.agenttree.army/articles/personal-ai-os/) · [AgentTree Hub](https://agenttree.ai)
