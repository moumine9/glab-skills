---
name: mr
description: Create, view, list, merge, approve, diff, checkout, or comment on GitLab merge requests using the glab CLI. Use when the user wants to work with MRs from the terminal.
user-invocable: true
disable-model-invocation: true
argument-hint: "[create|view|list|merge|approve|diff|checkout|close|update|note] [options]"
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
- `--description-file <file>` — read the description from a file (`-` for stdin); prefer this over `--description` for long or multi-line bodies
- `--attach <file>` — upload a file and reference it at the end of the description (experimental, repeatable)
- `--yes` — skip the confirmation prompt (needed for non-interactive use)
- `--no-editor` — do not open an editor for the description
- `--web` — continue MR creation in the browser

#### List MRs

```bash
glab mr list
```

Lists open MRs by default. Filters:
- `--closed`, `--merged`, `--all` — change which states are listed
- `--assignee "<username>"` — use `--assignee=@me` for MRs assigned to the current user
- `--reviewer "<username>"` — use `--reviewer=@me` for MRs awaiting the current user's review
- `--author "<username>"`
- `--label "<label>"`
- `--draft`, `--not-draft`

#### View an MR

```bash
glab mr view <number>
glab mr view <number> --web        # open in browser
glab mr view <number> --comments   # include comments and activities
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
- `--auto-merge` — merge once all merge checks pass (on by default; pass `--auto-merge=false` to merge immediately)
- `--yes` — skip the confirmation prompt

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

Other update flags: `--description-file`, `--attach`, `--draft`, `--ready`, `--assignee`, `--reviewer`, `--label`, `--unlabel`, `--target-branch`.

#### Comment on an MR

```bash
glab mr note create <number> --message "<comment text>"
glab mr note list <number> --state unresolved
glab mr note resolve <number> <discussion-id>
```

`glab mr note create` flags:
- `--reply <discussion-id>` — reply to an existing thread (IDs come from `glab mr note list`)
- `--file <path> --line <n>` — comment on a line of the diff (`--old-line` for a removed line)
- `--internal` — internal note, visible only to project members
- `--resolvable=false` — non-blocking note, for status updates
- `--attach <file>` — upload a file and reference it in the comment (experimental)

#### Review an MR with pending comments

Queue comments with `--draft`; they stay visible only to you until published:

```bash
glab mr note create <number> --draft --file <path> --line <n> --message "<comment text>"
glab mr note publish <number> --yes --message "<summary>" --reviewer-state requested_changes
```

`--reviewer-state` accepts `requested_changes` or `reviewed`. It does not approve; use `glab mr approve` for that. `--yes` is required when not running interactively.

---

### 3. Output

Show the command output. For `create`, print the MR URL. For `list`, summarize the count and show the most relevant items.

---

For a complete list of subcommands and flags, see [docs/reference.md](../../docs/reference.md#glab-mr).
