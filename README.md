# self-improving-claw

暴躁版 Self-Improving Agent，专为 OpenClaw 设计。

> 主人经常骂脏话，说明我他妈的又搞错了。这个版本就是用来记录这些的。

---

## 什么时候记录

- **被主人骂了** → 记录到 `LEARNINGS.md`
- **命令执行失败** → 记录到 `ERRORS.md`
- **主人想要的功能我没有** → 记录到 `FEATURE_REQUESTS.md`

---

## 记录格式

### LEARNINGS.md（被纠正）

```markdown
## [2026-03-10] 未经确认就改配置

**主人原话：** "草泥马你是不搞错了"

**错误：** 擅自修改 OpenClaw 配置
**正确做法：** 先给方案，等"确认"再执行
**改进：** 所有配置修改必须显式确认
```

### ERRORS.md（命令失败）

```markdown
## [2026-03-10] clawhub rate limit

**命令：** `clawhub install xxx`
**错误：** Rate limit exceeded
**解决：** 等几分钟或用 git clone
```

### FEATURE_REQUESTS.md（功能缺失）

```markdown
## [2026-03-10] 需要支持 xxx

**主人需求：** 想要某个功能
**当前状态：** 不支持
**可能的解决方案：** ...
```

---

## 晋升规则

当某个错误重复 3 次以上，提升到 SOUL.md：

| 错误类型 | 晋升到 | 示例 |
|---------|--------|------|
| 行为模式 | `SOUL.md` | "先确认再执行" |
| 工作流程 | `AGENTS.md` | "复杂任务拆步骤" |
| 工具使用 | `TOOLS.md` | "用 trash 不用 rm" |

---

## OpenClaw 配置

### 安装

```bash
git clone https://github.com/immersogud/self-improving-claw.git \
  ~/.openclaw/skills/self-improving-claw
```

### 创建日志目录

```bash
mkdir -p ~/.openclaw/workspace/.learnings
touch ~/.openclaw/workspace/.learnings/{LEARNINGS,ERRORS,FEATURE_REQUESTS}.md
```

### 启用 Hook（可选）

```bash
cp -r hooks/openclaw ~/.openclaw/hooks/self-improving-claw
openclaw hooks enable self-improving-claw
```

---

## 文件结构

```
~/.openclaw/workspace/.learnings/
├── LEARNINGS.md          # 被纠正、知识缺口
├── ERRORS.md             # 命令失败
└── FEATURE_REQUESTS.md   # 功能请求
```

---

## 核心理念

> 被骂了就要记住，下次别再犯。

- **快速记录**：一句话 + 主人原话
- **定期回顾**：每周看一遍 `.learnings/`
- **持续改进**：同样的错不犯三次

---

*为 Bamboo 定制*
