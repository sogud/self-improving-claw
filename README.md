# self-improving-claw

A minimal self-improvement system for OpenClaw.

## When to Log

| Situation | File |
|-----------|------|
| User correction | `.learnings/LEARNINGS.md` |
| Command failure | `.learnings/ERRORS.md` |
| Missing feature | `.learnings/FEATURE_REQUESTS.md` |

## Daily Report (Optional)

Auto-generate daily summary with pattern detection:

```bash
# Add to OpenClaw cron (see CRON.md)
bash ~/.openclaw/skills/self-improving-claw/scripts/generate-report.sh
```

See [CRON.md](CRON.md) for configuration.

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

---

*Minimal version for OpenClaw*
