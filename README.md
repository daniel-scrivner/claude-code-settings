# Claude Code Global Settings

> Maximal permissions configuration for [Claude Code](https://claude.ai/code) - Anthropic's official CLI for Claude.

This repository contains my personal Claude Code global settings that grant full autonomous command execution. Use at your own risk.

## Philosophy

Claude Code is most productive when it can operate autonomously. This configuration uses broad wildcard patterns to eliminate permission prompts entirely, enabling:

- Any shell command execution (`Bash(*)`)
- File read/edit/write anywhere (`Read`, `Edit`, `Write`)
- Web access to any URL (`WebFetch`, `WebSearch`)
- All MCP server operations (`mcp__*__*`)

## What's Included

| File | Purpose |
|------|---------|
| `settings.json` | Permission allowlist (15 broad patterns for full autonomy) |
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

### Simple & Complete

The new configuration uses just 15 patterns for full autonomy:

```json
{
  "permissions": {
    "allow": [
      "Bash(*)",
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
    ]
  }
}
```

### What Each Pattern Covers

| Pattern | Scope |
|---------|-------|
| `Bash(*)` | All shell commands including complex pipelines with `&&`, `\|\|`, `2>&1`, etc. |
| `Read` | Read any file on the system |
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

### Why Broad Patterns?

The previous approach used granular patterns like `Bash(git *)`, but these failed to match commands with shell operators:

```bash
# This was NOT matched by "Bash(git *)"
git checkout feat/branch 2>&1 || git fetch origin feat/branch && git checkout feat/branch
```

Using `Bash(*)` matches everything, eliminating edge cases.

## Alternative: Dangerously Skip Permissions

For maximum autonomy without any configuration:

```bash
claude --dangerously-skip-permissions
```

## Security Considerations

This configuration grants Claude **complete access** to your system. Before using:

1. **Understand the risks** - Claude can execute any command, read/write any file
2. **Use in trusted environments** - Don't use on shared systems or with untrusted projects
3. **Review Claude's actions** - Even with autonomy, review what Claude does
4. **Backup important data** - Always have backups

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
- Additional MCP server patterns
- Documentation improvements
- Platform-specific variations (Linux, Windows WSL)

## Related

- [Claude Code Documentation](https://docs.anthropic.com/en/docs/claude-code)
- [Claude Code GitHub](https://github.com/anthropics/claude-code)
