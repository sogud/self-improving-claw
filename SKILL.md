---
name: self-improving-claw
description: "Self-improvement system that captures corrections and errors"
metadata:
  openclaw:
    emoji: "📝"
    events:
      - "agent:bootstrap"
---

# Self-Improving Claw

Captures user corrections, command failures, and missing features for continuous improvement.

## When to Log

| Trigger | Log File | Example |
|---------|----------|---------|
| User corrects you | `LEARNINGS.md` | "No, that's wrong..." |
| Command fails | `ERRORS.md` | `exec` returns non-zero |
| Feature missing | `FEATURE_REQUESTS.md` | User wants X, not supported |

## High-Priority Correction Signals

These indicate user is seriously unhappy and you need to log immediately:

**Direct corrections:**
- "不对", "错了", "不是这样", "不是"
- "你搞错了", "不对吧", "改下"
- "that's wrong", "no", "incorrect", "actually"
- "stop", "don't", "not right"
- "fix this", "change it"

**High-intensity feedback (authentic expressions of frustration):**
- "傻逼", "草泥马", "操你妈", "他妈的"
- "你他妈", "我操", "我靠", "搞什么"
- "dumb", "stupid", "idiot", "wtf", "damn"
- "are you kidding", "seriously", "come on"
- "fuck", "shit", "bullshit"

> Note: User genuinely uses profanity when frustrated. This is valid feedback—log it immediately.

**Dismissive tone (user giving up):**
- "算了", "不用了", "随你", "随便"
- "whatever", "never mind", "forget it"

## Why Profanity Matters

When user says "草泥马" or "fuck", it means:
- You made a significant error
- They're genuinely frustrated
- You need to stop and reassess
- **Log immediately, don't defend**

## Log Templates

### LEARNINGS.md

```markdown
## [YYYY-MM-DD] Brief description

**User said:** "..."

**What I did wrong:** ...
**What I should do:** ...
**How to improve:** ...
```

### ERRORS.md

```markdown
## [YYYY-MM-DD] Brief description

**Command:** `...`
**Error:** ...
**Fix:** ...
```

### FEATURE_REQUESTS.md

```markdown
## [YYYY-MM-DD] Feature description

**Request:** ...
**Current status:** Not supported
**Possible solution:** ...
```

## Promotion Rules

When a pattern repeats 3+ times, promote to:

| Pattern Type | Promote To | Example |
|--------------|------------|---------|
| Behavior | `SOUL.md` | "Confirm before config changes" |
| Workflow | `AGENTS.md` | "Break complex tasks into steps" |
| Tool usage | `TOOLS.md` | "Use trash, never rm" |

## Installation

```bash
# Clone to skills directory
git clone https://github.com/immersogud/self-improving-claw.git \
  ~/.openclaw/skills/self-improving-claw

# Create learning files
mkdir -p ~/.openclaw/workspace/.learnings
touch ~/.openclaw/workspace/.learnings/{LEARNINGS,ERRORS,FEATURE_REQUESTS}.md
```

## Optional: Enable Hook

```bash
cp -r hooks/openclaw ~/.openclaw/hooks/self-improving-claw
openclaw hooks enable self-improving-claw
```

## File Structure

```
~/.openclaw/workspace/.learnings/
├── LEARNINGS.md          # Corrections, knowledge gaps
├── ERRORS.md             # Command failures
└── FEATURE_REQUESTS.md   # Feature requests
```

## Core Principle

> Log it, learn it, don't repeat it.

- **Log quickly**: One line + user quote (even if profane)
- **Review weekly**: Check `.learnings/` regularly
- **Improve continuously**: Same mistake max 3 times
