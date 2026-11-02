---
name: issue
description: Create, view, list, close, or comment on GitLab issues using the glab CLI. Use when the user wants to manage GitLab issues from the terminal.
user-invocable: true
disable-model-invocation: true
argument-hint: "[create|view|list|close|note|update|reopen] [options]"
model: haiku
effort: low
---

## Task

Manage GitLab issues via `glab`.

## Steps

### 1. Determine the action

Parse `$ARGUMENTS` for the action and any known details (issue number, title, project, etc.). If unclear, ask the user.

---

### 2. Execute

#### Create an issue

```bash
glab issue create --title "<title>" --description "<body>"
```

Useful flags:
- `--label "<label>"` — add a label
- `--assignee "<username>"` — assign immediately
- `--milestone "<title>"` — link to a milestone
- `--confidential` — mark as confidential
- `--description-file <file>` — read the description from a file (`-` for stdin); prefer this over `--description` for long or multi-line bodies
- `--attach <file>` — upload a file and reference it at the end of the description (experimental, repeatable)
- `--yes` — skip the confirmation prompt (needed for non-interactive use)
- `--web` — continue issue creation in the browser
- `--template <name-or-path>` — use a repository issue template or a template file

#### List issues

```bash
glab issue list
```

Lists open issues by default. Filters:
- `--closed`, `--all` — change which states are listed
- `--assignee "<username>"` — use `--assignee=@me` for issues assigned to the current user
- `--assignee=@none`, `--assignee=@any` — filter unassigned or assigned issues
- `--author "<username>"`
- `--label "<label>"`
- `--milestone "<title>"`
- `--search "<text>"`
- `--created-after`, `--created-before`, `--updated-after`, `--updated-before` — filter by RFC 3339 timestamp, such as `2026-10-01T00:00:00Z`

#### View an issue

```bash
glab issue view <number>
glab issue view <number> --web   # open in browser
```

#### Add a comment (note)

```bash
glab issue note <number> --message "<comment text>"
glab issue note <number> --internal --message "<project-member comment>"
glab issue note <number> --message "<comment text>" --attach ./screenshot.png   # experimental
```

#### Update an issue

```bash
glab issue update <number> --title "<new title>" --description "<new body>"
```

Other flags: `--description-file`, `--attach`, `--assignee`, `--label`, `--unlabel`, `--milestone`, `--confidential`.

Track time with `glab issue update <number> --estimate 2d --spend 1h30m`. `--remove-estimate` clears the estimate; `--remove-time-spent` clears all recorded time. `glab issue view` shows time tracking statistics.

#### Close an issue

```bash
glab issue close <number>
```

#### Reopen a closed issue

```bash
glab issue reopen <number>
```

---

### 3. Output

Show the command output. For `create`, print the issue URL. For `list`, summarize results and highlight open/unassigned items.

---

For a complete list of subcommands and flags, see [docs/reference.md](../../docs/reference.md#glab-issue).
