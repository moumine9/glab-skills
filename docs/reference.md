# glab CLI reference

Source: https://docs.gitlab.com/cli/

`glab` brings GitLab to your terminal. Works with GitLab.com, GitLab Dedicated, and self-managed instances.

---

## glab auth

Manage authentication state.

| Subcommand | Description |
|---|---|
| `glab auth login` | Log in to a GitLab instance (interactive OAuth or token) |
| `glab auth logout` | Remove stored credentials |
| `glab auth status` | Show current authentication state and token scopes |
| `glab auth configure-docker` | Configure Docker to use glab credentials |

**Common flags**
```
-h, --hostname   GitLab host (default: gitlab.com)
-t, --token      Personal access token (skips interactive login)
```

---

## glab mr

Create, view, and manage merge requests.

| Subcommand | Description |
|---|---|
| `glab mr create` | Open a new MR (use `--fill` to pull from commit messages) |
| `glab mr list` | List MRs (filter by `--state`, `--label`, `--author`) |
| `glab mr view [id]` | Show MR details |
| `glab mr approve [id]` | Approve an MR |
| `glab mr revoke [id]` | Revoke your approval |
| `glab mr approvers [id]` | List eligible approvers |
| `glab mr merge [id]` | Merge an MR |
| `glab mr checkout [id]` | Check out the MR branch locally |
| `glab mr diff [id]` | Show the diff |
| `glab mr close [id]` | Close without merging |
| `glab mr reopen [id]` | Reopen a closed MR |
| `glab mr note [id]` | Add a comment (`-m "text"`) |
| `glab mr update [id]` | Edit title, description, labels, assignees |
| `glab mr delete [id]` | Delete the MR |
| `glab mr rebase [id]` | Rebase on the target branch |
| `glab mr issues [id]` | List issues that will close when this MR merges |
| `glab mr subscribe [id]` | Subscribe to notifications |
| `glab mr unsubscribe [id]` | Unsubscribe |
| `glab mr todo [id]` | Add the MR to your to-do list |

**Common flags**
```
-R, --repo OWNER/REPO   Target a different repo
    --fill              Populate from last commit message
    --draft             Mark as draft
-l, --label             Set labels (comma-separated)
-a, --assignee          Set assignees
```

---

## glab issue

Work with GitLab issues.

| Subcommand | Description |
|---|---|
| `glab issue create` | Open a new issue |
| `glab issue list` | List issues (filter by `--state`, `--label`, `--author`, `--assignee`) |
| `glab issue view [id]` | Show issue details |
| `glab issue close [id]` | Close an issue |
| `glab issue reopen [id]` | Reopen a closed issue |
| `glab issue note [id]` | Add a comment (`-m "text"`) |
| `glab issue update [id]` | Edit title, description, labels, assignees, milestone |
| `glab issue delete [id]` | Delete the issue |
| `glab issue board` | View issue board for the project |
| `glab issue subscribe [id]` | Subscribe to notifications |
| `glab issue unsubscribe [id]` | Unsubscribe |

**Common flags**
```
-R, --repo OWNER/REPO   Target a different repo
-t, --title             Issue title
-d, --description       Issue description
-l, --label             Labels (comma-separated)
-a, --assignee          Assign to user
    --confidential      Mark as confidential
```

---

## glab ci

Work with GitLab CI/CD pipelines and jobs.

Aliases: `glab pipe`, `glab pipeline`

| Subcommand | Description |
|---|---|
| `glab ci list` | List recent pipelines |
| `glab ci status` | Show status of the latest pipeline on the current branch |
| `glab ci view` | Interactive pipeline viewer (shows stages and jobs) |
| `glab ci get` | Get a specific pipeline by ID |
| `glab ci run` | Trigger a new pipeline |
| `glab ci run-trig` | Trigger a pipeline using a trigger token |
| `glab ci trigger` | Trigger a pipeline on a specific branch |
| `glab ci retry` | Retry failed jobs in a pipeline |
| `glab ci cancel` | Cancel a running pipeline |
| `glab ci trace` | Stream live logs from a running job |
| `glab ci lint` | Validate a `.gitlab-ci.yml` file |
| `glab ci delete` | Delete a pipeline |
| `glab ci config` | View or manage CI/CD variables |

**Common flags**
```
-R, --repo OWNER/REPO   Target a different repo
-b, --branch            Target branch (default: current)
    --live              Refresh status in real time
```

---

## Environment variables

| Variable | Description |
|---|---|
| `GITLAB_HOST` / `GL_HOST` | GitLab instance URL (default: `https://gitlab.com`) |
| `GITLAB_TOKEN` | Personal access token — skips interactive prompts |
| `GLAB_CONFIG_DIR` | Override the global config directory |
| `DEBUG` | Set to `true` for verbose output including underlying Git commands |
| `NO_PROMPT` | Set to `true` to disable all interactive prompts |
| `GLAB_ENABLE_CI_AUTOLOGIN` | Set to `true` to use `CI_JOB_TOKEN` automatically inside GitLab CI jobs |

---

## Global flags (all commands)

```
-h, --help              Show help
-R, --repo OWNER/REPO   Target a specific repo instead of the current directory's remote
-v, --version           Show glab version
```

---

Full reference: https://docs.gitlab.com/cli/
