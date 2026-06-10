#!/bin/sh
ENTRY="$(ls -d "$HOME"/.claude/plugins/cache/claude-dashboard/claude-dashboard/*/dist/index.js 2>/dev/null | sort -V | tail -1)"
node "$ENTRY" | perl -pe 's/│((?:\e\[[0-9;]*m)*) ((?:\e\[[0-9;]*m)*)(\d+%)/│$1 ${2}ctx: $3/'
