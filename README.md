# claude-glab

Claude Code skills and hooks for working with GitLab via the `glab` CLI.

---

## What's in here

This repo contains Claude Code skills for common GitLab operations (MRs, issues, CI), a PostToolUse hook that detects authentication errors and prompts you to log in, and a `settings.local.json` with pre-approved glab command permissions. Copy the pieces you need into your Claude Code setup.

---

## Prerequisites

- `glab` CLI installed
- Claude Code installed

---

## 1. Install glab

**macOS**
```bash
brew install glab
```

**Windows (winget)**
```bash
winget install GitLab.GLab
```

**Windows (scoop)**
```bash
scoop install glab
```

**Linux (apt)**
```bash
sudo apt install glab
# or via snap
sudo snap install glab
```

**Check install**
```bash
glab --version
```

---

## 2. Authenticate

You must authenticate before any glab command will work.

```bash
glab auth login
```

For self-managed GitLab:
```bash
glab auth login --hostname gitlab.example.com
```

Check status:
```bash
glab auth status
```

The `glab-auth-guard.sh` hook watches for authentication errors in glab output and tells Claude to prompt you to authenticate when it sees one.

---

## 3. Install skills

Copy each skill into `~/.claude/skills/`:

```bash
cp -r skills/glab-auth ~/.claude/skills/
cp -r skills/glab-mr ~/.claude/skills/
cp -r skills/glab-issue ~/.claude/skills/
cp -r skills/glab-ci ~/.claude/skills/
```

Then invoke them in Claude Code:

- `/glab-auth`
- `/glab-mr`
- `/glab-issue`
- `/glab-ci`

---

## 4. Install the auth guard hook

Copy the hook and make it executable:

```bash
cp hooks/glab-auth-guard.sh ~/.claude/hooks/
chmod +x ~/.claude/hooks/glab-auth-guard.sh
```

Then add the following to `~/.claude/settings.json` under `hooks.PostToolUse`:

```json
{
  "matcher": "Bash",
  "hooks": [{
    "type": "command",
    "command": "bash \"${CLAUDE_CONFIG_DIR:-$HOME/.claude}/hooks/glab-auth-guard.sh\""
  }]
}
```

---

## 5. Project-level permissions

Copy `.claude/settings.local.json` into your project's `.claude/` folder so Claude can run glab commands without approval prompts on each call:

```bash
cp .claude/settings.local.json <your-project>/.claude/settings.local.json
```

---

## Skills

| Skill | Trigger | Description |
|-------|---------|-------------|
| glab-auth | `/glab-auth` | Login, logout, or check auth status |
| glab-mr | `/glab-mr` | Create, view, list, merge, approve, diff, checkout MRs |
| glab-issue | `/glab-issue` | Create, view, list, close, comment on issues |
| glab-ci | `/glab-ci` | View pipeline status, trace job logs, retry failed jobs |

---

## Hooks

| Hook | Trigger | What it does |
|------|---------|--------------|
| glab-auth-guard.sh | PostToolUse (Bash) | Detects auth errors in glab output and tells Claude to suggest authentication |

---

## Settings

`.claude/settings.local.json` contains pre-approved permissions for all glab subcommands (`auth`, `mr`, `issue`, `ci`, `repo`, `config`) and common git operations (`log`, `diff`, `push`, `status`, `branch`, `checkout`, `fetch`). It also includes environment context telling Claude to use glab for all GitLab operations and to authenticate first.
