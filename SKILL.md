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

Captures user corrections, command failures, profanity, and missing features for continuous improvement.

## Trigger Conditions (Log When)

| Condition | Log File | Priority |
|-----------|----------|----------|
| User corrects you | `LEARNINGS.md` | High |
| Command fails | `ERRORS.md` | High |
| User uses profanity | `LEARNINGS.md` | Critical |
| Wrong tool for job | `LEARNINGS.md` | Medium |
| Missing feature | `FEATURE_REQUESTS.md` | Low |
| User repeats instruction | `LEARNINGS.md` | Medium |

## Profanity & Frustration Keywords

### Critical Signals (Log Immediately)

**Chinese profanity:**
- 傻逼, 草泥马, 操你妈, 他妈的, 你他妈
- 我操, 我靠, 卧槽, 沃草
- 搞什么, 什么鬼, 神经病
- 滚, 去死, 妈的

**English profanity:**
- fuck, fucking, fucked, WTF
- shit, bullshit, damn, hell
- ass, asshole, bitch, bastard
- dumb, stupid, idiot, moron, retard

### High-Intensity Feedback

**Chinese:**
- 不对, 错了, 不是这样, 不是, 别
- 你搞错了, 不对吧, 改下, 重弄
- 算了, 不用了, 随你, 随便, 放弃
- 听不懂吗, 说几遍了, 还没好

**English:**
- that's wrong, no, incorrect, actually
- stop, don't, not right, nope
- fix this, change it, redo it
- are you kidding, seriously, come on
- whatever, never mind, forget it
- how many times, I said, still not

### Tool Usage Errors

**Wrong tool selected:**
- "用 browser" (when should use web_fetch)
- "用 exec" (when should use built-in tool)
- "直接改" (when should ask for confirmation)

**Command failures to log:**
- `rm` instead of `trash`
- `openclaw config set` without confirmation
- `git push` without checking status
- Any command with exit code ≠ 0

## Why Profanity Matters

When user says profanity, it indicates:
- **Severity**: Critical error, not minor issue
- **Urgency**: Stop current action immediately
- **Frustration**: Pattern has repeated before
- **Action**: Log and reassess, don't continue

> User genuinely uses profanity when frustrated. This is authentic feedback—log it immediately without defensiveness.

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
| Profanity triggers | `SKILL.md` | Add to keyword list |

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
├── LEARNINGS.md          # Corrections, profanity, wrong-tool
├── ERRORS.md             # Command failures
└── FEATURE_REQUESTS.md   # Feature requests
```

## Core Principle

> Log it, learn it, don't repeat it.

- **Log quickly**: One line + user quote (profanity included)
- **Review weekly**: Check `.learnings/` regularly
- **Improve continuously**: Same mistake max 3 times
- **Respect profanity**: It's valid feedback, not personal
