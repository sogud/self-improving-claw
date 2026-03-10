# Cron Configuration for Self-Improving Claw

Add to your OpenClaw config (`~/.openclaw/openclaw.json`):

```json
{
  "cron": {
    "self-improving-daily-report": {
      "schedule": "0 9 * * *",
      "command": "bash ~/.openclaw/skills/self-improving-claw/scripts/generate-report.sh",
      "notify": true
    }
  }
}
```

Or run manually:

```bash
bash ~/.openclaw/skills/self-improving-claw/scripts/generate-report.sh
```

## Report Output

Generated at: `~/.openclaw/workspace/.learnings/DAILY_REPORT.md`

Contains:
- Daily summary counts
- Today's new entries
- Pattern detection (potential promotions)

## Promotion Workflow

1. Review `DAILY_REPORT.md`
2. Identify patterns with 3+ occurrences
3. Manually promote to `AGENTS.md`, `TOOLS.md`, or `SOUL.md`
4. Mark as promoted in original `.learnings/` entry
