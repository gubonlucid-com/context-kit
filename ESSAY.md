# I ran my life on a fleet of AI agents for 6 months. Here's the operating system.

*Published on AgentTree Hub · By JD Davenport*

---

In January 2026, I decided to stop using AI assistants and start building AI agents.

The difference sounds semantic. It isn't.

An assistant answers questions. An agent takes ownership of a domain. An assistant forgets everything between sessions. An agent reads state files that encode six months of accumulated context. An assistant starts cold every morning. An agent starts with a briefing.

By July 2026, I had 133 registered projects, 28 agent packages, and 47+ cron jobs running 24/7. I had a CEO orchestrator that routes tasks to specialized agents across 8 life domains. I had agents for health, family, work, school, growth, AI projects, consulting, and life operations — each with its own state file, memory, and escalation rules.

Most of what I built is not replicable by reading a tutorial. But the *operating system* underneath it — the methodology, the conventions, the 4 files — that's what this essay is about.

---

## The thing everyone building with AI is missing

Every commercial AI assistant — Lindy, Claude.ai, ChatGPT, whatever you use — has the same problem.

They don't know you.

Not really. They know your name if you told them. They might remember a preference or two. But they don't know that you have three kids and the youngest just turned three. They don't know that you have a hard rule about not committing money over $500 without sleeping on it. They don't know that you write in short punchy sentences and you'll cringe if they write a reply for you that says "I hope this email finds you well." They don't know that Sundays are sacred and no work messages should go out.

Every session, you explain yourself again. Every time an agent makes a recommendation, it's making it in a vacuum.

The commercial players are building toward this. They call it "memory." But their memory lives in their system, in their format, behind their paywall. The moment you switch providers, you start over.

What I built instead: a personal context system that lives in markdown files on my machine. Four files. Two hours to set up. Zero vendor lock-in.

---

## The 4 PCA Files

I call them Personal Context Artifacts. Four files that answer four questions:

**File 1: jd-wiki.md — Who am I?**

The canonical "who is this person" reference. My background, family, 8 life domains, current projects, the 20 people most relevant to my work right now, my current life-state. Any agent that drafts as me or makes decisions on my behalf reads this first.

The discipline: update it on major life events. It's not a journal — it's a reference. Think Wikipedia page for yourself.

**File 2: jd-mental-models.md — How do I decide?**

My decision-making priors. The beliefs and frames I apply when I don't have time to think.

Things like: "I prioritize family over work when the cost is reversible. If the cost is irreversible, family wins outright." "I prioritize shipping at the small scale, perfection at the high-stakes scale." "I prefer 80%-now over 100%-later for anything reversible."

This is the file that keeps agents from giving you advice that sounds reasonable but conflicts with how you actually operate. When an agent recommends something that violates a prior, it surfaces the conflict explicitly instead of assuming you haven't thought about it.

**File 3: jd-voice.md — How do I write?**

10 examples of things I actually wrote. 10 anti-examples with annotations on why they're wrong. Specific rules about word choice, punctuation, channel behavior.

This is what stops AI-ghostwritten emails from sounding like AI. The examples do more than any prompt about "being direct." You paste in real messages you sent, explain what you like about them, and the agent learns the actual pattern.

The most important part: every time a draft sounds wrong, I add an anti-example with a note on why. The file gets more useful over time.

**File 4: jd-protocols.md — What are my hard rules?**

The non-negotiables. Short. Direct. Treated as P0 by any agent acting on my behalf.

Time rules (family time after 6pm is sacred). Communication rules (never send anything externally without approval). Financial rules (confirm any spend over $500). Irreversible action rules (never run `rm -rf` without explicit confirmation).

The discipline: keep this SHORT. If it starts getting long, the extra items are soft preferences that belong in the mental models file. Hard rules are the things that, if violated, you'd actually be upset.

---

## How this changes what agents can do

With these four files, agents can do things that are otherwise impossible:

**Draft emails that actually sound like you.** Not "AI-style professional" — your actual voice, because the agent has 10 examples and 10 anti-examples to work from.

**Make recommendations that fit your decision priors.** An agent suggesting a career move that conflicts with your family priorities will surface the conflict explicitly, not pretend it isn't there.

**Operate with your actual constraints.** An agent that knows you don't work on Sundays won't schedule a meeting or send a message on your behalf on a Sunday. Not because you told it this time — because it's in the protocols file.

**Brief incoming sessions.** Every new Claude session reads these files before anything else. You start context-full instead of context-zero.

---

## The 5 Skills That Run on Top

The four files are the foundation. The skills are what make it active.

**Open Loops** — every conversation where you or someone else makes a commitment, the open-loops skill extracts it and tracks it. "Let me look into that" becomes a tracked item, not a forgotten one. "I'll send you X" becomes a logged obligation. Run at the end of every meeting, every conversation that matters.

**Watchers** — the primitive between a one-time todo and a standing cron job. "Tell me when the contractor replies." "Notify me when this file appears." "Remind me 3 days before this invoice is due." Conditions that fire once when true, then stop. The mental model: a watcher is a durable promise the machine keeps so you don't have to.

**CRM Everything** — every person who touches your work gets a file. Not a Salesforce entry — a local markdown file. Created automatically from conversation context when the skill is invoked. The relationship history accumulates over time, readable by any agent, owned by you.

**Morning Briefing** — reads your state files, open loops, and watchers and generates a structured briefing. Priorities for today. Open loops needing action. Domain status. What would a smart chief of staff tell you in the first 10 minutes of the day? That's what this generates.

**Session Digest** — at the end of a session, generates a structured summary of decisions made, work shipped, unfinished items, and context for the next session. The next session reads it first. No more starting cold.

---

## What I learned building this

**The context is the product, not the agent.** I kept thinking the CEO orchestrator was the impressive thing. It isn't. The impressive thing is that when the CEO orchestrator reads jd-mental-models.md, it makes recommendations I actually agree with. The architecture is table stakes. The personal context is what creates the leverage.

**Formats that don't age are worth 10x templated systems.** Markdown files in a git repo outlast any SaaS. The four PCA files work with any AI model, any session, any future tool. I'll never migrate them. They're mine.

**The discipline of maintaining them is the hard part.** The files are useless if they're stale. The habit I built: any time an agent makes a recommendation I disagree with, I ask why. Usually it's because something in my mental models file is wrong or missing. Update the file, not the agent.

**Open loops are the biggest leverage point.** More than any other piece of the system, tracking commitments changed how much I got done. The discipline of extracting every "I'll" and "I'll send" and "let me get back to you" — and then actually tracking whether they resolved — is the single biggest operational improvement I made in 2026.

---

## The honest disclaimer

This system took six months and 133 projects to build to its current state. What I'm sharing here is the distillation — the 20% that creates 80% of the value.

The four template files and five skills take an afternoon to set up. The returns start immediately and compound over months as the files get richer and the agents get better at predicting what you actually want.

The context isn't a product you buy. It's a system you build. The templates are the starting point. Your receipts — your actual examples, your real decisions, your actual hard rules — are what make it yours.

---

## Get started

The templates and skills are open source: **[github.com/JDDavenport/context-kit](https://github.com/JDDavenport/context-kit)**

Clone the repo and run `bash scripts/install.sh` to copy everything to the right places. Then spend an afternoon filling in your four PCA files.

The skills pack (5 advanced skills, updates, private build log) is $39 at Gumroad.

The course — "Build your personal AI OS" — is taking pre-orders at $149. If 10 people pre-order, I'll record it.

Questions: find me at [jddavenport.com](https://jddavenport.com) or on LinkedIn.

---

*JD Davenport is a product leader and AI systems builder based in Provo, UT. He runs the AgentTree Hub — a zero-to-hero curriculum for Claude Code practitioners at [agenttree.ai](https://agenttree.ai).*
