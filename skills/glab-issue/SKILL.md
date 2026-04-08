---
name: glab-issue
description: Create, view, list, close, or comment on GitLab issues using the glab CLI. Use when the user wants to manage GitLab issues from the terminal.
user-invocable: true
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
- `--web` — open in browser after creation

#### List issues

```bash
glab issue list
```

Filters:
- `--state opened|closed|all`
- `--assignee "<username>"`
- `--label "<label>"`
- `--mine` — issues assigned to the current user
- `--milestone "<title>"`

#### View an issue

```bash
glab issue view <number>
glab issue view <number> --web   # open in browser
```

#### Add a comment (note)

```bash
glab issue note <number> --message "<comment text>"
```

#### Update an issue

```bash
glab issue update <number> --title "<new title>" --description "<new body>"
```

Other flags: `--assignee`, `--label`, `--remove-label`, `--milestone`, `--confidential`.

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
