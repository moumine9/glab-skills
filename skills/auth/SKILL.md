---
name: auth
description: Manage glab authentication — login, logout, or check status. Use when the user needs to authenticate with GitLab or when a previous command failed with an auth error.
user-invocable: true
disable-model-invocation: true
argument-hint: "[login|logout|status]"
model: haiku
effort: low
---

## Task

Handle GitLab CLI authentication.

## Steps

### 1. Determine the action

If `$ARGUMENTS` contains `login`, `logout`, or `status`, use it. Otherwise ask the user what they want to do.

---

### 2. Execute

#### Check status

```bash
glab auth status
```

This shows the authenticated user and GitLab host. If it prints "You are not logged in", the user needs to run login.

Use `glab auth status --all --output json` for machine-readable status across configured hosts; `--jq` can filter the JSON.

#### Login (OAuth — opens a browser)

```bash
glab auth login
```

Follow the prompts. The CLI will open a browser and wait for the OAuth callback. Once done, it stores the token in the OS keyring when one is available, otherwise as plaintext in the config file (`glab config path` prints its location).

Useful flags:
- `--web` — skip the login type prompt and go straight to browser/OAuth login
- `--device` — OAuth device flow for headless machines: prints a one-time code and URL to open on any device (GitLab 17.9+)
- `--insecure-storage` — store the token as plaintext in the config file instead of the keyring
- `--setup-git-credential-helper` — configure glab as the host's Git credential helper without a prompt

#### Login with a personal access token

```bash
glab auth login --stdin <<< "<your-token>"
```

Or interactively:

```bash
glab auth login
```

Select "Paste an authentication token" when prompted. Tokens are created at **GitLab > Preferences > Access Tokens** (scopes needed: `api`, `read_user`).

#### Login to a self-managed instance

```bash
glab auth login --hostname gitlab.example.com
```

OAuth on a self-managed instance needs an OAuth application client ID; the interactive login walks through the setup. A personal access token avoids that step.

Login can make the instance the default host for commands outside a repository. It does so automatically if the default is still `gitlab.com` and no credentials are stored for it; otherwise it asks, or prints the config command in non-interactive mode. CI and host environment overrides leave the default unchanged.

Environment tokens (`GITLAB_TOKEN`, `GITLAB_ACCESS_TOKEN`, `OAUTH_TOKEN`) override stored credentials only for hosts named by `GITLAB_HOST` or `GITLAB_REPO`, or present in the configuration file.

#### Logout

```bash
glab auth logout
```

---

### 3. Verify

After login, confirm it worked:

```bash
glab auth status
```

### 4. Output

Tell the user whether the action succeeded and which account is now active.

---

For a complete list of subcommands and flags, see [docs/reference.md](../../docs/reference.md#glab-auth).
