# glab

Claude Code skills and hooks for working with GitLab via the `glab` CLI.

## What's in here

This repo has four skills covering common GitLab operations: auth, merge requests, issues, and CI pipelines. It also includes `glab-auth-guard.sh`, a PostToolUse hook that detects authentication errors in glab output and prompts you to log in, and a `settings.local.json` with pre-approved glab command permissions so Claude does not ask for confirmation on every call. **179 commands** are documented across `docs/commands.md` and `docs/reference.md`.

## Requirements

- `glab` CLI installed
- Claude Code installed

---

## Install glab

macOS:
```bash
brew install glab
```

Windows (winget):
```bash
winget install GitLab.GLab
```

Windows (scoop):
```bash
scoop install glab
```

Linux (apt):
```bash
sudo apt install glab
```

Linux (snap):
```bash
sudo snap install glab
```

Verify the install:
```bash
glab --version
```

## Authenticate

You must authenticate before any glab command will work.

```bash
glab auth login
```

For a self-managed GitLab instance:
```bash
glab auth login --hostname gitlab.example.com
```

Check your current auth status:
```bash
glab auth status
```

The `glab-auth-guard.sh` hook runs after every Bash tool call. When it detects an authentication error in glab output, it tells Claude to prompt you to run `glab auth login`.

---

## Plugin install (recommended)

Run these three commands inside any Claude Code session:

```
/plugin marketplace add moumine9/glab
/plugin install glab
/reload-plugins
```

Choose a scope when prompted:
- **User** — available in all your projects (recommended)
- **Project** — installs into `.claude/plugins/` for the whole team
- **Local** — project-scoped but only for you

Skills are available as:

- `/glab:auth`
- `/glab:mr`
- `/glab:issue`
- `/glab:ci`

The auth guard hook activates automatically once the plugin is installed.

> **Note:** The official Anthropic marketplace includes a `gitlab` plugin that connects via MCP. This plugin is different: it wraps the `glab` CLI using skills, which load progressively and use far less context than MCP tool definitions loaded at session start.

## Test locally before installing

```bash
claude --plugin-dir ./
```

This loads the plugin from the current directory without installing it. Use `/reload-plugins` to pick up changes without restarting.

## Manual install

### Skills

Copy each skill directory into `~/.claude/skills/`:

```bash
cp -r skills/auth ~/.claude/skills/
cp -r skills/mr ~/.claude/skills/
cp -r skills/issue ~/.claude/skills/
cp -r skills/ci ~/.claude/skills/
```

Standalone triggers (without the plugin namespace):

- `/auth`
- `/mr`
- `/issue`
- `/ci`

### Auth guard hook

Copy the hook and make it executable:

```bash
cp hooks/glab-auth-guard.sh ~/.claude/hooks/
chmod +x ~/.claude/hooks/glab-auth-guard.sh
```

Add the following entry to `~/.claude/settings.json` under `hooks.PostToolUse`:

```json
{
  "matcher": "Bash",
  "hooks": [
    {
      "type": "command",
      "command": "bash \"${CLAUDE_CONFIG_DIR:-$HOME/.claude}/hooks/glab-auth-guard.sh\""
    }
  ]
}
```

### Project permissions

Copy `.claude/settings.local.json` into your project's `.claude/` folder:

```bash
cp .claude/settings.local.json <your-project>/.claude/settings.local.json
```

---

## Reference

- [docs/commands.md](docs/commands.md) — all available commands at a glance
- [docs/reference.md](docs/reference.md) — full reference with flags and examples

### Skills

| Skill | Plugin trigger | Standalone trigger | Description | Auto-invoked |
|-------|---------------|--------------------|-------------|-------------|
| auth | `/glab:auth` | `/auth` | Auth flows, Docker credentials, tokens, and key management | No |
| mr | `/glab:mr` | `/mr` | Full MR lifecycle: create, review, merge, and stacked diffs | No |
| issue | `/glab:issue` | `/issue` | Create, manage, board view, and track issues | No |
| ci | `/glab:ci` | `/ci` | Pipelines, jobs, schedules, runners, and CI variables | No |

Skills with `disable-model-invocation: true` require explicit invocation. Claude will not trigger them automatically.

### Hooks

| Hook | Trigger | What it does |
|------|---------|--------------|
| glab-auth-guard.sh | PostToolUse + PostToolUseFailure (Bash) | Detects auth errors in glab output and tells Claude to prompt for authentication |

The hook uses an `if: "Bash(glab *)"` condition so it only spawns when a `glab` command is involved, not on every Bash call.

### Settings

`.claude/settings.local.json` contains pre-approved permissions for all glab subcommands (`auth`, `mr`, `issue`, `ci`, `repo`, `config`) and common git operations, so Claude can run them without asking for confirmation each time.
