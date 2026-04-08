---
name: glab-mr
description: Create, view, list, merge, approve, diff, or checkout GitLab merge requests using the glab CLI. Use when the user wants to work with MRs from the terminal.
user-invocable: true
disable-model-invocation: true
argument-hint: "[create|view|list|merge|approve|diff|checkout|close|update] [options]"
model: haiku
effort: low
---

## Task

Manage GitLab merge requests via `glab`.

## Steps

### 1. Determine the action

Parse `$ARGUMENTS` for the action and any relevant details (branch, MR number, etc.). If the action is unclear, ask the user.

---

### 2. Execute

#### Create an MR

```bash
glab mr create --title "<title>" --description "<body>" --target-branch <branch>
```

Useful flags:
- `--fill` — pre-fill title and description from the last commit
- `--draft` — mark as draft
- `--label "<label>"` — add a label
- `--assignee "<username>"` — assign to someone
- `--reviewer "<username>"` — request a review
- `--no-editor` — skip opening an editor (required for non-interactive use)
- `--web` — open the MR in the browser after creation

#### List MRs

```bash
glab mr list
```

Filters:
- `--state opened|closed|merged|all`
- `--assignee "<username>"`
- `--reviewer "<username>"`
- `--label "<label>"`
- `--mine` — MRs assigned to the current user

#### View an MR

```bash
glab mr view <number>
glab mr view <number> --web   # open in browser
```

#### Approve an MR

```bash
glab mr approve <number>
```

#### Merge an MR

```bash
glab mr merge <number>
```

Flags:
- `--squash` — squash commits on merge
- `--remove-source-branch` — delete the branch after merge
- `--when-pipeline-succeeds` — wait for CI to pass before merging

#### Checkout an MR branch locally

```bash
glab mr checkout <number>
```

#### View the diff

```bash
glab mr diff <number>
```

#### Close an MR

```bash
glab mr close <number>
```

#### Update an MR

```bash
glab mr update <number> --title "<new title>" --description "<new body>"
```

Other update flags: `--draft`, `--ready`, `--assignee`, `--reviewer`, `--label`, `--remove-label`, `--target-branch`.

---

### 3. Output

Show the command output. For `create`, print the MR URL. For `list`, summarize the count and show the most relevant items.
