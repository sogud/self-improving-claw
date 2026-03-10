# self-improving-claw

A minimal self-improvement system for OpenClaw.

## When to Log

| Situation | File |
|-----------|------|
| User correction | `.learnings/LEARNINGS.md` |
| Command failure | `.learnings/ERRORS.md` |
| Missing feature | `.learnings/FEATURE_REQUESTS.md` |

## Installation

```bash
git clone https://github.com/immersogud/self-improving-claw.git \
  ~/.openclaw/skills/self-improving-claw

mkdir -p ~/.openclaw/workspace/.learnings
touch ~/.openclaw/workspace/.learnings/{LEARNINGS,ERRORS,FEATURE_REQUESTS}.md
```

## Enable Hook (Optional)

```bash
cp -r hooks/openclaw ~/.openclaw/hooks/self-improving-claw
openclaw hooks enable self-improving-claw
```

## Optional: Daily Check (Cron)

Add to `~/.openclaw/openclaw.json`:

```json
{
  "cron": {
    "self-improving-check": {
      "schedule": "0 9 * * *",
      "prompt": "Check ~/.openclaw/workspace/.learnings/ for patterns. If same error appears 3+ times, remind user to promote to AGENTS.md/SOUL.md/TOOLS.md. Reply with brief summary only if patterns found, otherwise NO_REPLY.",
      "systemPrompt": "You are a self-improvement reminder. Check learning logs, identify repeated patterns, suggest promotions. Be concise. Use NO_REPLY if nothing important.",
      "notify": true
    }
  }
}
```

This runs daily at 9am, checking for repeated patterns and suggesting promotions.

---

*Minimal version for OpenClaw*
