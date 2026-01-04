# Global Claude Code Configuration

## Permissions Setup

Autonomous command execution is configured in `~/.claude/settings.json`.

### Allowlisted Commands

The following command patterns run without permission prompts:

| Category | Commands |
|----------|----------|
| Version Control | `git *`, `gh *` |
| Package Managers | `bun *`, `pnpm *`, `npm *`, `npx *` |
| Runtimes | `node *`, `python *`, `pip *`, `uv *` |
| Build Tools | `cargo *`, `make *`, `docker *` |
| File Operations | `ls *`, `cat *`, `head *`, `tail *`, `grep *`, `find *`, `mkdir *`, `rm *`, `mv *`, `cp *`, `touch *`, `chmod *`, `echo *`, `which *`, `pwd`, `cd *` |

### Adding New Commands

Edit `~/.claude/settings.json` and add to the `permissions.allow` array:

```json
"Bash(your-command *)"
```

### Full Autonomy Mode

For completely hands-off operation (use with caution):

```bash
claude --dangerously-skip-permissions
```

---

## User Preferences

- Prefer autonomous operation - minimize permission prompts
- Follow PR checklists in project CLAUDE.md files
- Monitor bot reviews and address feedback without prompting
