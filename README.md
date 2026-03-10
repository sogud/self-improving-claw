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

---

*Minimal version for OpenClaw*
