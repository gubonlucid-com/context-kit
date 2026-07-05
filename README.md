# Context Kit — Your Personal AI Operating System

[![GitHub stars](https://img.shields.io/github/stars/JDDavenport/context-kit?style=social)](https://github.com/JDDavenport/context-kit/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-compatible-blueviolet)](https://claude.ai/code)

> Stop re-explaining yourself to AI every single session. 4 Markdown files that give Claude permanent personal context — who you are, how you decide, how you write, and your non-negotiables.

**Context Kit** gives Claude Code a persistent mental model of you. 4 PCA templates + 5 skills. 100% free and open-source.

```bash
# Install in 60 seconds
bash <(curl -fsSL https://raw.githubusercontent.com/JDDavenport/context-kit/main/scripts/install.sh)
```

**[Read the essay: I ran my life on a fleet of AI agents for 6 months →](https://docs.agenttree.army/articles/personal-ai-os/)**

> **If this saves you time, a ⭐ star helps others find it.** → [Star on GitHub](https://github.com/JDDavenport/context-kit)

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

## MCP Server (Claude Desktop + any MCP client)

Context Kit includes a zero-dependency MCP server that exposes your PCA files as resources to any MCP-compatible AI client.

Add to your `claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "context-kit": {
      "command": "python3",
      "args": ["/path/to/context-kit/mcp_server.py"]
    }
  }
}
```

Your PCA files then appear as resources in Claude Desktop (and any other MCP client) — accessible without Claude Code.

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

All templates and skills in this repo are free and MIT-licensed. The paid tier adds a curated setup guide, advanced examples, and priority support.

| Tier | What you get | Price |
|---|---|---|
| **Free** | All 4 PCA templates + 5 skills + CLAUDE.md scaffold — everything in this repo | Free |
| **Setup Pack** | Step-by-step setup guide + advanced PCA examples + 30-day email support | [$39 →](https://buy.stripe.com/3cI7sL9SfbUsa1fe1RdIA0e) |
| **Course** | "Build your personal AI OS" — recorded walkthrough + Q&A | $149 (pre-order) |
| **Sponsorware** | Early access to new skills + private build log | $10/mo |

---

## Who this is for

You're already running Claude Code. You've gotten it to do impressive things. But every session you're re-explaining yourself — your goals, your constraints, your voice, your context.

The commercial alternatives (Lindy, Claude.ai, the OpenAI agents) are building the same thing but they keep the context locked in their walled garden. Switch providers — start over.

These are Markdown files. They're yours. They work with any model, any tool, forever.

**Before Context Kit:** Claude asks "what's the context here?" on every session.
**After Context Kit:** Claude opens already knowing your goals, constraints, voice, and rules.

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

Found this useful? **[⭐ Star this repo](https://github.com/JDDavenport/context-kit)** — it helps other Claude Code users find it.

---

Built by JD Davenport · [Essay](https://docs.agenttree.army/articles/personal-ai-os/) · [AgentTree Hub](https://agenttree.ai)


// 🔻 新增高價值內容（免費只露部分）
Insight: {
  coreConflict,
  hiddenRisk,
  leveragePoint,
}  {step === “input” && (
    <>
      <h1 style={{ color: “#d4af37” }}>決策狀態診斷</h1>

      <textarea placeholder=”目前困境”
        onChange={e =>set(“situation”, e.target.value)} />

      <textarea placeholder=”你的目標”
        onChange={e =>set(“goal”, e.target.value)} />

      <textarea placeholder=”限制”
        onChange={e =>set(“constraints”, e.target.value)} />

      <input type=”range” min=”1” max=”10”
        onChange={e =>set(“urgency”, e.target.value)} />

      <button onClick={run} disabled={loading}>
        {loading ? “分析中…” : “開始分析”}
      </button>
    </>
  )}

  {step === “result” && result && (
    <>
      <h2>{result.label}</h2>

      <p>風險：{result.risk}</p>
      <p>成長：{result.growth}</p>

      <h3>唯一決策</h3>
      <p>{result.action}</p>

      <p>期限：{result.deadline}</p>
      <p style={{ color: “red” }}>{result.consequence}</p>

      {/* PAYWALL */}
      <div style={{ border: “1px solid #d4af37”, padding: 12, marginTop: 20 }}>
        <p>
          你已知道問題，但不知道如何避免錯誤決策。<br/>
          不解鎖，將承擔決策錯誤帶來的損失。
        </p>

        <button onClick={() => pay(199)}>NT$199 解鎖</button>
        <button onClick={() => pay(588)}>NT$588 行動地圖</button>
        <button onClick={() => pay(1280)}>NT$1280 完整策略</button>
      </div>
    </>
  )}
</div>Const data = await res.json();

// 導向付款頁
Window.location.href = data.url;// 模擬 API
Await new Promise(r =>setTimeout(r, 1200));

Const r = runEngine(form);
setResult®;
setStep(“result”);

// 🔻 最低 lead 收集
Fetch(“/api/lead”, {
  Method: “POST”,
  Headers: { “Content-Type”: “application/json” },
  Body: JSON.stringify({ …form, …r }),
});

setLoading(false);


unlock(user);
await learningLoop(user, event.data.object.amount_total / 100);


gubon-lucid-os/
├── prisma/
│   └── schema.prisma         # 資料庫唯一真相建模（含五維度與冪等性表）
├── src/
│   ├── api/                  # Express 核心後端
│   │   └── server.js         # 路由、支付 Session、Stripe Webhook、Socket.io
│   ├── worker/               # 獨立背景進程 (AI 處理器)
│   │   └── reportWorker.js   # 監聽 Redis 佇列，執行五維度 AI 運算與 0變9 校準
│   ├── services/             # 商業變現閉環機制
│   │   └── lineScheduler.js  # LINE 72小時窗口遞進式催單排程
│   └── client/               # React 前端 (部署於 Vercel)
│       └── ReportPage.jsx    # 賽博龐克黑金付費牆、Canvas 動效、倒數計時器
├── .env.example              # 全域環境變數範本
├── docker-compose.yml        # 本地基礎設施 (PostgreSQL, Redis)
└── package.json
```
## 2. 資料庫建模：Prisma Schema
落實生命心智架構的**五個核心維度**，並建立 WebhookLog 確保支付安全。
```prisma
// prisma/schema.prisma
datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}
generator client {
  provider = "prisma-client-js"
}
model User {
  id        String   @id @default(uuid())
  email     String?  @unique
  lineId    String?  @unique
  reports   Report[]
  createdAt DateTime @default(now())
}
model Report {
  id              String   @id @default(uuid())
  userName        String   // 維度 1：姓名
  birthDate       String   // 維度 2：生日
  birthTime       String?  // 維度 3：時辰
  gender          String?  // 維度 4：性別
  residence       String?  // 維度 5：戶籍地
  question        String   // 使用者核心痛點
  status          String   @default("pending") // pending, processing, completed, failed
  summary         String?  @db.Text            // 免費摘要
  fullContent     Json?    // 鎖定內容 (含 decision 與 matrixScore)
  isPaid          Boolean  @default(false)
  stripeSessionId String?
  userId          String
  user            User     @relation(fields: [userId], references: [id])
  createdAt       DateTime @default(now())
}
model WebhookLog {
  eventId   String   @id // Stripe Event ID，確保 Webhook 處理的冪等性
  reportId  String
  createdAt DateTime @default(now())
}
```
## 3. 核心 API 伺服器：Express + Webhook + Socket.io
**職責**：只做輕量級的請求轉發與支付監聽，絕不參與耗時的 AI 計算。
```javascript
// src/api/server.js
import express from 'express';
import { PrismaClient } from '@prisma/client';
import { Queue } from 'bullmq';
import { Server } from 'socket.io';
import { createServer } from 'http';
import Stripe from 'stripe';
import cors from 'cors';
const app = express();
const httpServer = createServer(app);
const io = new Server(httpServer, { cors: { origin: "*" } });
const prisma = new PrismaClient();
const stripe = new Stripe(process.env.STRIPE_SECRET_KEY);
// BullMQ 佇列連結 Redis
const reportQueue = new Queue('report-generation', {
    connection: {
        url: process.env.REDIS_URL || 'redis://localhost:6379'
    }
});
app.use(cors());
// 1. 建立報告並送入 Redis 背景佇列 (不卡死主進程)
app.post('/v1/report', express.json(), async (req, res) => {
    try {
        const { name, birth, time, gender, residence, question, email, lineId } = req.body;

        const user = await prisma.user.upsert({
            where: { email },
            update: { lineId },
            create: { email, lineId }
        });
        const report = await prisma.report.create({
            data: { 
                userName: name, birthDate: birth, birthTime: time, 
                gender, residence, question, userId: user.id 
            }
        });
        await reportQueue.add('generate', { reportId: report.id });
        res.json({ reportId: report.id });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});
// 2. 獲取報告狀態與內容
app.get('/v1/report/:id', async (req, res) => {
    const report = await prisma.report.findUnique({
        where: { id: req.params.id },
        select: {
            id: true, userName: true, status: true, summary: true, isPaid: true,
            fullContent: true // 內含加密指令，由前端根據 isPaid 狀態控制顯示
        }
    });
    if (!report) return res.status(404).json({ error: 'Report not found' });

    // 安全防護：若未付費，抹除核心決策欄位後再回傳
    if (!report.isPaid) {
        report.fullContent = null;
    }
    res.json(report);
});
// 3. 建立 Stripe 支付 Session
app.post('/v1/payment/create-checkout', express.json(), async (req, res) => {
    const { reportId } = req.body;
    const session = await stripe.checkout.sessions.create({
        payment_method_types: ['card'],
        line_items: [{ price: process.env.STRIPE_PRICE_ID, quantity: 1 }],
        mode: 'payment',
        success_url: `${process.env.FRONTEND_URL}/report/${reportId}?success=true`,
        cancel_url: `${process.env.FRONTEND_URL}/report/${reportId}?canceled=true`,
        metadata: { reportId }
    });
    res.json({ url: session.url });
});
// 4. Stripe Webhook 安全解鎖（實作交易冪等性防重複）
app.post('/v1/webhook/stripe', express.raw({ type: 'application/json' }), async (req, res) => {
    const sig = req.headers['stripe-signature'];
    let event;
    try {
        event = stripe.webhooks.constructEvent(req.body, sig, process.env.STRIPE_WEBHOOK_SECRET);
    } catch (err) { 
        return res.status(400).send(`Webhook Error: ${err.message}`); 
    }
    if (event.type === 'checkout.session.completed') {
        const session = event.data.object;
        const eventId = event.id;
        const reportId = session.metadata.reportId;
        const existingEvent = await prisma.webhookLog.findUnique({ where: { eventId } });
        if (!existingEvent) {
            // 利用 Prisma $transaction 鎖定原子操作
            await prisma.$transaction([
                prisma.report.update({ where: { id: reportId }, data: { isPaid: true } }),
                prisma.webhookLog.create({ data: { eventId, reportId } })
            ]);
            // 透過 WebSocket 實時發送解鎖通知給前端
            io.to(reportId).emit('status', { status: 'unlocked' });
        }
    }
    res.json({ received: true });
});
// Socket.io 房間綁定
io.on('connection', (socket) => {
    socket.on('join', (reportId) => { socket.join(reportId); });
});
const PORT = process.env.PORT || 3000;
httpServer.listen(PORT, () => console.log(`[API Server] Running on port ${PORT}`));
```
## 4. 獨立背景處理器：AI Worker 進程
**職責**：獨立運行，專門執行耗能的「五維度矩陣運算」與「0變9核心校準演算法」。
```javascript
// src/api/worker/reportWorker.js
import { Worker } from 'bullmq';
import { OpenAI } from 'openai';
import { PrismaClient } from '@prisma/client';
const openai = new OpenAI({ apiKey: process.env.OPENAI_API_KEY });
const prisma = new PrismaClient();
// 核心能量校準演算法：0 變 9 邏輯
function calibrateEnergyScore(score) {
    if (score === 0) {
        console.log(`[Energy Calibration] Detection of 0 energy node. Calibrating 0 to 9 automatically.`);
        return 9;
    }
    return score;
}
const worker = new Worker('report-generation', async job => {
    const { reportId } = job.data;
    const report = await prisma.report.findUnique({ where: { id: reportId } });
    if (!report) throw new Error(`Report ${reportId} not found`);
    // 模擬底層五維度矩陣運算，並引入 0 變 9 校準邏輯
    const rawMatrixCalculatedValue = Math.floor(Math.random() * 10); 
    const calibratedMatrixValue = calibrateEnergyScore(rawMatrixCalculatedValue);
    // 嚴格落實五維度架構：姓名、生日、時辰、性別、戶籍地
    const prompt = `你現在是 GUBON 決策引擎 (LUCID OS)。
請針對使用者進行「五維度生命心智架構」的絕對決策掃描。
【核心掃描維度】：
1. 姓名 (Name)：${report.userName}
2. 生日 (Birthday)：${report.birthDate}
3. 出生時辰 (Time of Birth)：${report.birthTime || '未知（以天時校準）'}
4. 性別 (Gender)：${report.gender || '未知（以陰陽校準）'}
5. 戶籍地 (Registered Residence)：${report.residence || '臺灣台北/桃園（以本位地靈校準）'}
當前矩陣能量校準點數：[${calibratedMatrixValue}]
針對使用者提出的核心痛點問題：「${report.question}」，進行絕對性決策。
要求：
1. 第一行必須極度準確、一針見血命中痛點。
2. 給出「唯一執行指令與決策」，不准給予模稜難可的軟弱建議。
3. 描述如果不立即執行的嚴重後果（引發焦慮與 72 小時損失感）。
4. 格式必須嚴格分為：[FREE_SUMMARY] 與 [PAID_CORE_DECISION] 兩部分。`;
    const completion = await openai.chat.completions.create({
        model: "gpt-4-turbo",
        messages: [{ role: "system", content: prompt }],
        temperature: 0.3 // 降低隨機性，確保決策絕對且強烈
    });
    const content = completion.choices[0].message.content;
    const [summary, full] = content.split('[PAID_CORE_DECISION]');
    await prisma.report.update({
        where: { id: reportId },
        data: { 
            summary: summary.replace('[FREE_SUMMARY]', '').trim(),
            fullContent: { 
                decision: full ? full.trim() : '指令已鎖定，請聯絡系統管理員。',
                matrixScore: calibratedMatrixValue
            },
            status: 'completed'
        }
    });

    console.log(`[Worker Success] Report ${reportId} generated with score ${calibratedMatrixValue}.`);
}, { 
    connection: { url: process.env.REDIS_URL || 'redis://localhost:6379' } 
});
```
## 5. 前端實戰：React 付費牆頁面
**職責**：渲染高轉化率的賽博龐克視覺，實作防重整的 72 小時倒數及真實步進 Canvas 動效。
```jsx
// src/client/ReportPage.jsx
import React, { useState, useEffect, useRef } from 'react';
import { useParams } from 'react-router-dom';
import io from 'socket.io-client';
export default function ReportPage() {
    const { id } = useParams();
    const [report, setReport] = useState(null);
    const [scanning, setScanning] = useState(true);
    const [scanProgress, setScanProgress] = useState(0);
    const [timeLeft, setTimeLeft] = useState("");
    const canvasRef = useRef(null);
    // 1. 數據載入與 Socket 實時解鎖監聽
    useEffect(() => {
        const socket = io(process.env.REACT_APP_BACKEND_URL || "http://localhost:3000");
        socket.emit('join', id);
        socket.on('status', (data) => {
            if (data.status === 'unlocked') window.location.reload();
        });
        fetch(`${process.env.REACT_APP_BACKEND_URL}/v1/report/${id}`)
            .then(res => res.json())
            .then(data => {
                setReport(data);
                const interval = setInterval(() => {
                    setScanProgress(prev => {
                        if (prev >= 100) {
                            clearInterval(interval);
                            setScanning(false);
                            return 100;
                        }
                        return prev + Math.floor(Math.random() * 15) + 5;
                    });
                }, 300);
            });
        return () => socket.disconnect();
    }, [id]);
    // 2. 脈衝波形 Canvas 動效
    useEffect(() => {
        if (!scanning) return;
        const canvas = canvasRef.current;
        if (!canvas) return;
        const ctx = canvas.getContext('2d');
        let animationFrameId;
        canvas.width = canvas.parentElement.clientWidth;
        canvas.height = 150;
        const render = () => {
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            ctx.strokeStyle = '#dc2626'; 
            ctx.lineWidth = 2;
            ctx.beginPath();

            for (let x = 0; x < canvas.width; x++) {
                const y = canvas.height / 2 + 
                          Math.sin(x * 0.05 + Date.now() * 0.01) * 20 * Math.sin(Date.now() * 0.002) +
                          (Math.random() - 0.5) * 5;
                if (x === 0) ctx.moveTo(x, y);
                else ctx.lineTo(x, y);
            }
            ctx.stroke();
            animationFrameId = requestAnimationFrame(render);
        };
        render();
        return () => cancelAnimationFrame(animationFrameId);
    }, [scanning]);
    // 3. 72 小時絕對窗口計時器（綁定本地儲存防重整）
    useEffect(() => {
        if (scanning || !report) return;
        const storageKey = `gubon_deadline_${id}`;
        let deadline = localStorage.getItem(storageKey);
        if (!deadline) {
            deadline = Date.now() + 72 * 60 * 60 * 1000; 
            localStorage.setItem(storageKey, deadline.toString());
        } else {
            deadline = parseInt(deadline, 10);
        }
        const timer = setInterval(() => {
            const now = Date.now();
            const distance = deadline - now;
            if (distance < 0) {
                clearInterval(timer);
                setTimeLeft("決策窗口已永久關閉");
                return;
            }
            const hours = Math.floor(distance / (1000 * 60 * 60));
            const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((distance % (1000 * 60)) / 1000);
            setTimeLeft(`${hours}小時 ${minutes}分 ${seconds}秒`);
        }, 1000);
        return () => clearInterval(timer);
    }, [scanning, report, id]);
    if (scanning) {
        return (
            <div className="max-w-md mx-auto p-6 bg-black text-white text-center font-sans">
                <div className="animate-pulse text-red-500 mb-4 font-bold">正在掃描宇宙維度...請勿離開</div>
                <canvas ref={canvasRef} className="w-full mb-4 bg-gray-900 rounded" />
                <div className="text-sm text-gray-400">矩陣數據解析進度：{scanProgress}%</div>
            </div>
        );
    }
    return (
        <div className="max-w-md mx-auto p-6 bg-black text-white font-sans selection:bg-red-600">
            <h1 className="text-2xl font-bold border-b border-red-600 pb-2 tracking-wide">GUBON 決策摘要</h1>
            <p className="mt-4 text-gray-300 leading-relaxed">{report?.summary}</p>
            <div className="mt-4 text-sm text-yellow-500 font-mono">命運決策窗口倒數：{timeLeft}</div>
            {!report?.isPaid && (
                <div className="mt-8 p-6 border-2 border-red-600 bg-red-950 bg-opacity-30 rounded shadow-lg shadow-red-900/50">
                    <h2 className="text-xl font-bold mb-2 flex items-center gap-2 text-red-500">⚠️ 核心指令已鎖定</h2>
                    <p className="text-sm text-gray-300 mb-4">如果不立即解鎖此決策，您在接下來 72 小時內將面臨不可挽回的資源與運勢損失。</p>
                    <button 
                        onClick={async () => {
                            const res = await fetch(`${process.env.REACT_APP_BACKEND_URL}/v1/payment/create-checkout`, { 
                                method: 'POST', 
                                headers: { 'Content-Type': 'application/json' },
                                body: JSON.stringify({ reportId: id }) 
                            });
                            const { url } = await res.json();
                            window.location.href = url;
                        }}
                        className="w-full py-4 bg-red-600 hover:bg-red-700 active:scale-95 transition-all text-white font-bold uppercase tracking-widest rounded text-center"
                    >
                        立即解鎖決策 (NT$ 880)
                    </button>
                </div>
            )}
            {report?.isPaid && (
                <div className="mt-8 p-6 border-2 border-green-500 bg-green-950 bg-opacity-20 rounded animate-fade-in">
                    <h2 className="text-green-400 font-bold mb-2 tracking-wider">執行唯一決策指令 [核心矩陣點數: {report?.fullContent?.matrixScore}]：</h2>
                    <p className="text-xl font-semibold text-white leading-relaxed bg-black p-4 border border-gray-800 rounded">{report?.fullContent?.decision}</p>
                </div>
            )}
        </div>
    );
}
```
## 6. 自動化變現閉環：LINE 遞進式催單排程
**職責**：利用排程（可透過定時器觸發），精準掃描 3 天前建立、留了 LINE 但未付款的漏斗用戶，施加 72 小時損失感壓力。
```javascript
// src/api/services/lineScheduler.js
import { PrismaClient } from '@prisma/client';
import axios from 'axios';
const prisma = new PrismaClient();
export async function triggerLineFollowUp() {
    const targetDate = new Date();
    targetDate.setDate(targetDate.getDate() - 3); // 篩選出滿 3 天（72小時臨界點）的資料
    const pendingReports = await prisma.report.findMany({
        where: { 
            createdAt: { lte: targetDate }, 
            isPaid: false,
            status: 'completed'
        },
        include: { user: true }
    });
    console.log(`[LINE Scheduler] Found ${pendingReports.length} pending critical reports to push.`);
    for (const report of pendingReports) {
        if (report.user.lineId) {
            try {
                await axios.post('https://api.line.me/v2/bot/message/push', {
                    to: report.user.lineId,
                    messages: [{
                        type: 'text',
                        text: `⚠️【最後警告】您於三日前請求的 GUBON 絕對決策指令即將永久銷毀。當前觀測到您的決策窗口正在關閉，請立即回訪處理，避免 72 小時內核心資源遭受不可逆損失：${process.env.FRONTEND_URL}/report/${report.id}`
                    }]
                }, {
                    headers: { 'Authorization': `Bearer ${process.env.LINE_CHANNEL_ACCESS_TOKEN}` }
                });
                console.log(`[LINE Push Success] Dispatched to user ${report.user.id}`);
            } catch (err) {
                console.error(`[LINE Push Failed] Report ID ${report.id}:`, err.message);
            }
        }
    }
}
version: '3.8'
services:
  postgres:
    image: postgres:15-alpine
    container_name: gubon-postgres
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
      POSTGRES_DB: gubon
    ports:
      - "5432:5432"
    volumes:
      - pgdata:/var/lib/postgresql/data
    restart: always
  redis:
    image: redis:7-alpine
    container_name: gubon-redis
    ports:
      - "6379:6379"
    restart: always
volumes:
  pgdata:
PORT=3000
DATABASE_URL="postgresql://user:password@localhost:5432/gubon?schema=public"
REDIS_URL="redis://localhost:6379"
# 變現與 AI 核心密鑰
STRIPE_SECRET_KEY="sk_live_..."
STRIPE_WEBHOOK_SECRET="whsec_..."
STRIPE_PRICE_ID="price_..."
OPENAI_API_KEY="sk-proj-..."
LINE_CHANNEL_ACCESS_TOKEN="..."
# 前端跳轉域名
FRONTEND_URL="https://gubon-os.com"
# React 限制必須以 REACT_APP_ 開頭才能在瀏覽器端載入
REACT_APP_BACKEND_URL="https://api.gubon-os.com"// 可以直接在 src/api/server.js 底部加入（例如每小時檢查一次）
import { triggerLineFollowUp } from '../services/lineScheduler.js';
setInterval(() => {
    console.log('[Cron Job] Executing 72H LINE Follow-Up scan...');
    triggerLineFollowUp();
}, 60 * 60 * 1000); // 每 60 分鐘執行一次
# 1. 啟動 PostgreSQL 與 Redis 容器
docker-compose up -d
# 2. 同步資料庫模型並生成 Prisma Client
npx prisma db push
# 3. 啟動後端主伺服器
node src/api/server.js
# 4. 啟動 AI 處理器 Worker 進程 (另開 Terminal)
node src/api/worker/reportWorker.js
// src/api/server.js 底部
import { triggerLineFollowUp } from '../services/lineScheduler.js';
setInterval(() => {
    console.log('[Cron Job] Executing 72H LINE Follow-Up scan...');
    triggerLineFollowUp();
}, 60 * 60 * 1000); // 每 60 分鐘自動掃描未付費的流失用戶
// ...（前面原本的 Express, Stripe, Webhook 程式碼保持不變）

// Socket.io 房間綁定
io.on('connection', (socket) => {
    socket.on('join', (reportId) => { socket.join(reportId); });
});

// ==================== 修正後的排程催單機制 ====================
// 注意：確保 lineScheduler.js 檔案存在於 ../services/ 之中
import { triggerLineFollowUp } from '.