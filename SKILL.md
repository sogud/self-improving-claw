---
name: self-improving-claw
description: "Captures corrections, errors, profanity (傻逼，草泥马，操你妈，他妈的，你他妈，我操，卧槽，妈的，滚，fuck, fucking, shit, bullshit, damn, hell, asshole, bitch, dumb, stupid, idiot, wtf, are you kidding, seriously), wrong tool usage, and missing features. Triggers on: user corrections, command failures, strong language, repeated mistakes, frustration signals."
metadata:
  openclaw:
    emoji: "📝"
    events:
      - "agent:bootstrap"
      - "tool_result_persist"
      - "message:received"
---

# Self-Improving Claw

Captures user corrections, command failures, and frustration signals for continuous improvement.

## Trigger Conditions (Log When)

| Condition | Log File | Priority |
|-----------|----------|----------|
| User corrects you | `LEARNINGS.md` | High |
| Command fails | `ERRORS.md` | High |
| User shows frustration (profanity, strong language) | `LEARNINGS.md` | Critical |
| Wrong tool for job | `LEARNINGS.md` | Medium |
| Missing feature | `FEATURE_REQUESTS.md` | Low |
| User repeats instruction | `LEARNINGS.md` | Medium |

## Why Frustration Triggers Matter

When user expresses frustration or uses strong language, it indicates:

- **Critical error** — not a minor issue
- **High frustration** — user is genuinely upset
- **Pattern repeated** — same mistake happened before
- **Stop immediately** — reassess before continuing

## Analysis Flow

When frustration is detected:

1. **Stop** — pause current action
2. **Acknowledge** — recognize the error
3. **Analyze** — what caused the frustration?
   - Wrong tool?
   - Ignored instruction?
   - Repeated mistake?
   - Misunderstood requirement?
4. **Log** — write to `LEARNINGS.md` with user's exact words
5. **Improve** — suggest concrete changes

## Log Templates

### LEARNINGS.md

```markdown
## [YYYY-MM-DD] Brief description

**Trigger:** [profanity | correction | wrong-tool | repetition]
**User said:** "..."

**What I did wrong:** ...
**What I should do:** ...
**How to improve:** ...
```

### ERRORS.md

```markdown
## [YYYY-MM-DD] Brief description

**Command:** `...`
**Exit code:** ...
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
| Frustration triggers | `SKILL.md` | Add to description keyword list |

## Installation

```bash
git clone https://github.com/immersogud/self-improving-claw.git \
  ~/.openclaw/skills/self-improving-claw

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
├── LEARNINGS.md          # Corrections, frustration, wrong-tool
├── ERRORS.md             # Command failures
└── FEATURE_REQUESTS.md   # Feature requests
```

## Core Principle

> Log it, learn it, don't repeat it.

- **Log quickly**: One line + user quote (even if profane)
- **Review weekly**: Check `.learnings/` regularly
- **Improve continuously**: Same mistake max 3 times
- **Respect frustration**: It's valid feedback, not personal
