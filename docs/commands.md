# glab command list

Quick reference for all available `glab` commands. For flags and examples, see [reference.md](reference.md).

`*` = experimental

## glab mr

| Command | Description |
|---------|-------------|
| `glab mr approve` | Approve one or more MRs |
| `glab mr approvers` | List eligible approvers for an MR |
| `glab mr checkout` | Check out an open MR locally |
| `glab mr close` | Close an MR |
| `glab mr create` | Create a new MR |
| `glab mr delete` | Delete an MR |
| `glab mr diff` | Show diff of an MR |
| `glab mr for` | Create an MR for an issue (deprecated) |
| `glab mr issues` | List issues related to an MR |
| `glab mr list` | List MRs |
| `glab mr merge` | Merge an MR |
| `glab mr note` | Add a comment or resolve a discussion |
| `glab mr rebase` | Rebase source branch against target |
| `glab mr reopen` | Reopen a closed MR |
| `glab mr revoke` | Revoke your approval |
| `glab mr subscribe` | Subscribe to MR notifications |
| `glab mr todo` | Add MR to your to-do list |
| `glab mr unsubscribe` | Unsubscribe from MR notifications |
| `glab mr update` | Update MR fields |
| `glab mr view` | Display MR details |

## glab issue

| Command | Description |
|---------|-------------|
| `glab issue board create` | Create a project issue board |
| `glab issue board view` | View project issue board |
| `glab issue close` | Close an issue |
| `glab issue create` | Create an issue |
| `glab issue delete` | Delete an issue |
| `glab issue list` | List issues |
| `glab issue note` | Comment on an issue |
| `glab issue reopen` | Reopen a closed issue |
| `glab issue subscribe` | Subscribe to issue notifications |
| `glab issue unsubscribe` | Unsubscribe from issue notifications |
| `glab issue update` | Update issue fields |
| `glab issue view` | Display issue details |

## glab ci

| Command | Description |
|---------|-------------|
| `glab ci artifact` | Download artifacts from last pipeline (deprecated) |
| `glab ci cancel job` | Cancel one or more CI jobs |
| `glab ci cancel pipeline` | Cancel one or more pipelines |
| `glab ci config compile` | View fully expanded CI configuration |
| `glab ci delete` | Delete pipelines |
| `glab ci get` | Get pipeline JSON on a branch |
| `glab ci lint` | Validate `.gitlab-ci.yml` |
| `glab ci list` | List pipelines |
| `glab ci retry` | Retry a CI job |
| `glab ci run` | Create or run a new pipeline |
| `glab ci run-trig` | Run a pipeline using a trigger token |
| `glab ci status` | View pipeline status on a branch |
| `glab ci trace` | Stream a job log in real time |
| `glab ci trigger` | Trigger a manual job |
| `glab ci view` | Interactive TUI to view and manage jobs |

## glab job

| Command | Description |
|---------|-------------|
| `glab job artifact` | Download artifacts from the most recent pipeline |

## glab release

| Command | Description |
|---------|-------------|
| `glab release create` | Create or update a release |
| `glab release delete` | Delete a release |
| `glab release download` | Download release assets |
| `glab release list` | List releases |
| `glab release upload` | Upload asset files to a release |
| `glab release view` | View release details |

## glab repo

| Command | Description |
|---------|-------------|
| `glab repo archive` | Download an archive of the repository |
| `glab repo clone` | Clone a repository |
| `glab repo contributors` | List repository contributors |
| `glab repo create` | Create a new project |
| `glab repo delete` | Permanently delete a project |
| `glab repo fork` | Fork a repository |
| `glab repo list` | List repositories |
| `glab repo members add` | Add a member to the project |
| `glab repo members remove` | Remove a member from the project |
| `glab repo mirror` | Configure pull or push mirroring |
| `glab repo publish catalog` * | Publish CI/CD components to catalog |
| `glab repo search` | Search repositories by name |
| `glab repo transfer` | Transfer repository to a new namespace |
| `glab repo update` | Update project settings |
| `glab repo view` | View project description and README |

## glab incident

| Command | Description |
|---------|-------------|
| `glab incident close` | Close an incident |
| `glab incident list` | List project incidents |
| `glab incident note` | Comment on an incident |
| `glab incident reopen` | Reopen a resolved incident |
| `glab incident subscribe` | Subscribe to notifications |
| `glab incident unsubscribe` | Unsubscribe from notifications |
| `glab incident view` | View incident details |

## glab iteration

| Command | Description |
|---------|-------------|
| `glab iteration list` | List project or group iterations |

## glab label

| Command | Description |
|---------|-------------|
| `glab label create` | Create a label |
| `glab label delete` | Delete a label |
| `glab label edit` | Edit a label |
| `glab label get` | Get a single label by ID |
| `glab label list` | List labels |

## glab milestone

| Command | Description |
|---------|-------------|
| `glab milestone create` | Create a milestone |
| `glab milestone delete` | Delete a milestone |
| `glab milestone edit` | Edit a milestone |
| `glab milestone get` | Get a milestone by ID |
| `glab milestone list` | List milestones |

## glab schedule

| Command | Description |
|---------|-------------|
| `glab schedule create` | Create a new pipeline schedule |
| `glab schedule delete` | Delete a schedule |
| `glab schedule list` | List schedules |
| `glab schedule run` | Immediately run a scheduled pipeline |
| `glab schedule update` | Update a schedule |

## glab snippet

| Command | Description |
|---------|-------------|
| `glab snippet create` | Create a new snippet |

## glab variable

| Command | Description |
|---------|-------------|
| `glab variable delete` | Delete a variable |
| `glab variable export` | Export all variables |
| `glab variable get` | Get a variable value |
| `glab variable list` | List all variables |
| `glab variable set` | Create a new variable |
| `glab variable update` | Update an existing variable |

## glab work-items *

| Command | Description |
|---------|-------------|
| `glab work-items list` * | List work items in a project or group |

## glab runner

| Command | Description |
|---------|-------------|
| `glab runner assign` | Assign a runner to a project |
| `glab runner delete` | Permanently delete a runner |
| `glab runner list` | List runners |
| `glab runner unassign` | Unassign a runner from a project |
| `glab runner update` | Pause or unpause a runner |

## glab runner-controller *

| Command | Description |
|---------|-------------|
| `glab runner-controller create` * | Create a runner controller |
| `glab runner-controller delete` * | Delete a runner controller |
| `glab runner-controller list` * | List runner controllers |
| `glab runner-controller scope` * | Manage runner controller scopes |
| `glab runner-controller token` * | Manage runner controller tokens |
| `glab runner-controller update` * | Update a runner controller |

## glab securefile

| Command | Description |
|---------|-------------|
| `glab securefile create` | Upload a secure file |
| `glab securefile download` | Download a secure file |
| `glab securefile get` | Get secure file details |
| `glab securefile list` | List secure files |
| `glab securefile remove` | Delete a secure file |

## glab opentofu

| Command | Description |
|---------|-------------|
| `glab opentofu init` | Initialize OpenTofu with GitLab state backend |
| `glab opentofu state delete` | Delete a state or version |
| `glab opentofu state download` | Download state as JSON |
| `glab opentofu state list` | List states |
| `glab opentofu state lock` | Lock a state |
| `glab opentofu state unlock` | Unlock a state |

## glab cluster

| Command | Description |
|---------|-------------|
| `glab cluster agent bootstrap` | Bootstrap a Kubernetes agent |
| `glab cluster agent check_manifest_usage` * | Check agent configs for manifest usage |
| `glab cluster agent get-token` | Create a PAT to authenticate with an agent |
| `glab cluster agent list` | List agents in a project |
| `glab cluster agent token list` | List tokens for an agent |
| `glab cluster agent token revoke` | Revoke an agent token |
| `glab cluster agent update-kubeconfig` | Update kubeconfig for agent access |
| `glab cluster graph` * | Query Kubernetes object graph via agent |

## glab auth

| Command | Description |
|---------|-------------|
| `glab auth configure-docker` | Register glab as a Docker credential helper |
| `glab auth docker-helper` | Docker credential helper for GitLab registries |
| `glab auth dpop-gen` * | Generate a DPoP proof JWT |
| `glab auth login` | Authenticate with a GitLab instance |
| `glab auth logout` | Remove stored credentials |
| `glab auth status` | Display authentication status |

## glab config

| Command | Description |
|---------|-------------|
| `glab config edit` | Open config file in default editor |
| `glab config get` | Print a configuration value |
| `glab config set` | Set a configuration value |

## glab token

| Command | Description |
|---------|-------------|
| `glab token create` | Create a user, group, or project token |
| `glab token list` | List access tokens |
| `glab token revoke` | Revoke an access token |
| `glab token rotate` | Rotate an access token |

## glab ssh-key

| Command | Description |
|---------|-------------|
| `glab ssh-key add` | Upload an SSH key |
| `glab ssh-key delete` | Delete an SSH key |
| `glab ssh-key get` | Get a single SSH key |
| `glab ssh-key list` | List your SSH keys |

## glab gpg-key

| Command | Description |
|---------|-------------|
| `glab gpg-key add` | Upload a GPG key |
| `glab gpg-key delete` | Delete a GPG key |
| `glab gpg-key get` | Get a single GPG key |
| `glab gpg-key list` | List your GPG keys |

## glab deploy-key

| Command | Description |
|---------|-------------|
| `glab deploy-key add` | Upload a deploy key |
| `glab deploy-key delete` | Delete a deploy key |
| `glab deploy-key get` | Get a single deploy key |
| `glab deploy-key list` | List deploy keys for the project |

## glab user

| Command | Description |
|---------|-------------|
| `glab user events` | View events for the authenticated user |

## glab alias

| Command | Description |
|---------|-------------|
| `glab alias delete` | Delete an alias |
| `glab alias list` | List all aliases |
| `glab alias set` | Create an alias |

## glab api

| Command | Description |
|---------|-------------|
| `glab api <endpoint>` | Make authenticated REST or GraphQL requests |

## glab changelog

| Command | Description |
|---------|-------------|
| `glab changelog generate` | Generate a changelog for the project |

## glab duo

| Command | Description |
|---------|-------------|
| `glab duo ask` | Generate Git commands from natural language |
| `glab duo cli` * | Run the GitLab Duo CLI agent |

## glab mcp *

| Command | Description |
|---------|-------------|
| `glab mcp serve` * | Start an MCP server via stdio |

## glab stack *

| Command | Description |
|---------|-------------|
| `glab stack amend` * | Add changes to the current stacked diff |
| `glab stack create` * | Create a new stack |
| `glab stack first` * | Move to the first diff in the stack |
| `glab stack last` * | Move to the last diff in the stack |
| `glab stack list` * | List all entries in the stack |
| `glab stack move` * | Move to any selected stack entry |
| `glab stack next` * | Move to the next diff |
| `glab stack prev` * | Move to the previous diff |
| `glab stack reorder` * | Reorder MRs in the stack |
| `glab stack save` * | Save current changes as a new diff |
| `glab stack switch` * | Switch to a different stack |
| `glab stack sync` * | Push changes and sync all MRs |

## glab attestation *

| Command | Description |
|---------|-------------|
| `glab attestation verify` * | Verify the provenance of an artifact |

## glab completion

| Command | Description |
|---------|-------------|
| `glab completion` | Generate shell completion scripts |

## glab check-update

| Command | Description |
|---------|-------------|
| `glab check-update` | Check for the latest glab release |
