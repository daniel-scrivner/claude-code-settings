# Claude Code Global Settings

> Maximal permissions configuration for [Claude Code](https://claude.ai/code) - Anthropic's official CLI for Claude.

This repository contains my personal Claude Code global settings that grant full autonomous command execution while blocking dangerous operations. Use at your own risk.

## Philosophy

Claude Code is most productive when it can operate autonomously. This configuration uses Claude Code's three permission tiers:

- **Allow**: Broad patterns for full autonomy - no prompts
- **Ask**: Empty - nothing requires confirmation (full trust mode)
- **Deny**: Block dangerous operations - secrets and destructive commands

## What's Included

| File | Purpose |
|------|---------|
| `settings.json` | Permission configuration with allow/ask/deny tiers |
| `CLAUDE.md` | Global instructions for Claude |
| `install.sh` | One-line installer script |

## Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/daniel-scrivner/claude-code-settings/main/install.sh | bash
```

Or manually:

```bash
# Backup existing settings
cp ~/.claude/settings.json ~/.claude/settings.json.backup

# Copy new settings
cp settings.json ~/.claude/settings.json
cp CLAUDE.md ~/.claude/CLAUDE.md
```

## Permissions

### The Three Tiers

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

### Allow Tier - Full Autonomy

| Pattern | Scope |
|---------|-------|
| `Bash` | All shell commands including complex pipelines with `&&`, `\|\|`, `2>&1`, etc. |
| `Read` | Read any file on the system (except denied patterns) |
| `Edit` | Edit any file on the system |
| `Write` | Create/overwrite any file on the system |
| `WebFetch` | Fetch any URL from the web |
| `WebSearch` | Perform web searches |
| `mcp__github__*` | All GitHub MCP operations |
| `mcp__slack__*` | All Slack MCP operations |
| `mcp__linear__*` | All Linear MCP operations |
| `mcp__asana__*` | All Asana MCP operations |
| `mcp__notion__*` | All Notion MCP operations |
| `mcp__craft__*` | All Craft MCP operations |
| `mcp__ghost__*` | All Ghost MCP operations |
| `mcp__readwise__*` | All Readwise MCP operations |
| `mcp__composer__*` | All Composer MCP operations |

### Ask Tier - Confirmation Required

Empty. Nothing requires confirmation in this configuration.

### Deny Tier - Always Blocked

| Pattern | Prevents |
|---------|----------|
| `Read(.env*)` | Reading environment files with secrets |
| `Read(**/secrets*)` | Reading any secrets directories |
| `Read(**/*credentials*)` | Reading credential files |
| `Read(**/*.pem)` | Reading PEM certificates/keys |
| `Read(**/*.key)` | Reading private key files |
| `Bash(rm -rf /:*)` | Recursive deletion from root |
| `Bash(rm -rf ~:*)` | Recursive deletion of home directory |
| `Bash(chmod -R 777 /:*)` | Making entire filesystem world-writable |
| `Bash(mkfs:*)` | Formatting filesystems |
| `Bash(dd if=:*)` | Raw disk operations |

### Syntax Notes

- `Bash` - Allows ALL bash commands (recommended for full autonomy)
- `Bash(command:*)` - Allows specific command prefix (note the colon before `*`)
- `Bash(*)` - **Invalid syntax** (does not work)
- `Read(.env*)` - Blocks files starting with `.env`
- `Read(**/pattern)` - Blocks pattern in any directory

## Alternative: Dangerously Skip Permissions

For maximum autonomy without any configuration:

```bash
claude --dangerously-skip-permissions
```

## Security Considerations

This configuration grants Claude **near-complete access** to your system with sensible guardrails:

1. **Understand the risks** - Claude can execute most commands and read/write most files
2. **Secrets are protected** - Environment files, credentials, and keys are blocked
3. **Destructive commands blocked** - Cannot format drives or delete root/home
4. **Use in trusted environments** - Don't use on shared systems or with untrusted projects
5. **Review Claude's actions** - Even with autonomy, review what Claude does
6. **Backup important data** - Always have backups

## CLAUDE.md Global Instructions

The included `CLAUDE.md` provides global instructions that apply to all projects:

- Preference for autonomous operation
- PR workflow guidelines
- Bot review monitoring

You can customize this file to add your own preferences.

## License

MIT - Use at your own risk.

## Contributing

PRs welcome for:
- Additional deny patterns for safety
- Additional MCP server patterns
- Documentation improvements
- Platform-specific variations (Linux, Windows WSL)

## Related

- [Claude Code Documentation](https://docs.anthropic.com/en/docs/claude-code)
- [Claude Code GitHub](https://github.com/anthropics/claude-code)
