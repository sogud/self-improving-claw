#!/bin/bash
# Self-Improving Daily Report Generator
# Run via: openclaw cron or manually

LEARNINGS_DIR="${HOME}/.openclaw/workspace/.learnings"
REPORT_FILE="${LEARNINGS_DIR}/DAILY_REPORT.md"
DATE=$(date +%Y-%m-%d)

# Count entries
LEARNING_COUNT=$(grep -c "^## \[" "${LEARNINGS_DIR}/LEARNINGS.md" 2>/dev/null || echo "0")
ERROR_COUNT=$(grep -c "^## \[" "${LEARNINGS_DIR}/ERRORS.md" 2>/dev/null || echo "0")
FEATURE_COUNT=$(grep -c "^## \[" "${LEARNINGS_DIR}/FEATURE_REQUESTS.md" 2>/dev/null || echo "0")

# Find repeated patterns (simple grep for similar content)
echo "# Daily Self-Improving Report - ${DATE}" > "${REPORT_FILE}"
echo "" >> "${REPORT_FILE}"
echo "## Summary" >> "${REPORT_FILE}"
echo "" >> "${REPORT_FILE}"
echo "| Category | Count |" >> "${REPORT_FILE}"
echo "|----------|-------|" >> "${REPORT_FILE}"
echo "| Learnings (corrections) | ${LEARNING_COUNT} |" >> "${REPORT_FILE}"
echo "| Errors | ${ERROR_COUNT} |" >> "${REPORT_FILE}"
echo "| Feature Requests | ${FEATURE_COUNT} |" >> "${REPORT_FILE}"
echo "" >> "${REPORT_FILE}"

# Extract today's entries
echo "## Today's Entries" >> "${REPORT_FILE}"
echo "" >> "${REPORT_FILE}"

for file in LEARNINGS ERRORS FEATURE_REQUESTS; do
  FILE_PATH="${LEARNINGS_DIR}/${file}.md"
  if [ -f "${FILE_PATH}" ]; then
    TODAY_ENTRIES=$(grep -A5 "^## \[${DATE}" "${FILE_PATH}" 2>/dev/null)
    if [ -n "${TODAY_ENTRIES}" ]; then
      echo "### ${file}" >> "${REPORT_FILE}"
      echo "" >> "${REPORT_FILE}"
      echo "${TODAY_ENTRIES}" >> "${REPORT_FILE}"
      echo "" >> "${REPORT_FILE}"
    fi
  fi
done

# Pattern detection (simple: count occurrences of similar phrases)
echo "## Pattern Detection" >> "${REPORT_FILE}"
echo "" >> "${REPORT_FILE}"
echo "_Note: Manual review needed to confirm patterns for promotion._" >> "${REPORT_FILE}"
echo "" >> "${REPORT_FILE}"

# Check for potential promotions (entries mentioning same topic)
echo "### Potential Promotions (appears 2+ times)" >> "${REPORT_FILE}"
echo "" >> "${REPORT_FILE}"

# Simple pattern: look for repeated keywords
KEYWORDS=("确认" "trash" "rm" "config" "gateway" "browser")
for keyword in "${KEYWORDS[@]}"; do
  COUNT=$(grep -c "${keyword}" "${LEARNINGS_DIR}/LEARNINGS.md" 2>/dev/null || echo "0")
  if [ "${COUNT}" -ge 2 ]; then
    echo "- '${keyword}' appears ${COUNT} times → consider promoting to AGENTS.md/TOOLS.md" >> "${REPORT_FILE}"
  fi
done

echo "" >> "${REPORT_FILE}"
echo "---" >> "${REPORT_FILE}"
echo "" >> "${REPORT_FILE}"
echo "Generated at: $(date)" >> "${REPORT_FILE}"

echo "Report generated: ${REPORT_FILE}"
