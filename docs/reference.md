# glab CLI reference

`glab` is an open source GitLab CLI. Works with GitLab.com, GitLab Dedicated, and self-managed instances.

Global repo flag: `-R / --repo` accepts `OWNER/REPO`, `GROUP/NAMESPACE/REPO`, full URL, or Git URL.

---

## Contents

- [Core workflows](#core-workflows)
  - [glab mr](#glab-mr)
  - [glab issue](#glab-issue)
  - [glab ci](#glab-ci)
  - [glab job](#glab-job)
  - [glab release](#glab-release)
  - [glab repo](#glab-repo)
- [Project management](#project-management)
  - [glab incident](#glab-incident)
  - [glab iteration](#glab-iteration)
  - [glab label](#glab-label)
  - [glab milestone](#glab-milestone)
  - [glab schedule](#glab-schedule)
  - [glab snippet](#glab-snippet)
  - [glab variable](#glab-variable)
  - [glab work-items](#glab-work-items-experimental)
  - [glab container-registry](#glab-container-registry)
  - [glab packages](#glab-packages)
  - [glab artifact-registry](#glab-artifact-registry-experimental)
- [CI/CD infrastructure](#cicd-infrastructure)
  - [glab runner](#glab-runner)
  - [glab runner-controller](#glab-runner-controller-experimental)
  - [glab securefile](#glab-securefile)
  - [glab opentofu](#glab-opentofu)
  - [glab cluster](#glab-cluster)
  - [glab dependency-firewall](#glab-dependency-firewall-experimental)
- [Account management](#account-management)
  - [glab auth](#glab-auth)
  - [glab config](#glab-config)
  - [glab token](#glab-token)
  - [glab ssh-key](#glab-ssh-key)
  - [glab gpg-key](#glab-gpg-key)
  - [glab deploy-key](#glab-deploy-key)
  - [glab user](#glab-user)
- [Utilities](#utilities)
  - [glab alias](#glab-alias)
  - [glab api](#glab-api)
  - [glab changelog](#glab-changelog)
  - [glab duo](#glab-duo)
  - [glab orbit](#glab-orbit-experimental)
  - [glab govern](#glab-govern-experimental)
  - [glab search](#glab-search-beta)
  - [glab security](#glab-security-experimental)
  - [glab skills](#glab-skills-experimental)
  - [glab todo](#glab-todo)
  - [glab mcp](#glab-mcp-experimental)
  - [glab stack](#glab-stack-experimental)
  - [glab attestation](#glab-attestation-experimental)
  - [glab completion](#glab-completion)
  - [glab check-update](#glab-check-update)
  - [glab version](#glab-version)
  - [glab whatsnew](#glab-whatsnew)

---

## Core workflows

---

## glab mr

Create, view, and manage merge requests.

| Subcommand | Usage | Description |
|---|---|---|
| `approve` | `glab mr approve {<id> \| <branch>}` | Approve one or more MRs. |
| `approvers` | `glab mr approvers [<id> \| <branch>]` | List eligible approvers for an MR. |
| `checkout` | `glab mr checkout [<id> \| <branch> \| <url>]` | Check out an open MR locally. |
| `close` | `glab mr close [<id> \| <branch>]` | Close an MR. |
| `create` | `glab mr create` | Create a new MR. |
| `delete` | `glab mr delete [<id> \| <branch>]` | Delete an MR. |
| `diff` | `glab mr diff [<id> \| <branch>]` | Show diff of an MR. |
| `for` | `glab mr for` | Create an MR for an issue. (deprecated: use `mr create --related-issue`) |
| `issues` | `glab mr issues [<id> \| <branch>]` | List issues related to an MR. |
| `list` | `glab mr list` | List MRs. |
| `merge` | `glab mr merge {<id> \| <branch>}` | Merge (accept) an MR. |
| `note` | `glab mr note <command> [<id> \| <branch>]` | Create, list, update, delete, resolve, and publish comments (has subcommands). |
| `rebase` | `glab mr rebase [<id> \| <branch>]` | Rebase source branch against target. |
| `reopen` | `glab mr reopen [<id>... \| <branch>...]` | Reopen a closed MR. |
| `revoke` | `glab mr revoke [<id> \| <branch>]` | Revoke your approval. |
| `subscribe` | `glab mr subscribe [<id> \| <branch>]` | Subscribe to MR notifications. |
| `todo` | `glab mr todo [<id> \| <branch>]` | Add MR to your to-do list. |
| `unsubscribe` | `glab mr unsubscribe [<id> \| <branch>]` | Unsubscribe from MR notifications. |
| `update` | `glab mr update [<id> \| <branch>]` | Update MR fields. |
| `view` | `glab mr view {<id> \| <branch>}` | Display MR details. |

### glab mr create flags

| Flag | Short | Description |
|---|---|---|
| `--title` | `-t` | MR title. |
| `--description` | `-d` | Description. Set to `-` to open editor. |
| `--description-file` | | Read the description from a file (`-` for stdin). |
| `--attach` | | Upload a file and reference it at the end of the description (`-` for stdin, repeatable). (EXPERIMENTAL) |
| `--assignee` | `-a` | Assign by username (comma-separated or repeat flag). |
| `--reviewer` | | Request review from usernames. |
| `--label` | `-l` | Add labels. |
| `--milestone` | `-m` | Assign milestone by ID or title. |
| `--source-branch` | `-s` | Source branch (default: current branch). |
| `--target-branch` | `-b` | Target branch. |
| `--draft` | | Mark as draft. |
| `--fill` | `-f` | Use commit info for title/description; also pushes branch. |
| `--fill-commit-body` | | Fill description with commit bodies (use with `--fill`). |
| `--push` | | Push committed changes after creating MR. |
| `--squash-before-merge` | | Squash commits on merge. |
| `--remove-source-branch` | | Remove source branch on merge. |
| `--allow-collaboration` | | Allow commits from other members. |
| `--related-issue` | `-i` | Create MR for an issue (uses issue title if `--title` not set). |
| `--web` | `-w` | Continue creation in browser. |
| `--yes` | `-y` | Skip confirmation prompt. |
| `--recover` | | Save/restore options from file if creation fails. (EXPERIMENTAL) |

### glab mr list flags

| Flag | Short | Description |
|---|---|---|
| `--all` | `-A` | Get all MRs. |
| `--assignee` | `-a` | Filter by assignee. Use `@me` for yourself. |
| `--reviewer` | `-r` | Filter by reviewer. |
| `--author` | | Filter by author. |
| `--label` | `-l` | Filter by label. |
| `--milestone` | `-m` | Filter by milestone. |
| `--source-branch` | `-s` | Filter by source branch. |
| `--target-branch` | `-t` | Filter by target branch. |
| `--draft` | `-d` | Show only drafts. |
| `--not-draft` | | Exclude drafts. |
| `--merged` | `-M` | Show only merged. |
| `--closed` | `-c` | Show only closed. |
| `--search` | | Filter by string in title/description. |
| `--order` | `-o` | Order by field (created_at, updated_at, merged_at, title, priority, etc.). |
| `--output` | `-F` | Format: `text`, `json`. |
| `--group` | `-g` | List MRs in a group. |

### glab mr merge flags

| Flag | Short | Description |
|---|---|---|
| `--squash` | `-s` | Squash commits on merge. |
| `--rebase` | `-r` | Rebase commits onto base branch. |
| `--remove-source-branch` | `-d` | Remove source branch after merge. |
| `--message` | `-m` | Custom merge commit message. |
| `--squash-message` | | Custom squash commit message. |
| `--auto-merge` | | Enable auto-merge (default: true). |
| `--sha` | | Merge only if HEAD matches this SHA. |
| `--yes` | `-y` | Skip confirmation. |

### glab mr update flags

| Flag | Short | Description |
|---|---|---|
| `--draft` | | Mark as draft. |
| `--ready` | `-r` | Mark as ready for review. |
| `--title` | `-t` | New title. |
| `--description` | `-d` | New description. Set to `-` to open editor. |
| `--description-file` | | Read the description from a file (`-` for stdin). |
| `--attach` | | Upload a file and reference it at the end of the description (`-` for stdin, repeatable). (EXPERIMENTAL) |
| `--assignee` | `-a` | Update assignees (prefix `+` to add, `!`/`-` to remove). |
| `--reviewer` | | Update reviewers (same prefix rules). |
| `--label` | `-l` | Add labels. |
| `--unlabel` | `-u` | Remove labels. |
| `--milestone` | `-m` | Set milestone (set to `""` or `0` to unassign). |
| `--target-branch` | | Change target branch. |
| `--fill` | `-f` | Use commit info for title/description. |
| `--yes` | `-y` | Skip confirmation. |

### glab mr view flags

| Flag | Short | Description |
|---|---|---|
| `--comments` | `-c` | Show comments and activities. |
| `--resolved` | | Show only resolved discussions. |
| `--unresolved` | | Show only unresolved discussions. |
| `--system-logs` | `-s` | Show system activity logs. |
| `--output` | `-F` | Format: `text`, `json`. |
| `--web` | `-w` | Open in browser. |

### glab mr checkout flags

| Flag | Short | Description |
|---|---|---|
| `--branch` | `-b` | Local branch name to use. |
| `--set-upstream-to` | `-u` | Set tracking to `[REMOTE/]BRANCH`. |

### glab mr note subcommands (EXPERIMENTAL)

| Subcommand | Usage | Description |
|---|---|---|
| `create` | `glab mr note create [<id> \| <branch>]` | Create a comment or discussion. |
| `delete` | `glab mr note delete [<id> \| <branch>] <note-id>` | Delete a note. `-y/--yes` skips confirmation. |
| `list` | `glab mr note list [<id> \| <branch>]` | List discussions. |
| `publish` | `glab mr note publish [<id> \| <branch>]` | Publish all your pending review comments (created with `--draft`). |
| `reopen` | `glab mr note reopen [<id> \| <branch>] <discussion-id>` | Reopen a discussion. |
| `resolve` | `glab mr note resolve [<id> \| <branch>] <discussion-id>` | Resolve a discussion. Accepts a discussion ID, an 8+ character prefix, or a note ID. |
| `update` | `glab mr note update [<id> \| <branch>] <note-id>` | Update the body of a note (`-m/--message`, `--attach`). |

When both are given, the MR ID comes first (`glab mr note resolve 123 abc12345`); omit it to use the current branch's MR.

### glab mr note create flags

| Flag | Short | Description |
|---|---|---|
| `--message` | `-m` | Comment text. If omitted, opens an editor or reads stdin. |
| `--draft` | | Add the comment to a pending review instead of publishing it. Publish with `glab mr note publish`. |
| `--internal` | | Create an internal note, visible only to project members. |
| `--reply` | | Reply to an existing discussion (full discussion ID or a unique prefix of at least 8 characters). |
| `--file` | | File path for a diff comment on the latest MR diff version. |
| `--line` | | Line in the new version: a number (`42`) or a range (`10:15`). Requires `--file`. |
| `--old-line` | | Line in the old version, for a removed line. Requires `--file`. |
| `--resolvable` | | Create a resolvable thread (default: `true`). Set to `false` for bot or status notes. |
| `--unique` | | Do not create if identical comment already exists. |
| `--attach` | | Upload a file and reference it at the end of the comment (`-` for stdin, repeatable). (EXPERIMENTAL) |

Flag rules: `--file`, `--reply`, and `--unique` are mutually exclusive. `--draft` cannot be combined with `--unique` or `--resolvable=false`. `--internal` cannot be combined with `--draft` or `--file`. `--attach` cannot be combined with `--unique`.

### glab mr note publish flags

| Flag | Short | Description |
|---|---|---|
| `--message` | `-m` | Summary note to add to the MR when publishing. |
| `--internal` | | Mark the summary note as internal. Requires `--message`. |
| `--reviewer-state` | | Set your review state: `requested_changes` or `reviewed`. Does not record an approval. |
| `--yes` | `-y` | Skip confirmation. Required when not running interactively. |

### glab mr note list flags

| Flag | Short | Description |
|---|---|---|
| `--type` | `-t` | Note type: `all`, `general`, `diff`, `system` (default: `all`). |
| `--state` | | Resolution state: `all`, `resolved`, `unresolved` (default: `all`). |
| `--file` | | Show only diff notes on this file path. |
| `--output` | `-F` | Format: `text`, `json`. |
| `--jq` | | Filter JSON output with a jq expression. |

Examples:
```sh
glab mr note create 123 -m "LGTM"
glab mr note create 123 --draft --file main.go --line 42 -m "Off-by-one?"
glab mr note publish 123 -m "A few blockers, see the comments." --reviewer-state requested_changes
glab mr note list 123 --state unresolved
```

### glab mr rebase flags

| Flag | Description |
|---|---|
| `--skip-ci` | Rebase while skipping CI. |

### glab mr diff flags

| Flag | Description |
|---|---|
| `--color` | Color mode: `always`, `never`, `auto`. |
| `--raw` | Raw diff format for piping. |

---

## glab issue

Work with GitLab issues.

| Subcommand | Usage | Description |
|---|---|---|
| `board` | `glab issue board` | Work with issue boards. |
| `close` | `glab issue close [<id> \| <url>]` | Close an issue. |
| `create` | `glab issue create` | Create an issue. |
| `delete` | `glab issue delete <id>` | Delete an issue. |
| `list` | `glab issue list` | List issues. |
| `note` | `glab issue note <issue-id>` | Comment on an issue. |
| `reopen` | `glab issue reopen [<id> \| <url>]` | Reopen a closed issue. |
| `subscribe` | `glab issue subscribe <id>` | Subscribe to issue notifications. |
| `unsubscribe` | `glab issue unsubscribe <id>` | Unsubscribe from issue notifications. |
| `update` | `glab issue update <id>` | Update issue fields. |
| `view` | `glab issue view <id>` | Display issue details. |

`glab issue board` subcommands:

| Subcommand | Description |
|---|---|
| `create` | Create a project issue board. |
| `view` | View project issue board. |

### glab issue create flags

| Flag | Short | Description |
|---|---|---|
| `--title` | `-t` | Issue title. |
| `--description` | `-d` | Description. Set to `-` to open editor. |
| `--description-file` | | Read the description from a file (`-` for stdin). |
| `--attach` | | Upload a file and reference it at the end of the description (`-` for stdin, repeatable). (EXPERIMENTAL) |
| `--assignee` | `-a` | Assign by username. |
| `--label` | `-l` | Add labels. |
| `--milestone` | `-m` | Assign milestone. |
| `--confidential` | `-c` | Mark as confidential. |
| `--due-date` | | Due date in `YYYY-MM-DD` format. |
| `--epic` | | ID of epic to add issue to. |
| `--weight` | `-w` | Issue weight (>= 0). |
| `--linked-issues` | | IIDs of issues to link to. |
| `--linked-mr` | | IID of MR to resolve all issues. |
| `--link-type` | | Link type (default: `relates_to`). |
| `--time-estimate` | `-e` | Set time estimate. |
| `--time-spent` | `-s` | Set time spent. |
| `--web` | | Continue creation in browser. |
| `--yes` | `-y` | Skip confirmation. |
| `--recover` | | Save/restore options from file if creation fails. (EXPERIMENTAL) |

### glab issue list flags

| Flag | Short | Description |
|---|---|---|
| `--all` | `-A` | Get all issues. |
| `--assignee` | `-a` | Filter by assignee username. Use `@me` for yourself. |
| `--author` | | Filter by author username. |
| `--label` | `-l` | Filter by label. |
| `--milestone` | `-m` | Filter by milestone. |
| `--closed` | `-c` | Show only closed. |
| `--confidential` | `-C` | Filter by confidential. |
| `--issue-type` | `-t` | Filter by type: `issue`, `incident`, `test_case`. |
| `--iteration` | `-i` | Filter by iteration ID. |
| `--epic` | `-e` | Filter by epic (requires `--group`). |
| `--group` | `-g` | Filter in a group/subgroup. |
| `--search` | | Search string in fields from `--in`. |
| `--in` | | Fields to search in (default: `title,description`). |
| `--order` | | Order by: `created_at`, `updated_at`, `priority`, etc. |
| `--sort` | `-s` | Sort direction: `asc` or `desc`. |
| `--output` | `-O` | Format: `text`, `json`. |
| `--output-format` | `-F` | Output details format: `details`, `ids`, `urls`. |

### glab issue update flags

| Flag | Short | Description |
|---|---|---|
| `--title` | `-t` | New title. |
| `--description` | `-d` | New description. Set to `-` to open editor. |
| `--description-file` | | Read the description from a file (`-` for stdin). |
| `--attach` | | Upload a file and reference it at the end of the description (`-` for stdin, repeatable). (EXPERIMENTAL) |
| `--assignee` | `-a` | Update assignees (prefix `+` to add, `!`/`-` to remove). |
| `--label` | `-l` | Add labels. |
| `--unlabel` | `-u` | Remove labels. |
| `--milestone` | `-m` | Set milestone (set to `""` or `0` to unassign). |
| `--confidential` | `-c` | Mark as confidential. |
| `--public` | `-p` | Make issue public. |
| `--weight` | `-w` | Set weight. |
| `--due-date` | | Set due date. |
| `--lock-discussion` | | Lock discussion. |
| `--unlock-discussion` | | Unlock discussion. |
| `--unassign` | | Remove all assignees. |

### glab issue view flags

| Flag | Short | Description |
|---|---|---|
| `--comments` | `-c` | Show comments and activities. |
| `--system-logs` | `-s` | Show system activity logs. |
| `--output` | `-F` | Format: `text`, `json`. |
| `--web` | `-w` | Open in browser. |

### glab issue note flags

| Flag | Short | Description |
|---|---|---|
| `--message` | `-m` | Comment text. |
| `--attach` | | Upload a file and reference it at the end of the comment (`-` for stdin, repeatable). (EXPERIMENTAL) |

`glab incident note` takes the same flags.

---

## glab ci

Work with GitLab CI/CD pipelines and jobs.

| Subcommand | Usage | Description |
|---|---|---|
| `artifact` | `glab ci artifact <refName> <jobName>` | Download artifacts from last pipeline. (deprecated: use `glab job artifact`) |
| `cancel` | `glab ci cancel` | Cancel pipelines or jobs (has subcommands). |
| `cancel job` | `glab ci cancel job <id>` | Cancel one or more CI jobs. |
| `cancel pipeline` | `glab ci cancel pipeline <id>` | Cancel one or more pipelines. |
| `config` | `glab ci config` | Work with CI configuration. |
| `config compile` | `glab ci config compile [file]` | View fully expanded CI configuration. |
| `delete` | `glab ci delete <id>` | Delete pipelines. |
| `get` | `glab ci get` | Get JSON of a pipeline on a branch. |
| `lint` | `glab ci lint [file]` | Validate `.gitlab-ci.yml`. |
| `list` | `glab ci list` | List pipelines. |
| `retry` | `glab ci retry [<job-id>\|<job-name>]` | Retry a CI job. |
| `run` | `glab ci run` | Create or run a new pipeline. |
| `run-trig` | `glab ci run-trig` | Run a pipeline using a trigger token. |
| `status` | `glab ci status` | View pipeline status on current/specified branch. |
| `trace` | `glab ci trace [<job-id>\|<job-name>]` | Stream a job log in real time. |
| `trigger` | `glab ci trigger <job-id>` | Trigger a manual job. |
| `view` | `glab ci view [branch/tag]` | Interactive TUI: view, run, trace, cancel jobs. |

### glab ci run flags

| Flag | Short | Description |
|---|---|---|
| `--branch` | `-b` | Target branch/ref. |
| `--mr` | | Run merge request pipeline instead. |
| `--variables` | | Variables in `key:value` format. |
| `--variables-env` | | Variables in `key:value` format (env_var type). |
| `--variables-file` | | File variables in `key:filename` format. |
| `--variables-from` | `-f` | Load variables from a JSON file. |
| `--input` | `-i` | Pipeline inputs in `key:value` format. Typed: `key:int(3)`, `key:bool(true)`, `key:array(a,b)`. |
| `--web` | `-w` | Open pipeline in browser. |

### glab ci run-trig flags

| Flag | Short | Description |
|---|---|---|
| `--token` | `-t` | Pipeline trigger token (or use `CI_JOB_TOKEN`). |
| `--branch` | `-b` | Target branch/ref. |
| `--variables` | | Variables in `key:value` format. |
| `--input` | `-i` | Pipeline inputs in `key:value` format. |

### glab ci list flags

| Flag | Short | Description |
|---|---|---|
| `--status` | `-s` | Filter by status: `running`, `pending`, `success`, `failed`, `canceled`, `skipped`, `created`, `manual`, etc. |
| `--ref` | `-r` | Filter by ref. |
| `--source` | | Filter by source: `push`, `merge_request_event`, `schedule`, etc. |
| `--scope` | | Filter by scope: `running`, `pending`, `finished`, `branches`, `tags`. |
| `--sha` | | Filter by commit SHA. |
| `--username` | `-u` | Filter by triggering username. |
| `--updated-after` | `-a` | Filter by updated after date (ISO 8601). |
| `--updated-before` | `-b` | Filter by updated before date (ISO 8601). |
| `--yaml-errors` | `-y` | Return only pipelines with invalid config. |
| `--order` | `-o` | Order by: `id`, `status`, `ref`, `updated_at`, `user_id`. |
| `--sort` | | Sort: `asc` or `desc`. |
| `--output` | `-F` | Format: `text`, `json`. |
| `--page` | `-p` | Page number. |
| `--per-page` | `-P` | Items per page. |

### glab ci delete flags

| Flag | Description |
|---|---|
| `--status` | Delete by status. |
| `--source` | Delete by source. |
| `--older-than` | Delete pipelines older than duration (e.g. `24h`). |
| `--dry-run` | Simulate without deleting. |

### glab ci get flags

| Flag | Short | Description |
|---|---|---|
| `--branch` | `-b` | Branch to check (default: current). |
| `--pipeline-id` | `-p` | Specific pipeline ID. |
| `--output` | `-F` | Format: `text`, `json`. |
| `--with-job-details` | `-d` | Include extended job info. |
| `--with-variables` | | Show pipeline variables (requires Maintainer role). |

### glab ci lint flags

| Flag | Description |
|---|---|
| `--dry-run` | Simulate pipeline creation. |
| `--include-jobs` | Include job list in response. |
| `--ref` | Branch/tag context for dry-run validation. |

### glab ci status flags

| Flag | Short | Description |
|---|---|---|
| `--branch` | `-b` | Branch to check. |
| `--compact` | `-c` | Compact output. |
| `--live` | `-l` | Live update until pipeline ends. |

### glab ci view flags

| Flag | Short | Description |
|---|---|---|
| `--branch` | `-b` | Branch or tag to check. |
| `--pipelineid` | `-p` | Specific pipeline ID. |
| `--web` | `-w` | Open in browser. |

Interactive TUI keybindings:
- `Enter`: Toggle job log or enter child pipeline.
- `Esc`/`q`: Close logs or return to parent pipeline.
- `Ctrl+R`/`Ctrl+P`: Run, retry, or play a job.
- `Ctrl+D`: Cancel the selected job (or quit if not running/pending).
- `Ctrl+Q`: Quit the view.
- `Ctrl+Space`: Suspend app and view logs (like `glab ci trace`).

### glab ci trace / retry / trigger flags

| Flag | Short | Description |
|---|---|---|
| `--branch` | `-b` | Branch to search for the job. |
| `--pipeline-id` | `-p` | Pipeline ID to search within. |

---

## glab job

Work with individual CI/CD jobs. Distinct from `glab ci`.

| Subcommand | Usage | Description |
|---|---|---|
| `artifact` | `glab job artifact <refName> <jobName>` | Download all artifacts from the most recent successful pipeline for a ref. |

### glab job artifact flags

| Flag | Short | Description |
|---|---|---|
| `--path` | `-p` | Local path to download artifacts to (default: `./`). |
| `--list-paths` | `-l` | Print paths of downloaded artifacts. |

Note: `glab ci artifact` is deprecated in favor of `glab job artifact`. The `glab job artifact` version also supports `refs/merge-requests/<iid>/head` as a ref.

---

## glab release

Manage GitLab releases.

| Subcommand | Usage | Description |
|---|---|---|
| `create` | `glab release create <tag> [<files>...]` | Create or update a release. |
| `delete` | `glab release delete <tag>` | Delete a release. |
| `download` | `glab release download <tag>` | Download release assets. |
| `list` | `glab release list` | List releases in a repository. |
| `upload` | `glab release upload <tag> [<files>...]` | Upload asset files or links to a release. |
| `view` | `glab release view <tag>` | View release details. |

### glab release create flags

| Flag | Short | Description |
|---|---|---|
| `--name` | `-n` | Release name/title. |
| `--notes` | `-N` | Release notes (Markdown accepted). |
| `--notes-file` | `-F` | Read release notes from file (use `-` for stdin). |
| `--ref` | `-r` | Create release from this ref if tag does not exist (commit SHA, tag, or branch). |
| `--tag-message` | `-T` | Message for new annotated tag. |
| `--milestone` | `-m` | Associate milestone(s) by title. |
| `--released-at` | `-D` | ISO 8601 datetime when release was ready. |
| `--assets-links` | `-a` | JSON array of asset links. |
| `--use-package-registry` | | Upload assets to the generic package registry. |
| `--package-name` | | Package name for registry uploads (default: `release-assets`). |
| `--no-close-milestone` | | Do not close milestones after creating. |
| `--no-update` | | Fail if release already exists (do not update). |
| `--publish-to-catalog` | | Publish release to GitLab CI/CD catalog. (EXPERIMENTAL) |

Asset file syntax: `path/to/file#Display Label#type` where type is `package`, `image`, `runbook`, or `other`.

### glab release delete flags

| Flag | Short | Description |
|---|---|---|
| `--with-tag` | `-t` | Also delete the associated Git tag. |
| `--yes` | `-y` | Skip confirmation. |

### glab release download flags

| Flag | Short | Description |
|---|---|---|
| `--asset-name` | `-n` | Download only assets matching name or glob pattern. |
| `--dir` | `-D` | Destination directory (default: `.`). |

### glab release upload flags

| Flag | Short | Description |
|---|---|---|
| `--assets-links` | `-a` | JSON string of asset links. |
| `--use-package-registry` | | Upload to generic package registry. |
| `--package-name` | | Package name for registry uploads. |

### glab release view flags

| Flag | Short | Description |
|---|---|---|
| `--web` | `-w` | Open release in browser. |

---

## glab repo

Work with GitLab repositories and projects.

| Subcommand | Usage | Description |
|---|---|---|
| `archive` | `glab repo archive [<repo>]` | Download an archive of the repository. |
| `clone` | `glab repo clone [<repo> \| -g <group>] [<dir>]` | Clone a repository. |
| `contributors` | `glab repo contributors` | List repository contributors. |
| `create` | `glab repo create [path]` | Create a new project. |
| `delete` | `glab repo delete <NAME>` | Permanently delete a project. |
| `fork` | `glab repo fork <repo>` | Fork a repository. |
| `list` | `glab repo list` | List repositories. |
| `members add` | `glab repo members add` | Add a member to the project. |
| `members remove` | `glab repo members remove` | Remove a member from the project. |
| `mirror` | `glab repo mirror [ID \| URL \| PATH]` | Configure pull or push mirroring. |
| `prune` | `glab repo prune` | Delete local Git branches whose MR has been merged. |
| `publish catalog` | `glab repo publish catalog <tag-name>` | Publish CI/CD components to catalog. (EXPERIMENTAL) |
| `remote add` | `glab repo remote add <namespace/project>` | Add a Git remote for a GitLab project. |
| `search` | `glab repo search` | Search repositories by name. |
| `transfer` | `glab repo transfer [repo]` | Transfer repository to a new namespace. |
| `update` | `glab repo update [path]` | Update project settings. |
| `view` | `glab repo view [repository]` | View project description and README. |

### glab repo clone flags

| Flag | Short | Description |
|---|---|---|
| `--group` | `-g` | Clone all repos in a group. |
| `--preserve-namespace` | `-p` | Clone into namespace-based subdirectory. |
| `--archived` | `-a` | Include/exclude archived repos (use `-a=false` to exclude). |
| `--active` | | Limit by active status. |
| `--include-subgroups` | `-G` | Include subgroup projects (default: true). |
| `--mine` | `-m` | Limit to repos owned by current user. |
| `--visibility` | `-v` | Limit by visibility: `public`, `internal`, `private`. |
| `--with-issues-enabled` | `-I` | Limit to repos with issues enabled. |
| `--with-mr-enabled` | `-M` | Limit to repos with MRs enabled. |
| `--with-shared` | `-S` | Include shared projects (default: true). |
| `--paginate` | | Fetch all pages before cloning. |

Extra Git flags: append `-- <gitflags>` to pass flags directly to `git clone`. Example: `glab repo clone repo -- --depth 1 --branch main`.

### glab repo create flags

| Flag | Short | Description |
|---|---|---|
| `--name` | `-n` | Project name. |
| `--description` | `-d` | Description. Set to `-` to open editor. |
| `--group` | `-g` | Namespace or group path. |
| `--defaultBranch` | | Default branch name. |
| `--public` | `-P` | Public visibility. |
| `--private` | `-p` | Private visibility. |
| `--internal` | | Internal visibility (default). |
| `--readme` | | Initialize with README. |
| `--tag` | `-t` | Tags for the project. |
| `--remoteName` | | Remote name to set up (default: `origin`). |
| `--skipGitInit` | `-s` | Skip running `git init`. |

### glab repo fork flags

| Flag | Short | Description |
|---|---|---|
| `--clone` | `-c` | Clone the fork after forking. |
| `--remote` | | Add a remote for the fork. |
| `--name` | `-n` | Name for the new fork. |
| `--path` | `-p` | Path for the new fork. |

### glab repo archive flags

| Flag | Short | Description |
|---|---|---|
| `--format` | `-f` | Archive format: `tar.gz`, `tar.bz2`, `zip`, etc. (default: `zip`). |
| `--sha` | `-s` | Commit SHA, tag, or branch to archive. |

### glab repo mirror flags

| Flag | Description |
|---|---|
| `--url` | Target URL to mirror to/from. |
| `--direction` | `pull` (external is source) or `push` (GitLab is source). Default: `pull`. |
| `--enabled` | Enable/disable mirror (default: `true`). |
| `--protected-branches-only` | Mirror only protected branches. |
| `--allow-divergence` | Allow divergent refs (push mirrors). |

### glab repo members add flags

| Flag | Short | Description |
|---|---|---|
| `--username` | | Username to add. |
| `--user-id` | `-u` | User ID to add. |
| `--role` | `-r` | Role: `guest` (10), `reporter` (20), `developer` (30), `maintainer` (40), `owner` (50). Default: `developer`. |
| `--role-id` | | Custom role ID. |
| `--expires-at` | `-e` | Membership expiration date (YYYY-MM-DD). |

### glab repo update flags

| Flag | Short | Description |
|---|---|---|
| `--description` | `-d` | New description. |
| `--defaultBranch` | | New default branch. |
| `--archive` | | Archive (`--archive=true`) or unarchive (`--archive=false`). |

### glab repo list flags

| Flag | Short | Description |
|---|---|---|
| `--all` | `-a` | List all projects on the instance. |
| `--mine` | `-m` | List only projects you own (default if no filter). |
| `--group` | `-g` | List repos in a group. |
| `--member` | | List only projects you are a member of. |
| `--starred` | | List only starred projects. |
| `--user` | `-u` | List user projects. |
| `--archived` | | Filter by archived status. |
| `--include-subgroups` | `-G` | Include subgroup projects. |
| `--order` | `-o` | Order by field. |
| `--output` | `-F` | Format: `text`, `json`. |

### glab repo view flags

| Flag | Short | Description |
|---|---|---|
| `--branch` | `-b` | View a specific branch. |
| `--output` | `-F` | Format: `text`, `json`. |
| `--web` | `-w` | Open in browser. |

---

## Project management

---

## glab incident

Work with GitLab incidents.

| Subcommand | Usage | Description |
|---|---|---|
| `close` | `glab incident close [<id> \| <url>]` | Close an incident. |
| `list` | `glab incident list` | List project incidents. |
| `note` | `glab incident note <incident-id>` | Comment on an incident. |
| `reopen` | `glab incident reopen [<id> \| <url>]` | Reopen a resolved incident. |
| `subscribe` | `glab incident subscribe <id>` | Subscribe to notifications. |
| `unsubscribe` | `glab incident unsubscribe <id>` | Unsubscribe from notifications. |
| `view` | `glab incident view <id>` | View incident details. |

### glab incident list flags

| Flag | Short | Description |
|---|---|---|
| `--all` | `-A` | Get all incidents. |
| `--assignee` | `-a` | Filter by assignee. |
| `--author` | | Filter by author. |
| `--label` | `-l` | Filter by label. |
| `--milestone` | `-m` | Filter by milestone. |
| `--closed` | `-c` | Show only closed incidents. |
| `--confidential` | `-C` | Filter by confidential. |
| `--group` | `-g` | Filter in a group. |
| `--search` | | Search string. |
| `--order` | | Order by field. |
| `--output` | `-O` | Format: `text`, `json`. |

### glab incident view flags

| Flag | Short | Description |
|---|---|---|
| `--comments` | `-c` | Show comments. |
| `--system-logs` | `-s` | Show system logs. |
| `--output` | `-F` | Format: `text`, `json`. |
| `--web` | `-w` | Open in browser. |

---

## glab iteration

Retrieve iteration information.

| Subcommand | Usage | Description |
|---|---|---|
| `list` | `glab iteration list` | List project or group iterations. |

### glab iteration list flags

| Flag | Short | Description |
|---|---|---|
| `--group` | `-g` | List iterations for a group. |
| `--output` | `-F` | Format: `text`, `json`. |
| `--page` | `-p` | Page number. |
| `--per-page` | `-P` | Items per page. |

---

## glab label

Manage labels on a project or group.

| Subcommand | Usage | Description |
|---|---|---|
| `create` | `glab label create` | Create a label. |
| `delete` | `glab label delete` | Delete a label. |
| `edit` | `glab label edit` | Edit a label. |
| `get` | `glab label get <label-id>` | Get a single label by ID. |
| `list` | `glab label list` | List labels. |

### glab label create flags

| Flag | Short | Description |
|---|---|---|
| `--name` | `-n` | Label name. |
| `--color` | `-c` | Color in plain or hex (default: `#428BCA`). |
| `--description` | `-d` | Label description. |
| `--priority` | `-p` | Label priority. |

### glab label edit flags

| Flag | Short | Description |
|---|---|---|
| `--label-id` | `-l` | ID of label to update. |
| `--new-name` | `-n` | New name. |
| `--color` | `-c` | New color (6-digit hex with `#`). |
| `--description` | `-d` | New description. |
| `--priority` | `-p` | New priority. |

### glab label list flags

| Flag | Short | Description |
|---|---|---|
| `--group` | `-g` | List labels for a group. |
| `--output` | `-F` | Format: `text`, `json`. |
| `--page` | `-p` | Page number. |
| `--per-page` | `-P` | Items per page. |

---

## glab milestone

Manage group or project milestones.

| Subcommand | Usage | Description |
|---|---|---|
| `create` | `glab milestone create` | Create a milestone. |
| `delete` | `glab milestone delete` | Delete a milestone. |
| `edit` | `glab milestone edit` | Edit a milestone. |
| `get` | `glab milestone get` | Get a milestone by ID. |
| `list` | `glab milestone list` | List milestones. |

All subcommands accept `--project <id_or_path>` and `--group <id_or_path>` to scope the operation.

### glab milestone create/edit flags

| Flag | Description |
|---|---|
| `--title` | Milestone title. |
| `--description` | Milestone description. |
| `--due-date` | Due date (ISO 8601, e.g. `2025-12-16`). |
| `--start-date` | Start date (ISO 8601). |
| `--state` | (edit only) `activate` or `close`. |

### glab milestone list flags

| Flag | Description |
|---|---|
| `--state` | Filter by state: `active` or `closed`. |
| `--title` | Filter by exact title. |
| `--search` | Filter by title/description substring. |
| `--include-ancestors` | Include milestones from parent groups. |
| `--show-id` | Show IDs in output. |

---

## glab schedule

Work with GitLab CI/CD pipeline schedules.

| Subcommand | Usage | Description |
|---|---|---|
| `create` | `glab schedule create` | Create a new pipeline schedule. |
| `delete` | `glab schedule delete <id>` | Delete a schedule. |
| `list` | `glab schedule list` | List schedules. |
| `run` | `glab schedule run <id>` | Immediately run a scheduled pipeline. |
| `update` | `glab schedule update <id>` | Update a schedule. |

### glab schedule create flags

| Flag | Description |
|---|---|
| `--cron` | Cron pattern (e.g. `0 * * * *`). |
| `--cronTimeZone` | Timezone for cron (default: `UTC`). |
| `--description` | Schedule description. |
| `--ref` | Target branch or tag. |
| `--active` | Whether the schedule is active (default: `true`). |
| `--variable` | Variables in `key:value` format. Repeat for multiple. |

### glab schedule update flags

| Flag | Description |
|---|---|
| `--cron` | New cron pattern. |
| `--cronTimeZone` | New timezone. |
| `--description` | New description. |
| `--ref` | New ref. |
| `--active` | Set active state. |
| `--create-variable` | Add a new variable (`key:value`). |
| `--update-variable` | Update an existing variable (`key:value`). |
| `--delete-variable` | Delete a variable by key. |

---

## glab snippet

Create and manage snippets.

| Subcommand | Usage | Description |
|---|---|---|
| `create` | `glab snippet create -t <title> <file>` | Create a new snippet. |

Note: `glab snippet` currently only exposes `create`. Use `glab api` for list, view, update, and delete operations on snippets.

### glab snippet create flags

| Flag | Short | Description |
|---|---|---|
| `--title` | `-t` | Snippet title (required). |
| `--filename` | `-f` | Filename for the snippet in GitLab. |
| `--description` | `-d` | Description. Set to `-` to open editor. |
| `--visibility` | `-v` | Visibility: `public`, `internal`, `private` (default: `private`). |
| `--personal` | `-p` | Create a personal snippet (not project-scoped). |

---

## glab variable

Manage CI/CD variables for a project or group.

| Subcommand | Usage | Description |
|---|---|---|
| `delete` | `glab variable delete <key>` | Delete a variable. |
| `export` | `glab variable export` | Export all variables. |
| `get` | `glab variable get <key>` | Get a variable value. |
| `import` | `glab variable import` | Import variables from a JSON file or standard input. |
| `list` | `glab variable list` | List all variables. |
| `set` | `glab variable set <key> <value>` | Create a new variable. |
| `update` | `glab variable update <key> <value>` | Update an existing variable. |

### glab variable set/update flags

| Flag | Short | Description |
|---|---|---|
| `--value` | `-v` | Variable value (can also pipe from stdin). |
| `--type` | `-t` | Variable type: `env_var` or `file` (default: `env_var`). |
| `--scope` | `-s` | Environment scope (default: `*` for all). |
| `--protected` | `-p` | Protect the variable. |
| `--masked` | `-m` | Mask the variable in job logs. |
| `--hidden` | | Hide the variable (set only, not viewable after). |
| `--raw` | `-r` | Treat as raw string (no variable expansion). |
| `--description` | `-d` | Variable description. |
| `--group` | `-g` | Operate on a group variable instead of project. |

### glab variable list flags

| Flag | Short | Description |
|---|---|---|
| `--group` | `-g` | List group variables. |
| `--instance` | `-i` | List instance-level variables. |
| `--output` | `-F` | Format: `text`, `json`. |
| `--page` | `-p` | Page number. |
| `--per-page` | `-P` | Items per page. |

### glab variable export flags

| Flag | Short | Description |
|---|---|---|
| `--group` | `-g` | Export group variables. |
| `--output` | `-F` | Format: `json`, `export` (shell export statements), `env` (dotenv format). |
| `--scope` | `-s` | Filter by environment scope. |

---

## glab work-items (EXPERIMENTAL)

Manage GitLab work items (epics, issues, tasks, incidents, test cases).

| Subcommand | Usage | Description |
|---|---|---|
| `create` | `glab work-items create` | Create work items in a project or group. (EXPERIMENTAL) |
| `delete` | `glab work-items delete <iid>` | Delete a work item in a project or group. (EXPERIMENTAL) |
| `list` | `glab work-items list` | List work items in a project or group. |
| `update` | `glab work-items update <iid>` | Update work items in a project or group. (EXPERIMENTAL) |

### glab work-items list flags

| Flag | Short | Description |
|---|---|---|
| `--type` | `-t` | Filter by type: `epic`, `issue`, `task`, etc. Comma-separated or repeat flag. |
| `--state` | | Filter by state: `opened`, `closed`, `all` (default: `opened`). |
| `--group` | `-g` | List work items for a group. |
| `--per-page` | `-P` | Items per page (max 100, default: 20). |
| `--after` | | Cursor for pagination (from previous output). |
| `--output` | `-F` | Format: `text`, `json`. |

`glab work-items create` and `glab work-items update` accept `--description-file <file>` (`-` for stdin) and `--attach <file>` (EXPERIMENTAL, repeatable) in addition to `-d/--description`.

---

## glab container-registry

List and manage GitLab container registry repositories and tags.

| Subcommand | Usage | Description |
|---|---|---|
| `repository list` | `glab container-registry repository list` | List container registry repositories. |
| `repository view` | `glab container-registry repository view <repository-id>` | View a container registry repository. |
| `repository delete` | `glab container-registry repository delete <repository-id>` | Delete a container registry repository. |
| `tag list` | `glab container-registry tag list <repository-id>` | List tags for a repository. |
| `tag view` | `glab container-registry tag view <repository-id> <tag-name>` | View a container registry tag. |
| `tag delete` | `glab container-registry tag delete <repository-id> [<tag-name>]` | Delete container registry tags. |

---

## glab packages

Upload, download, list, and delete packages in a project's package registry.

`list` and `delete` operate on packages of any type. `upload` and `download` are limited to generic packages, identified by a package name, version, and file name.

| Subcommand | Usage | Description |
|---|---|---|
| `list` | `glab packages list` | List packages in a project's package registry. |
| `download` | `glab packages download --name <package> --version <version> --filename <file>` | Download a file from the package registry. |
| `upload` | `glab packages upload <file> --name <package> --version <version>` | Upload a file to the package registry. |
| `delete` | `glab packages delete <id>` | Delete a package from the package registry. |

---

## glab artifact-registry (EXPERIMENTAL)

Exchange a GitLab credential for a short-lived GitLab Artifact Registry access token, either to check your access, to hand the token to a caller, or to configure a package manager to authenticate against the registry.

Requires a GitLab Enterprise Edition (EE) instance on GitLab 19.1+ with token exchange enabled (the `gate_token_exchange_endpoint` feature flag).

| Subcommand | Usage | Description |
|---|---|---|
| `get-token` | `glab artifact-registry get-token [--duration <dur>] [--hostname <host>]` | Get a short-lived access token for the GitLab Artifact Registry. Prints the bare token to stdout. (EXPERIMENTAL) |
| `login` | `glab artifact-registry login --<package-manager> --registry <registry>` | Configure a package manager to authenticate against the GitLab Artifact Registry. (EXPERIMENTAL) |
| `status` | `glab artifact-registry status [--hostname <host>]` | Check your access to the GitLab Artifact Registry; prints issuer, subject, audience, and expiry. (EXPERIMENTAL) |

`get-token` and `status` support `-F/--output text\|json` and `--jq` for filtering JSON output.

### glab artifact-registry login flags

| Flag | Description |
|---|---|
| `--docker` | Register `glab` as a Docker credential helper for the registry. Writes to `$DOCKER_CONFIG`, or `~/.docker`. |
| `--maven` | Write a `<server>` block to `~/.m2/settings.xml`, keyed by `--registry-alias`. |
| `--gradle` | Write `{alias}Url`, `{alias}Username`, and `{alias}Password` to `~/.gradle/gradle.properties`. |
| `--npm` | Write a `//{host}{path}/:_authToken` entry to `~/.npmrc`. |
| `--sbt` | Write a `credentials +=` line to `~/.sbt/1.0/credentials.sbt`. |
| `--registry` | Registry to authenticate against. A bare hostname for `--docker`; typically a URL for the others. |
| `--registry-alias` | Alias/ID to register the registry under (Maven and Gradle only). |
| `--duration` | How long the exchanged token stays valid (default: `15m`, max: `12h`). Ignored for `--docker`. |
| `--hostname` | GitLab hostname to request the token from. |

`--docker` exchanges a fresh token on every pull or push. Every other flag writes one token that nothing refreshes, so rerun the command before `--duration` elapses.

---

## CI/CD infrastructure

---

## glab runner

Manage GitLab CI/CD runners.

| Subcommand | Usage | Description |
|---|---|---|
| `assign` | `glab runner assign <runner-id>` | Assign a runner to a project. Requires Maintainer or Owner. |
| `delete` | `glab runner delete <runner-id>` | Permanently delete a runner. |
| `jobs` | `glab runner jobs <runner-id>` | List jobs processed by a runner. |
| `list` | `glab runner list` | List runners for a project, group, or instance. |
| `managers` | `glab runner managers <runner-id>` | List runner managers. |
| `unassign` | `glab runner unassign <runner-id>` | Unassign a runner from a project. |
| `update` | `glab runner update <runner-id>` | Update runner settings (pause/unpause). |

### glab runner list flags

| Flag | Short | Description |
|---|---|---|
| `--group` | `-g` | List runners for a group. |
| `--instance` | `-i` | List all runners (instance scope, requires admin). |
| `--output` | `-F` | Format: `text`, `json`. |
| `--page` | `-p` | Page number. |
| `--per-page` | `-P` | Items per page. |

### glab runner delete flags

| Flag | Short | Description |
|---|---|---|
| `--force` | `-f` | Skip confirmation prompt. |

### glab runner update flags

| Flag | Description |
|---|---|
| `--pause` | Pause the runner. |
| `--unpause` | Resume a paused runner. |

---

## glab runner-controller (EXPERIMENTAL)

Manage runner controllers. Administrator-only.

| Subcommand | Usage | Description |
|---|---|---|
| `create` | `glab runner-controller create` | Create a runner controller. (EXPERIMENTAL) |
| `delete` | `glab runner-controller delete <id>` | Delete a runner controller. (EXPERIMENTAL) |
| `get` | `glab runner-controller get <controller-id>` | Get details of a runner controller. (EXPERIMENTAL) |
| `list` | `glab runner-controller list` | List runner controllers. (EXPERIMENTAL) |
| `scope create` | `glab runner-controller scope create <controller-id>` | Create a scope (`--instance` or `--runner <id>`). (EXPERIMENTAL) |
| `scope delete` | `glab runner-controller scope delete <controller-id>` | Delete a scope (`--instance` or `--runner <id>`). (EXPERIMENTAL) |
| `scope list` | `glab runner-controller scope list <controller-id>` | List scopes for a runner controller. (EXPERIMENTAL) |
| `token create` | `glab runner-controller token create <controller-id>` | Create a token for a runner controller. (EXPERIMENTAL) |
| `token list` | `glab runner-controller token list <controller-id>` | List tokens for a runner controller. (EXPERIMENTAL) |
| `token revoke` | `glab runner-controller token revoke <controller-id> <token-id>` | Revoke a token. (EXPERIMENTAL) |
| `token rotate` | `glab runner-controller token rotate <controller-id> <token-id>` | Rotate a token. (EXPERIMENTAL) |
| `update` | `glab runner-controller update <id>` | Update a runner controller. (EXPERIMENTAL) |

---

## glab securefile

Manage secure files for a project. Files are stored outside version control and are available in CI/CD pipelines. Max 100 files, max 5 MB each.

| Subcommand | Usage | Description |
|---|---|---|
| `create` | `glab securefile create <fileName> <inputFilePath>` | Create (upload) a secure file. Alias: `upload`. |
| `download` | `glab securefile download <fileID>` | Download a secure file. |
| `get` | `glab securefile get <fileID>` | Get secure file details. (GitLab 18.0+) Alias: `show`. |
| `list` | `glab securefile list` | List secure files. Alias: `ls`. |
| `remove` | `glab securefile remove <fileID>` | Delete a secure file. Aliases: `rm`, `delete`. |
| `update` | `glab securefile update <name> <path>` | Update a secure file in a project. |

### glab securefile download flags

| Flag | Description |
|---|---|
| `--id` | File ID to download. |
| `--name` | File name to download (alternative to ID). |
| `--path` | `-p` Download path (including filename). |
| `--all` | Download all project secure files. |
| `--output-dir` | Output directory when using `--all`. |
| `--no-verify` | Skip checksum verification. |
| `--force-download` | Download even if checksum fails. |

---

## glab opentofu

Work with the OpenTofu or Terraform integration.

| Subcommand | Usage | Description |
|---|---|---|
| `init` | `glab opentofu init <state>` | Initialize OpenTofu/Terraform with GitLab state backend. |
| `state` | `glab opentofu state` | Work with states. |
| `state delete` | `glab opentofu state delete <state> [<serial>]` | Delete a state or version. |
| `state download` | `glab opentofu state download <state> [<serial>]` | Download state as JSON to stdout. |
| `state list` | `glab opentofu state list` | List states. |
| `state lock` | `glab opentofu state lock <state>` | Lock a state. |
| `state unlock` | `glab opentofu state unlock <state>` | Unlock a state. |

### glab opentofu init flags

| Flag | Short | Description |
|---|---|---|
| `--binary` | `-b` | Name or path of the binary to use (default: `tofu`). |
| `--directory` | `-d` | Project directory (default: `.`). |

Pass additional flags to the init command with `-- <flags>`, e.g. `glab opentofu init production -- -reconfigure`.

---

## glab cluster

Manage GitLab Agents for Kubernetes and clusters.

| Subcommand | Usage | Description |
|---|---|---|
| `agent bootstrap` | `glab cluster agent bootstrap <agent-name>` | Bootstrap a Kubernetes agent (requires `kubectl` and `flux`). |
| `agent check-manifest-usage` | `glab cluster agent check-manifest-usage --group <group>` | Check agent configs for the deprecated `gitops.manifest_projects` setting. Renamed from `check_manifest_usage` in glab 1.116.0. (EXPERIMENTAL) |
| `agent get-token` | `glab cluster agent get-token` | Create a `k8s_proxy`-scoped PAT to authenticate with an agent. |
| `agent list` | `glab cluster agent list` | List agents in a project. |
| `agent token list` | `glab cluster agent token list <agent-id>` | List tokens for an agent. |
| `agent token revoke` | `glab cluster agent token revoke <agent-id> <token-id>` | Revoke an agent token. |
| `agent token-cache list` | `glab cluster agent token-cache list` | List cached agent tokens (keyring/filesystem). |
| `agent token-cache clear` | `glab cluster agent token-cache clear` | Clear cached agent tokens. |
| `agent update-kubeconfig` | `glab cluster agent update-kubeconfig` | Update kubeconfig for agent access. |
| `graph` | `glab cluster graph` | Query Kubernetes object graph via the agent. (EXPERIMENTAL) |

### glab cluster agent bootstrap key flags

| Flag | Short | Description |
|---|---|---|
| `--manifest-path` | `-p` | Directory in Git repo for Flux manifests. |
| `--manifest-branch` | `-b` | Branch to commit Flux manifests to. |
| `--no-reconcile` | | Do not trigger Flux reconciliation after bootstrap. |
| `--create-environment` | | Create GitLab environment for the agent (default: `true`). |
| `--create-flux-environment` | | Create GitLab environment for FluxCD (default: `true`). |
| `--use-api-commit-author` | | Use API user for Git commits. |

### glab cluster agent update-kubeconfig flags

| Flag | Short | Description |
|---|---|---|
| `--agent` | `-a` | Numeric agent ID. |
| `--kubeconfig` | | Path to kubeconfig file. |
| `--use-context` | `-u` | Set as default context. |
| `--cache-mode` | `-c` | Token cache mode: `keyring-filesystem-fallback`, `force-keyring`, `force-filesystem`, `no`. |
| `--token-expiry-duration` | | Token validity duration (minimum: 1 day). |

---

## glab dependency-firewall (EXPERIMENTAL)

Run local package managers through the GitLab Dependency Firewall, check a single package against the firewall policy, and summarize blocked or flagged packages from a CI run. Aliased as `glab df`.

| Subcommand | Usage | Description |
|---|---|---|
| `package` | `glab dependency-firewall package <purl>` | Check one package URL against the firewall policy for the current project and report allow, warning, or blocked. No package manager binary required. (EXPERIMENTAL) |
| `ci-summary` | `glab dependency-firewall ci-summary` | Read `.gitlab/df/ci-log.json` in the current directory and print blocked/flagged packages from the last run. (EXPERIMENTAL) |
| `npm`, `pnpm`, `yarn` | `glab dependency-firewall npm <npm args>` | Run the JavaScript package manager through the firewall. (EXPERIMENTAL) |
| `pip`, `pipenv`, `poetry`, `uv`, `twine` | `glab dependency-firewall pip <pip args>` | Run the Python tool through the firewall. (EXPERIMENTAL) |
| `maven`, `gradle` | `glab dependency-firewall maven <mvn args>` | Run the JVM build tool through the firewall. (EXPERIMENTAL) |
| `gem`, `bundle` | `glab dependency-firewall bundle <bundle args>` | Run the Ruby tool through the firewall. (EXPERIMENTAL) |

The wrapper subcommands pass their arguments to the package manager and need a repository with a GitLab remote. The `configure` subcommand was removed; use the wrappers instead.

`package` supports the PURL types `npm`, `pypi`, `maven`, and `gem`, and the PURL must include a version. It does not write to the CI log, so `ci-summary` does not include its result.

Exit codes for `package`: `0` allow or warning, `1` misconfiguration or transport error, `3` blocked.
Exit codes for `ci-summary`: `0` no blocked entries, `1` log could not be read, `3` at least one entry blocked.

Examples:
```sh
glab df package pkg:npm/left-pad@1.3.0
glab df npm install
glab df ci-summary
```

---

## Account management

---

## glab auth

Manage glab's authentication state.

| Subcommand | Usage | Description |
|---|---|---|
| `configure-docker` | `glab auth configure-docker` | Register glab as a Docker credential helper. |
| `docker-helper` | `glab auth docker-helper` | Docker credential helper for GitLab container registries. |
| `dpop-gen` | `glab auth dpop-gen` | Generate a DPoP proof JWT. (EXPERIMENTAL) |
| `login` | `glab auth login` | Authenticate with a GitLab instance. |
| `logout` | `glab auth logout` | Remove stored credentials. |
| `status` | `glab auth status` | Display authentication status. |

### glab auth login flags

| Flag | Short | Description |
|---|---|---|
| `--hostname` | | GitLab instance hostname. |
| `--token` | `-t` | Personal access token. |
| `--stdin` | | Read token from stdin. |
| `--web` | | Skip the login type prompt and use web/OAuth login. |
| `--device` | | Use the OAuth 2.0 device authorization flow, for headless environments. Requires GitLab 17.9+. |
| `--api-host` | `-a` | API endpoint hostname (or `hostname:port`), if different from `--hostname`. |
| `--api-protocol` | `-p` | API protocol: `https` or `http`. |
| `--git-protocol` | `-g` | Git protocol: `ssh`, `https`, or `http`. |
| `--ssh-hostname` | | SSH hostname, for instances with a different SSH endpoint. |
| `--container-registry-domains` | | Container registry and image dependency proxy domains, comma-separated. |
| `--job-token` | `-j` | CI job token (for CI pipelines). |
| `--insecure-storage` | | Store the token as plaintext in the config file instead of the OS keyring. |

Credentials are stored in the OS keyring (macOS Keychain, Windows Credential Manager, or the Secret Service on Linux) when one is available. Without a keyring, in CI, or with `--insecure-storage`, they are stored as plaintext in the global config file (run `glab config path` to locate it). Environment variables `GITLAB_TOKEN`, `GITLAB_ACCESS_TOKEN`, or `OAUTH_TOKEN` override stored credentials.

OAuth against a self-managed instance needs an OAuth application client ID (config key `client_id`, or `$GITLAB_CLIENT_ID`); interactive login guides you through the setup.

### glab auth status flags

| Flag | Short | Description |
|---|---|---|
| `--all` | `-a` | Check all configured instances. |
| `--hostname` | | Check a specific instance. |
| `--show-token` | `-t` | Display the auth token. |

### glab auth dpop-gen flags (EXPERIMENTAL)

| Flag | Short | Description |
|---|---|---|
| `--private-key` | `-p` | Path to private SSH key (RSA, ed25519, or ECDSA). |
| `--pat` | | Personal access token (defaults to stored token). |
| `--hostname` | | GitLab instance hostname. |

DPoP JWTs are valid for 5 minutes. Use together with a PAT to authenticate to the GitLab API.

---

## glab config

Manage glab settings.

| Subcommand | Usage | Description |
|---|---|---|
| `edit` | `glab config edit` | Open the config file in the default editor. |
| `get` | `glab config get <key>` | Print a configuration value. |
| `path` | `glab config path [--dir]` | Print the location of the global config file (`--dir` prints its directory). |
| `set` | `glab config set <key> <value>` | Set a configuration value. |

The config file location depends on the platform, so use `glab config path` instead of hard-coding it. Repository-local settings live in `.git/glab-cli/config.yml`.

Most keys can also be set through an environment variable. Since glab 1.118.0 each unprefixed variable has a `GLAB_`-prefixed name that wins when both are set (for example `GLAB_NO_PROMPT` over `NO_PROMPT`).

Global configuration keys:

| Key | Description |
|---|---|
| `branch_prefix` | Prefix used by `glab stack` when naming generated branches (default: `$USER`, falling back to `glab-stack`). Env: `GLAB_BRANCH_PREFIX`. |
| `browser` | Browser used to open links. Env: `GLAB_BROWSER`, `BROWSER`. |
| `check_update` | Check for new versions and notify. Env: `GLAB_CHECK_UPDATE`. |
| `debug` | Log more detail, including Git commands and expanded aliases. Env: `GLAB_DEBUG`. |
| `display_hyperlinks` | Show hyperlinks in terminal output (default: `true` for TTYs). Env: `GLAB_DISPLAY_HYPERLINKS`; `FORCE_HYPERLINKS=1` forces them outside a TTY. |
| `duo_cli_auto_download` | Automatically download the Duo CLI binary without prompting. Env: `GLAB_DUO_CLI_AUTO_DOWNLOAD`. |
| `duo_cli_auto_run` | Automatically run GitLab Duo CLI without prompting. Env: `GLAB_DUO_CLI_AUTO_RUN`. |
| `editor` | Editor used for issues, MRs, etc. Also accepted as `visual`. Env: `GLAB_EDITOR`, `VISUAL`, `EDITOR`. |
| `git_protocol` | Protocol for Git operations: `ssh` or `https`. Env: `GLAB_GIT_PROTOCOL`. |
| `glab_pager` | Pager command, e.g. `less -R`. Env: `GLAB_PAGER`. |
| `glamour_style` | Markdown renderer style: `dark`, `light`, `notty`, or a custom glamour style. Env: `GLAB_GLAMOUR_STYLE`. |
| `host` | Default GitLab hostname. Env: `GITLAB_HOST`. |
| `no_prompt` | Disable interactive prompts if `true`. Env: `GLAB_NO_PROMPT`, `NO_PROMPT`. |
| `notify_skill_updates` | Show a notice when an installed agent skill has updates available. Env: `GLAB_NOTIFY_SKILL_UPDATES`. |
| `orbit_cli_auto_download` | Automatically download the Orbit CLI binary without prompting. Renamed from `orbit_local_auto_download` in glab 1.119.0. Env: `GLAB_ORBIT_CLI_AUTO_DOWNLOAD`. |
| `orbit_cli_auto_run` | Automatically run the Orbit CLI without prompting. Renamed from `orbit_local_auto_run` in glab 1.119.0. Env: `GLAB_ORBIT_CLI_AUTO_RUN`. |
| `remote_alias` | Name of the `git remote` pointing at the GitLab repository, used when multiple remotes are configured. Env: `GLAB_REMOTE_ALIAS`. |
| `show_whats_new` | Show a one-time post-upgrade banner pointing at `glab whatsnew`. Env: `GLAB_SHOW_WHATS_NEW`. |
| `telemetry` | Send usage data to your GitLab instance; set to `false` to disable. Env: `GLAB_SEND_TELEMETRY`. |

Per-host configuration keys (set with `--host <hostname>`):

| Key | Description |
|---|---|
| `api_host` | Host for the API endpoint, if different from the host itself. Env: `GITLAB_API_HOST`. |
| `api_protocol` | Protocol for the API endpoint: `http` or `https`. Env: `GLAB_API_PROTOCOL`. |
| `artifact_registry_domains` | Domains backed by GitLab Artifact Registry, used by the Docker credential helper. Env: `GLAB_ARTIFACT_REGISTRY_DOMAINS`. |
| `ca_cert` | Path to a CA certificate (PEM) for verifying the server's TLS certificate. Env: `GLAB_CA_CERT`. |
| `client_cert` | Path to a client certificate (PEM) for mutual TLS. Env: `GLAB_CLIENT_CERT`. |
| `client_key` | Path to the private key (PEM) matching `client_cert`. Env: `GLAB_CLIENT_KEY`. |
| `client_id` | OAuth application client ID. Required for OAuth against a self-managed instance. Env: `GITLAB_CLIENT_ID`. |
| `container_registry_domains` | Domains of associated container registries, used by the Docker credential helper. Env: `GLAB_CONTAINER_REGISTRY_DOMAINS`. |
| `custom_headers` | Custom HTTP headers added to every request. Each header uses one of `value`, `valueFromEnv`, or `valueFromCommand`. |
| `job_token` | CI job token, usually populated from `CI_JOB_TOKEN` when CI auto-login is enabled. |
| `proxy` | Custom proxy for this host. Env: `GLAB_PROXY`. |
| `skip_tls_verify` | Skip TLS certificate verification (development only). Env: `GLAB_SKIP_TLS_VERIFY`. |
| `ssh_host` | Alternate hostname for SSH Git operations. Env: `GITLAB_SSH_HOST`. |
| `subfolder` | Subfolder where GitLab is installed (e.g. `gitlab` for `https://example.com/gitlab/`). Env: `GITLAB_SUBFOLDER`. |
| `token` | GitLab access token (prefer env vars). Env: `GITLAB_TOKEN`, `GITLAB_ACCESS_TOKEN`, `OAUTH_TOKEN`. |
| `use_keyring` | Store the host's credentials in the OS keyring. Set automatically by `glab auth login`. Env: `GLAB_USE_KEYRING`. |

### glab config get/set flags

| Flag | Short | Description |
|---|---|---|
| `--global` | `-g` | Use global config file. |
| `--host` | | Get/set per-host configuration. |

### glab config edit flags

| Flag | Short | Description |
|---|---|---|
| `--local` | `-l` | Open local `.git/glab-cli/config.yml` instead of global. |

---

## glab token

Manage personal, project, or group access tokens.

| Subcommand | Usage | Description |
|---|---|---|
| `create` | `glab token create <name>` | Create a user, group, or project access token. |
| `list` | `glab token list` | List access tokens. |
| `revoke` | `glab token revoke <token-name\|token-id>` | Revoke an access token. |
| `rotate` | `glab token rotate <token-name\|token-id>` | Rotate an access token (revoke and issue new). |

By default, all commands operate on project access tokens. Use `--user` or `--group` to change scope.

### glab token create flags

| Flag | Short | Description |
|---|---|---|
| `--scope` | `-S` | Scopes (comma-separated or repeat flag). Default: `[read_repository]`. |
| `--access-level` | `-A` | `guest`, `reporter`, `developer`, `maintainer`, or `owner`. |
| `--duration` | `-D` | Lifetime: `30d`, `4w`, `720h`, etc. Max: `365d`. Default: `30d`. |
| `--expires-at` | `-E` | Explicit expiration date (YYYY-MM-DD). Overrides `--duration`. |
| `--description` | | Token description. |
| `--user` | `-U` | Create a personal access token. Use `@me` for current user. |
| `--group` | `-g` | Create a group access token. |
| `--output` | `-F` | Format: `text` (token value) or `json` (metadata). |

Non-admins can only create PATs for themselves (`--user @me`) with scope `k8s_proxy`.

### glab token list flags

| Flag | Short | Description |
|---|---|---|
| `--active` | `-a` | List only active tokens. |
| `--user` | `-U` | List personal access tokens (use `@me` for current user). |
| `--group` | `-g` | List group access tokens. |
| `--output` | `-F` | Format: `text` or `json`. |

### glab token revoke/rotate flags

| Flag | Short | Description |
|---|---|---|
| `--user` | `-U` | Revoke/rotate personal access token. |
| `--group` | `-g` | Revoke/rotate group access token. |
| `--duration` | `-D` | (rotate only) New token lifetime. |
| `--expires-at` | `-E` | (rotate only) New explicit expiration date. |
| `--output` | `-F` | Format: `text` or `json`. |

---

## glab ssh-key

Manage SSH keys on your GitLab account.

| Subcommand | Usage | Description |
|---|---|---|
| `add` | `glab ssh-key add [key-file]` | Upload an SSH key (reads from stdin if no file given). |
| `delete` | `glab ssh-key delete <key-id>` | Delete an SSH key. |
| `get` | `glab ssh-key get <key-id>` | Get a single SSH key. |
| `list` | `glab ssh-key list` | List your SSH keys. |

### glab ssh-key add flags

| Flag | Short | Description |
|---|---|---|
| `--title` | `-t` | Key title (required). |
| `--usage-type` | `-u` | Usage scope: `auth`, `signing`, or `auth_and_signing` (default). |
| `--expires-at` | `-e` | Expiration date (ISO 8601). |

`glab ssh-key list --show-id` shows key IDs in output.

---

## glab gpg-key

Manage GPG keys on your GitLab account.

| Subcommand | Usage | Description |
|---|---|---|
| `add` | `glab gpg-key add [key-file]` | Upload a GPG key (reads from stdin if no file given). |
| `delete` | `glab gpg-key delete <key-id>` | Delete a GPG key. |
| `get` | `glab gpg-key get <key-id>` | Get a single GPG key. |
| `list` | `glab gpg-key list` | List your GPG keys. |

`glab gpg-key list --show-id` shows key IDs in output.

---

## glab deploy-key

Manage deploy keys for a project.

| Subcommand | Usage | Description |
|---|---|---|
| `add` | `glab deploy-key add [key-file]` | Upload a deploy key (reads from stdin if no file given). |
| `delete` | `glab deploy-key delete <key-id>` | Delete a deploy key. |
| `get` | `glab deploy-key get <key-id>` | Get a single deploy key. |
| `list` | `glab deploy-key list` | List deploy keys for the project. |

### glab deploy-key add flags

| Flag | Short | Description |
|---|---|---|
| `--title` | `-t` | Key title (required). |
| `--can-push` | `-c` | Allow this deploy key to push code. |
| `--expires-at` | `-e` | Expiration date (ISO 8601). |

`glab deploy-key list --show-id` shows key IDs in output.

---

## glab user

Interact with GitLab user accounts.

| Subcommand | Usage | Description |
|---|---|---|
| `events` | `glab user events` | View events for the authenticated user. |

---

## Utilities

---

## glab alias

Create, list, and delete command aliases.

| Subcommand | Usage | Description |
|---|---|---|
| `delete` | `glab alias delete <alias-name>` | Delete an alias. |
| `list` | `glab alias list` | List all aliases. |
| `set` | `glab alias set <alias-name> '<command>'` | Create an alias. |

### glab alias set flags

| Flag | Short | Description |
|---|---|---|
| `--shell` | `-s` | Run alias through a shell interpreter (enables `\|`, `>`, `$1`, `$@`, etc.). |

Alias expansions can include positional placeholders (`$1`, `$2`, `$@`). Extra arguments are appended.

Examples:
```sh
glab alias set mrv 'mr view'
glab alias set --shell igrep 'glab issue list --assignee="$1" | grep $2'
```

---

## glab api

Make authenticated requests to the GitLab REST or GraphQL API.

```
glab api <endpoint> [--flags]
```

The `endpoint` is a GitLab API v4 path or `graphql`.

URL placeholders replaced from current repo context:
- `:branch`, `:fullpath`, `:group`, `:id`, `:namespace`, `:repo`, `:user`, `:username`

| Flag | Short | Description |
|---|---|---|
| `--method` | `-X` | HTTP method (default: `GET`, or `POST` if parameters given). |
| `--field` | `-F` | Parameter with type inference (`true`/`false`/`null`/integers converted; `@file` reads file). |
| `--raw-field` | `-f` | String parameter (no type conversion). |
| `--header` | `-H` | Additional HTTP request header. |
| `--hostname` | | Override GitLab hostname. |
| `--input` | | File to use as request body (`-` for stdin). |
| `--include` | `-i` | Include HTTP response headers in output. |
| `--paginate` | | Fetch all pages sequentially. |
| `--silent` | | Do not print response body. |
| `--output` | | Output format: `json` (default) or `ndjson` (newline-delimited). |

GraphQL notes:
- All fields except `query` and `operationName` are treated as GraphQL variables.
- Pagination requires `$endCursor: String` variable and `pageInfo { hasNextPage, endCursor }` in the query.

Examples:
```sh
glab api projects/:fullpath/releases
glab api issues --paginate --output ndjson | jq 'select(.state == "opened")'
glab api graphql -f query="query { currentUser { username } }"
```

---

## glab changelog

Interact with the changelog API.

| Subcommand | Usage | Description |
|---|---|---|
| `generate` | `glab changelog generate` | Generate a changelog for the project. |

### glab changelog generate flags

| Flag | Short | Description |
|---|---|---|
| `--version` | `-v` | Version to generate changelog for (semantic version). Defaults to `git describe`. |
| `--from` | | Start commit SHA (not included). |
| `--to` | | End commit SHA (included). Defaults to HEAD of default branch. |
| `--date` | | Release date (ISO 8601). Defaults to current time. |
| `--trailer` | | Git trailer to use for commits (default: `Changelog`). |
| `--config-file` | | Path to changelog config in the repo (default: `.gitlab/changelog_config.yml`). |

---

## glab duo

Work with GitLab Duo AI assistant.

| Subcommand | Usage | Description |
|---|---|---|
| `cli` | `glab duo cli [command]` | Run the GitLab Duo CLI (GitLab Duo Agent Platform in your terminal). Requires GitLab 19.2+, or GitLab 18.11 to 19.1 with beta and experimental features turned on. Downloads a separate binary on first use. |

### glab duo cli flags

| Flag | Short | Description |
|---|---|---|
| `--install` | | Install the GitLab Duo CLI binary without running it. |
| `--update` | | Check for and install updates to the binary. |
| `--yes` | `-y` | Skip confirmation prompts. |

All other arguments and flags are passed through to the GitLab Duo CLI binary. `glab` handles authentication automatically. Config keys `duo_cli_auto_run` and `duo_cli_auto_download` skip the run/download confirmation prompts.

Note: `glab duo ask` was removed; use `glab duo cli` instead.

---

## glab orbit (EXPERIMENTAL)

Run the Orbit CLI (GitLab Knowledge Graph) through glab.

```
glab orbit [<command>] [--flags]
```

Since glab 1.115.0, `glab orbit` no longer has subcommands of its own (`orbit local` and `orbit remote ...` were removed). Every command and flag, including `--help`, is forwarded to the managed Orbit binary, which glab downloads, verifies, and updates on first use. glab passes your GitLab credential to the binary, so remote commands need no separate login.

Prerequisites: run `glab auth login`, and Orbit must be enabled for your namespace (the `knowledge_graph` feature flag).

| Flag | Short | Description |
|---|---|---|
| `--install` | | Install the Orbit binary without running it. |
| `--update` | | Check for and install updates to the binary. |
| `--yes` | `-y` | Skip confirmation prompts. |

Config keys `orbit_cli_auto_run` and `orbit_cli_auto_download` skip the run/download confirmation prompts.

Examples (the commands themselves come from the Orbit binary; run `glab orbit --help` once it is installed):
```sh
glab orbit --install
glab orbit setup
glab orbit status
glab orbit query ./query.json
glab orbit graph-status --full-path gitlab-org/gitlab
glab orbit index .
```

---

## glab govern (EXPERIMENTAL)

Manage AI agent governance for external agents running against GitLab projects: record agent sessions as audit events and diagnose the setup.

| Subcommand | Usage | Description |
|---|---|---|
| `setup` | `glab govern setup [-y]` | Install Stop and SessionEnd hooks in `~/.claude/settings.json` so agent sessions are recorded. Safe to rerun. (EXPERIMENTAL) |
| `doctor` | `glab govern doctor` | Check authentication, `glab` in `PATH`, Claude Code hooks, and API connectivity; prints a fix for each failed check. (EXPERIMENTAL) |
| `audit sync` | `glab govern audit sync [--complete] [--silent]` | Read new entries from the local agent transcript and post them to GitLab as audit events. Called by the hooks. (EXPERIMENTAL) |

### glab govern audit sync flags

| Flag | Description |
|---|---|
| `--complete` | Mark the session as completed. Used by the SessionEnd hook. |
| `--silent` | Suppress all output. Used when invoked from hooks. |

Note: `glab govern setup` edits your Claude Code user settings. Run it only if you want agent sessions synced to GitLab.

---

## glab search (BETA)

Search a GitLab project for code and other resources.

| Subcommand | Usage | Description |
|---|---|---|
| `semantic` | `glab search semantic` | Search project code using natural language (AI-powered). |

---

## glab security (EXPERIMENTAL)

Enable, disable, or inspect security scan profiles for a project (SAST, secret detection, dependency scanning, container scanning, etc.).

| Subcommand | Usage | Description |
|---|---|---|
| `config enable` | `glab security config enable <profile>` | Enable a security scan profile for a project. (EXPERIMENTAL) |
| `config disable` | `glab security config disable <profile>` | Disable a security scan profile for a project. (EXPERIMENTAL) |
| `config status` | `glab security config status <profile>` | Show the status of a security scan profile. (EXPERIMENTAL) |

---

## glab skills (EXPERIMENTAL)

Install and manage glab's bundled agent skills, following the Agent Skills specification. Works with GitLab Duo Agent Platform, Claude Code, Codex, and Gemini CLI.

| Subcommand | Usage | Description |
|---|---|---|
| `get` | `glab skills get <name> [<path>]` | Print a file from a bundled agent skill without installing it. The path defaults to `SKILL.md`. (EXPERIMENTAL) |
| `install` | `glab skills install [name]` | Install glab's bundled agent skills. (EXPERIMENTAL) |
| `list` | `glab skills list` | List the available bundled agent skills. (EXPERIMENTAL) |
| `update` | `glab skills update [name]` | Update installed agent skills to the current shipped version. (EXPERIMENTAL) |

Config key `notify_skill_updates` (default: `true`) shows a notice when an installed skill has updates available.

---

## glab todo

Manage your to-do list: items that need your attention, such as issues and merge requests where you were assigned, mentioned, or asked to review.

| Subcommand | Usage | Description |
|---|---|---|
| `list` | `glab todo list` | List your to-do items. |
| `done` | `glab todo done [<id>]` | Mark a to-do item as done. Use `--all` to mark every item done. |

Examples:
```sh
glab todo list
glab todo done 123
glab todo done --all
```

---

## glab mcp (EXPERIMENTAL)

Manage a Model Context Protocol (MCP) server for AI assistant integration.

| Subcommand | Usage | Description |
|---|---|---|
| `serve` | `glab mcp serve` | Start an MCP server using stdio transport. (EXPERIMENTAL) |

The MCP server exposes GitLab features (issues, MRs, projects, CI/CD) as tools for AI assistants like Claude Code.

To configure in Claude Code:
```json
{
  "mcpServers": {
    "glab": {
      "type": "stdio",
      "command": "glab",
      "args": ["mcp", "serve"]
    }
  }
}
```

---

## glab stack (EXPERIMENTAL)

Create and manage stacked diffs. Each stack entry creates a separate MR. Metadata is stored in `.git/stacked/`.

| Subcommand | Usage | Description |
|---|---|---|
| `amend` | `glab stack amend [files]` | Add more changes to the current stacked diff. (EXPERIMENTAL) |
| `create` | `glab stack create <name>` | Create a new stack. (EXPERIMENTAL) |
| `delete` | `glab stack delete [<stack-name>]` | Delete a stack's local metadata. Branches, commits, and MRs are not affected. `-y/--yes` skips confirmation. (EXPERIMENTAL) |
| `first` | `glab stack first` | Move to the first diff in the stack. (EXPERIMENTAL) |
| `infer` | `glab stack infer <revision-range>` | Add layers to a stack based on a range of commits. (EXPERIMENTAL) |
| `last` | `glab stack last` | Move to the last diff in the stack. (EXPERIMENTAL) |
| `list` | `glab stack list` | List all entries in the stack. (EXPERIMENTAL) |
| `move` | `glab stack move` | Move to any selected entry in the stack. (EXPERIMENTAL) |
| `next` | `glab stack next` | Move to the next diff. (EXPERIMENTAL) |
| `prev` | `glab stack prev` | Move to the previous diff. (EXPERIMENTAL) |
| `reorder` | `glab stack reorder` | Reorder MRs in the stack. (EXPERIMENTAL) |
| `save` | `glab stack save [files]` | Save current changes as a new diff in the stack. (EXPERIMENTAL) |
| `switch` | `glab stack switch <stack-name>` | Switch to a different stack. (EXPERIMENTAL) |
| `sync` | `glab stack sync` | Push changes and sync all MRs in the stack. (EXPERIMENTAL) |

### glab stack save/amend flags

| Flag | Short | Description |
|---|---|---|
| `--message` | `-m` | Description of the change (alias: `--description`). |
| `--description` | `-d` | Description of the change. |

### glab stack reorder flags

| Flag | Description |
|---|---|
| `--continue` | Continue a reorder after resolving conflicts (finish the rebase with `git rebase --continue` first). |
| `--abort` | Abort a reorder and restore the original branch order. |

`glab stack reorder` rebases each branch onto its new parent and retargets each MR. Nothing is pushed until you run `glab stack sync`.

### glab stack sync flags

| Flag | Description |
|---|---|
| `--no-verify` | Bypass the pre-push hook. |

`glab stack sync` steps:
1. Pushes amended changes to their MRs.
2. Rebases changes that happened earlier in the stack.
3. Removes merged or closed-MR branches.

---

## glab attestation (EXPERIMENTAL)

Manage software attestations. Works with GitLab.com only. Requires the `cosign` binary.

| Subcommand | Usage | Description |
|---|---|---|
| `verify` | `glab attestation verify <project_id> <artifact_path>` | Verify the provenance of an artifact. (EXPERIMENTAL) |

Examples:
```sh
glab attestation verify gitlab-org/gitlab filename.txt
glab attestation verify 123 filename.txt
```

---

## glab completion

Generate shell completion scripts.

```
glab completion [--flags]
```

Supported shells: bash, zsh, fish, PowerShell.

---

## glab check-update

Check for the latest glab release.

```
glab check-update
```

No flags. Compares the current version against the latest GitHub release. Alias: `glab update`.

---

## glab version

Print the installed glab version and the commit it was built from.

```
glab version
```

Include this output when reporting a bug.

---

## glab whatsnew

Show release notes for glab versions.

| Flag | Description |
|---|---|
| `--latest` | Show release notes for the latest published release only. |
| `--since` | Show release notes for every release newer than the given version. |

With no arguments, shows release notes for every release published since the last time `whatsnew` ran or the post-upgrade banner was seen, capped at the 10 most recent releases. Pass a version argument to view notes for a specific release.

Examples:
```sh
glab whatsnew
glab whatsnew --latest
glab whatsnew v1.85.0
glab whatsnew --since v1.80.0
```

Config key `show_whats_new` (default: `true`) controls the one-time post-upgrade banner pointing at this command.

