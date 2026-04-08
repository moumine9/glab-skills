#!/usr/bin/env bash
# =============================================================================
# glab-auth-guard.sh
# PostToolUse hook — detects GitLab authentication errors in glab output
# =============================================================================
#
# Fires after every Bash tool call. Reads the tool output from stdin as JSON,
# checks the `.output` field for known glab auth failure patterns, and injects
# additionalContext telling Claude to suggest authentication.
#
# Auth patterns checked (case-insensitive):
#   - "You are not logged in"
#   - "401"
#   - "failed to authenticate"
#   - "authentication required"
#   - "run glab auth login"
#   - "no GitLab token"
#   - "could not authenticate"
#
# Returns:
#   additionalContext JSON  — if an auth error is found
#   {}                      — if no auth error
# =============================================================================

INPUT=$(cat)

OUTPUT=$(echo "$INPUT" | jq -r '.output // ""' 2>/dev/null)

if [[ -z "$OUTPUT" ]]; then
  echo "{}"
  exit 0
fi

AUTH_ERROR=false

if echo "$OUTPUT" | grep -qiE \
  'you are not logged in|401|failed to authenticate|authentication required|run glab auth login|no gitlab token|could not authenticate'; then
  AUTH_ERROR=true
fi

if [[ "$AUTH_ERROR" == "true" ]]; then
  cat <<'EOF'
{
  "additionalContext": "The last glab command failed with an authentication error. Ask the user if they want to authenticate now, then run the glab-auth skill (or suggest: glab auth login)."
}
EOF
  exit 0
fi

echo "{}"
exit 0
