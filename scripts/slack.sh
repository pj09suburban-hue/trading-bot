#!/usr/bin/env bash
# Notification wrapper. Posts to a Slack channel via chat.postMessage.
# Usage: bash scripts/slack.sh "<message>"
# If credentials are unset, appends to a local fallback file instead.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ENV_FILE="$ROOT/.env"
FALLBACK="$ROOT/NOTIFICATIONS.md"

if [[ -f "$ENV_FILE" ]]; then
  set -a
  # shellcheck disable=SC1090
  source "$ENV_FILE"
  set +a
fi

if [[ $# -gt 0 ]]; then
  msg="$*"
else
  msg="$(cat)"
fi

if [[ -z "${msg// /}" ]]; then
  echo "usage: bash scripts/slack.sh \"<message>\"" >&2
  exit 1
fi

stamp="$(date '+%Y-%m-%d %H:%M %Z')"

if [[ -z "${SLACK_BOT_TOKEN:-}" || -z "${SLACK_CHANNEL_ID:-}" ]]; then
  printf "\n---\n## %s (fallback — Slack not configured)\n%s\n" "$stamp" "$msg" >> "$FALLBACK"
  echo "[slack fallback] appended to NOTIFICATIONS.md"
  echo "$msg"
  exit 0
fi

payload="$(python3 -c "
import json, sys
print(json.dumps({'channel': sys.argv[1], 'text': sys.argv[2]}))
" "$SLACK_CHANNEL_ID" "$msg")"

response="$(curl -fsS \
  -H "Authorization: Bearer $SLACK_BOT_TOKEN" \
  -H "Content-Type: application/json; charset=utf-8" \
  -X POST \
  -d "$payload" \
  "https://slack.com/api/chat.postMessage")"

ok="$(python3 -c "import json,sys; d=json.loads(sys.stdin.read()); print(d.get('ok')); print(d.get('error',''))" <<< "$response")"
ok_flag="$(echo "$ok" | sed -n '1p')"
err="$(echo "$ok" | sed -n '2p')"

if [[ "$ok_flag" != "True" ]]; then
  echo "[slack error] $err" >&2
  echo "$response" >&2
  exit 1
fi

echo "[slack ok]"
