```
╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║    ██████╗██╗      █████╗ ██╗   ██╗██████╗ ███████╗                          ║
║   ██╔════╝██║     ██╔══██╗██║   ██║██╔══██╗██╔════╝                          ║
║   ██║     ██║     ███████║██║   ██║██║  ██║█████╗                            ║
║   ██║     ██║     ██╔══██║██║   ██║██║  ██║██╔══╝                            ║
║   ╚██████╗███████╗██║  ██║╚██████╔╝██████╔╝███████╗                          ║
║    ╚═════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝                          ║
║                                                                              ║
║    ██████╗ ██████╗ ██████╗ ███████╗                                          ║
║   ██╔════╝██╔═══██╗██╔══██╗██╔════╝                                          ║
║   ██║     ██║   ██║██║  ██║█████╗                                            ║
║   ██║     ██║   ██║██║  ██║██╔══╝                                            ║
║   ╚██████╗╚██████╔╝██████╔╝███████╗                                          ║
║    ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝                                          ║
║                                                                              ║
║   ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗           ║
║   ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝           ║
║   ███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗           ║
║   ╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║           ║
║   ███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║           ║
║   ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝           ║
║                                                                              ║
╠══════════════════════════════════════════════════════════════════════════════╣
║  MAXIMAL PERMISSIONS FOR AUTONOMOUS OPERATION                                ║
║  ────────────────────────────────────────────                                ║
║  STATUS: OPERATIONAL │ VERSION: 1.0 │ LICENSE: MIT                           ║
╚══════════════════════════════════════════════════════════════════════════════╝
```

---

## SYSTEM OVERVIEW

```
┌────────────────────────────────────────────────────────────────────────────┐
│                                                                            │
│  Global settings for Claude Code—Anthropic's official CLI for Claude.     │
│  Full autonomous command execution with sensible guardrails.              │
│                                                                            │
│  ⚠  USE AT YOUR OWN RISK                                                   │
│                                                                            │
└────────────────────────────────────────────────────────────────────────────┘
```

---

## DESIGN PHILOSOPHY

```
┌────────────────────────────────────────────────────────────────────────────┐
│                                                                            │
│  Claude Code operates best with maximum autonomy. This configuration      │
│  leverages the three-tier permission system:                              │
│                                                                            │
│  ┌──────────────────────────────────────────────────────────────────────┐  │
│  │                                                                      │  │
│  │   ╔═══════════╗    ┌───────────┐    ┌───────────┐                    │  │
│  │   ║   ALLOW   ║    │    ASK    │    │   DENY    │                    │  │
│  │   ╠═══════════╣    ├───────────┤    ├───────────┤                    │  │
│  │   ║ Broad     ║    │  Empty    │    │  Block    │                    │  │
│  │   ║ patterns  ║    │  (full    │    │  dangerous│                    │  │
│  │   ║ for full  ║    │  trust    │    │  ops      │                    │  │
│  │   ║ autonomy  ║    │  mode)    │    │           │                    │  │
│  │   ╚═══════════╝    └───────────┘    └───────────┘                    │  │
│  │                                                                      │  │
│  │   NO PROMPTS        NOTHING           SECRETS &                      │  │
│  │                     REQUIRES          DESTRUCTIVE                    │  │
│  │                     CONFIRMATION      COMMANDS                       │  │
│  │                                                                      │  │
│  └──────────────────────────────────────────────────────────────────────┘  │
│                                                                            │
└────────────────────────────────────────────────────────────────────────────┘
```

---

## MANIFEST

```
┌────────────────────────────────────────────────────────────────────────────┐
│  FILE                    PURPOSE                                           │
├────────────────────────────────────────────────────────────────────────────┤
│                                                                            │
│  settings.json           Permission configuration (allow/ask/deny tiers)   │
│  CLAUDE.md               Global instructions for Claude                    │
│  install.sh              One-line installer script                         │
│                                                                            │
└────────────────────────────────────────────────────────────────────────────┘
```

---

## QUICK INSTALL

```bash
curl -fsSL https://raw.githubusercontent.com/daniel-scrivner/claude-code-settings/main/install.sh | bash
```

**Manual installation:**

```bash
# Backup existing settings
cp ~/.claude/settings.json ~/.claude/settings.json.backup

# Copy new settings
cp settings.json ~/.claude/settings.json
cp CLAUDE.md ~/.claude/CLAUDE.md
```

---

## PERMISSION ARCHITECTURE

### CONFIGURATION

```json
{
  "permissions": {
    "allow": [
      "Bash",
      "Read",
      "Edit",
      "Write",
      "WebFetch",
      "WebSearch",
      "mcp__github__*",
      "mcp__slack__*",
      "mcp__linear__*",
      "mcp__asana__*",
      "mcp__notion__*",
      "mcp__craft__*",
      "mcp__ghost__*",
      "mcp__readwise__*",
      "mcp__composer__*"
    ],
    "ask": [],
    "deny": [
      "Read(.env*)",
      "Read(**/secrets*)",
      "Read(**/*credentials*)",
      "Read(**/*.pem)",
      "Read(**/*.key)",
      "Bash(rm -rf /:*)",
      "Bash(rm -rf ~:*)",
      "Bash(chmod -R 777 /:*)",
      "Bash(mkfs:*)",
      "Bash(dd if=:*)"
    ]
  }
}
```

---

### ALLOW TIER — FULL AUTONOMY

```
┌────────────────────────────────────────────────────────────────────────────┐
│  PATTERN              SCOPE                                                │
├────────────────────────────────────────────────────────────────────────────┤
│                                                                            │
│  Bash                 All shell commands including complex pipelines       │
│                       with &&, ||, 2>&1, etc.                              │
│                                                                            │
│  Read                 Read any file (except denied patterns)               │
│  Edit                 Edit any file on the system                          │
│  Write                Create/overwrite any file on the system              │
│                                                                            │
│  WebFetch             Fetch any URL from the web                           │
│  WebSearch            Perform web searches                                 │
│                                                                            │
│  mcp__github__*       All GitHub MCP operations                            │
│  mcp__slack__*        All Slack MCP operations                             │
│  mcp__linear__*       All Linear MCP operations                            │
│  mcp__asana__*        All Asana MCP operations                             │
│  mcp__notion__*       All Notion MCP operations                            │
│  mcp__craft__*        All Craft MCP operations                             │
│  mcp__ghost__*        All Ghost MCP operations                             │
│  mcp__readwise__*     All Readwise MCP operations                          │
│  mcp__composer__*     All Composer MCP operations                          │
│                                                                            │
└────────────────────────────────────────────────────────────────────────────┘
```

---

### ASK TIER — CONFIRMATION REQUIRED

```
┌────────────────────────────────────────────────────────────────────────────┐
│                                                                            │
│  EMPTY — Nothing requires confirmation in this configuration.             │
│                                                                            │
└────────────────────────────────────────────────────────────────────────────┘
```

---

### DENY TIER — ALWAYS BLOCKED

```
┌────────────────────────────────────────────────────────────────────────────┐
│  PATTERN                        PREVENTS                                   │
├────────────────────────────────────────────────────────────────────────────┤
│                                                                            │
│  ┌──────────────────────────────────────────────────────────────────────┐  │
│  │  SECRETS PROTECTION                                                  │  │
│  │  ══════════════════                                                  │  │
│  └──────────────────────────────────────────────────────────────────────┘  │
│                                                                            │
│  Read(.env*)                    Reading environment files with secrets     │
│  Read(**/secrets*)              Reading any secrets directories            │
│  Read(**/*credentials*)         Reading credential files                   │
│  Read(**/*.pem)                 Reading PEM certificates/keys              │
│  Read(**/*.key)                 Reading private key files                  │
│                                                                            │
│  ┌──────────────────────────────────────────────────────────────────────┐  │
│  │  DESTRUCTIVE OPERATIONS                                              │  │
│  │  ══════════════════════                                              │  │
│  └──────────────────────────────────────────────────────────────────────┘  │
│                                                                            │
│  Bash(rm -rf /:*)               Recursive deletion from root               │
│  Bash(rm -rf ~:*)               Recursive deletion of home directory       │
│  Bash(chmod -R 777 /:*)         Making entire filesystem world-writable    │
│  Bash(mkfs:*)                   Formatting filesystems                     │
│  Bash(dd if=:*)                 Raw disk operations                        │
│                                                                            │
│  ┌──────────────────────────────────────────────────────────────────────┐  │
│  │  AGENT CONTROL (v2.1.0+) — Optional, not in default config           │  │
│  │  ══════════════════════════════════════════════════════              │  │
│  └──────────────────────────────────────────────────────────────────────┘  │
│                                                                            │
│  Task(AgentName)                Disable specific agent (if desired)        │
│                                                                            │
│  Example: Add "Task(Explore)" to deny if you want to prevent              │
│  the Explore agent from running autonomously                              │
│                                                                            │
└────────────────────────────────────────────────────────────────────────────┘
```

---

## SYNTAX REFERENCE

```
┌────────────────────────────────────────────────────────────────────────────┐
│                                                                            │
│  PATTERN                    MEANING                             STATUS     │
│  ───────────────────────────────────────────────────────────────────────   │
│                                                                            │
│  Bash                       Allows ALL bash commands            ✓ VALID    │
│  Bash(command:*)            Allows specific command prefix      ✓ VALID    │
│  Bash(*)                    Does not work                       ✗ INVALID  │
│                                                                            │
│  Read(.env*)                Blocks files starting with .env     ✓ VALID    │
│  Read(**/pattern)           Blocks pattern in any directory     ✓ VALID    │
│                                                                            │
│  NOTE: Use colon before * for command prefixes                             │
│                                                                            │
├────────────────────────────────────────────────────────────────────────────┤
│                                                                            │
│  NEW IN v2.1.0: WILDCARD PATTERNS                                          │
│  ═══════════════════════════════════                                       │
│                                                                            │
│  Bash(npm *)                Allows npm followed by anything     ✓ VALID    │
│  Bash(* install)            Allows anything ending in install   ✓ VALID    │
│  Bash(git * main)           Allows git <anything> main          ✓ VALID    │
│                                                                            │
│  NOTE: Wildcards (*) can now appear at any position in Bash rules          │
│                                                                            │
├────────────────────────────────────────────────────────────────────────────┤
│                                                                            │
│  NEW IN v2.1.0: AGENT DENIAL                                               │
│  ═══════════════════════════                                               │
│                                                                            │
│  Task(AgentName)            Disables a specific agent           ✓ VALID    │
│  Task(Explore)              Disables the Explore agent          ✓ VALID    │
│  Task(Plan)                 Disables the Plan agent             ✓ VALID    │
│                                                                            │
│  NOTE: Use in deny array to prevent specific agents from running           │
│                                                                            │
└────────────────────────────────────────────────────────────────────────────┘
```

---

## ALTERNATIVE: SKIP ALL PERMISSIONS

```
┌────────────────────────────────────────────────────────────────────────────┐
│                                                                            │
│  For maximum autonomy without any configuration:                          │
│                                                                            │
│  ┌──────────────────────────────────────────────────────────────────────┐  │
│  │                                                                      │  │
│  │   $ claude --dangerously-skip-permissions                            │  │
│  │                                                                      │  │
│  └──────────────────────────────────────────────────────────────────────┘  │
│                                                                            │
│  ⚠  CAUTION: No guardrails. Full system access.                           │
│                                                                            │
└────────────────────────────────────────────────────────────────────────────┘
```

---

## SECURITY CONSIDERATIONS

```
┌────────────────────────────────────────────────────────────────────────────┐
│                                                                            │
│  This configuration grants Claude NEAR-COMPLETE ACCESS to your system     │
│  with sensible guardrails:                                                │
│                                                                            │
│  ┌──────────────────────────────────────────────────────────────────────┐  │
│  │                                                                      │  │
│  │  [1]  UNDERSTAND THE RISKS                                           │  │
│  │       Claude can execute most commands and read/write most files     │  │
│  │                                                                      │  │
│  │  [2]  SECRETS ARE PROTECTED                                          │  │
│  │       Environment files, credentials, and keys are blocked           │  │
│  │                                                                      │  │
│  │  [3]  DESTRUCTIVE COMMANDS BLOCKED                                   │  │
│  │       Cannot format drives or delete root/home                       │  │
│  │                                                                      │  │
│  │  [4]  USE IN TRUSTED ENVIRONMENTS                                    │  │
│  │       Don't use on shared systems or with untrusted projects         │  │
│  │                                                                      │  │
│  │  [5]  REVIEW CLAUDE'S ACTIONS                                        │  │
│  │       Even with autonomy, review what Claude does                    │  │
│  │                                                                      │  │
│  │  [6]  BACKUP IMPORTANT DATA                                          │  │
│  │       Always have backups                                            │  │
│  │                                                                      │  │
│  └──────────────────────────────────────────────────────────────────────┘  │
│                                                                            │
└────────────────────────────────────────────────────────────────────────────┘
```

---

## CLAUDE.MD GLOBAL INSTRUCTIONS

```
┌────────────────────────────────────────────────────────────────────────────┐
│                                                                            │
│  The included CLAUDE.md provides global instructions for all projects:    │
│                                                                            │
│  • Preference for autonomous operation                                    │
│  • PR workflow guidelines                                                 │
│  • Bot review monitoring                                                  │
│                                                                            │
│  Customize this file to add your own preferences.                         │
│                                                                            │
└────────────────────────────────────────────────────────────────────────────┘
```

---

## CONTRIBUTING

```
┌────────────────────────────────────────────────────────────────────────────┐
│                                                                            │
│  PRs welcome for:                                                         │
│                                                                            │
│  • Additional deny patterns for safety                                    │
│  • Additional MCP server patterns                                         │
│  • Documentation improvements                                             │
│  • Platform-specific variations (Linux, Windows WSL)                      │
│                                                                            │
└────────────────────────────────────────────────────────────────────────────┘
```

---

## RELATED

```
┌────────────────────────────────────────────────────────────────────────────┐
│                                                                            │
│  • Claude Code Documentation  →  docs.anthropic.com/en/docs/claude-code   │
│  • Claude Code GitHub         →  github.com/anthropics/claude-code        │
│                                                                            │
└────────────────────────────────────────────────────────────────────────────┘
```
