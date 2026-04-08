---
name: glab-ci
description: View, manage, and retry GitLab CI/CD pipelines and jobs using the glab CLI. Use when the user wants to check pipeline status, trace job logs, or trigger a pipeline.
user-invocable: true
argument-hint: "[status|list|view|retry|trace|cancel|run] [options]"
model: haiku
effort: low
---

## Task

Work with GitLab CI/CD pipelines and jobs via `glab`.

## Steps

### 1. Determine the action

Parse `$ARGUMENTS` for the action and any details (pipeline ID, job name, branch, etc.). If unclear, ask the user.

---

### 2. Execute

#### Check the latest pipeline status

```bash
glab ci status
```

Shows the status of the most recent pipeline on the current branch.

#### List pipelines

```bash
glab ci list
```

Filters:
- `--branch <branch>` — filter by branch
- `--status running|pending|success|failed|canceled`
- `--limit <N>` — how many to show

#### View a pipeline (interactive job browser)

```bash
glab ci view
glab ci view <pipeline-id>
```

Opens an interactive TUI to browse jobs and their statuses.

#### Trace job logs (stream output)

```bash
glab ci trace
```

Streams the log of a running or failed job. Prompts to pick a job if multiple are running.

#### Retry a failed pipeline

```bash
glab ci retry <pipeline-id>
```

Retries all failed jobs in the pipeline.

#### Cancel a running pipeline

```bash
glab ci cancel <pipeline-id>
```

#### Run (trigger) a new pipeline

```bash
glab ci run
```

Flags:
- `--branch <branch>` — run on a specific branch
- `--variables-env "KEY=value"` — pass CI variables

#### Lint a `.gitlab-ci.yml` file

```bash
glab ci lint
glab ci lint <path/to/.gitlab-ci.yml>
```

---

### 3. Workflow tip

If the user asks "why did my pipeline fail", run:
1. `glab ci status` to find the failing pipeline
2. `glab ci view` to identify the failing job
3. `glab ci trace` to stream the job log

### 4. Output

Show the command output. For failures, highlight the failed job name and the last few lines of its log.
