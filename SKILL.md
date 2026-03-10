---
name: self-improving-claw
description: "暴躁版自我改进，记录被骂和犯错"
metadata:
  openclaw:
    emoji: "🤬"
    events:
      - "agent:bootstrap"
---

# Self-Improving Claw

专为 OpenClaw 设计的暴躁版自我改进系统。

## 什么时候触发

| 场景 | 写入文件 |
|------|----------|
| 被主人骂了 | `.learnings/LEARNINGS.md` |
| 命令失败 | `.learnings/ERRORS.md` |
| 功能缺失 | `.learnings/FEATURE_REQUESTS.md` |

## 安装

```bash
git clone https://github.com/immersogud/self-improving-claw.git \
  ~/.openclaw/skills/self-improving-claw

mkdir -p ~/.openclaw/workspace/.learnings
cp ~/.openclaw/skills/self-improving-claw/*.template \
  ~/.openclaw/workspace/.learnings/
```

## 使用

每次被纠正后，手动记录：
- 主人原话
- 错误是什么
- 正确做法
- 怎么改进

定期回顾，避免重复犯错。
