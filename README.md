# Claude Code Global Settings

> Maximal permissions configuration for [Claude Code](https://claude.ai/code) - Anthropic's official CLI for Claude.

This repository contains my personal Claude Code global settings that grant near-full autonomous command execution. Use at your own risk.

## Philosophy

Claude Code is most productive when it can operate autonomously. This configuration allows Claude to execute commands without confirmation prompts, enabling:

- Seamless git workflows (commit, push, PR creation)
- Package management across ecosystems (npm, pip, cargo, etc.)
- File operations and system inspection
- Cloud CLI tools (AWS, GCP, Azure, Kubernetes)
- Database clients and development servers
- Web searches and documentation fetches
- MCP server integrations (GitHub, Slack, Linear, Notion, etc.)

## What's Included

| File | Purpose |
|------|---------|
| `settings.json` | Permission allowlist (271 Bash commands, 97 WebFetch domains, 8 MCP servers) |
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

## Command Categories

### Development Tools (63 commands)

| Category | Commands |
|----------|----------|
| Version Control | `git`, `gh` |
| JavaScript/Node | `node`, `npm`, `npx`, `pnpm`, `bun`, `yarn`, `deno` |
| Python | `python`, `pip`, `uv` |
| Rust | `cargo` |
| Go | `go` |
| Ruby | `ruby`, `gem` |
| Java/JVM | `java`, `javac`, `gradle`, `mvn` |
| .NET | `dotnet` |
| Swift | `swift`, `swiftc` |
| PHP | `php`, `composer` |
| Other | `perl`, `lua`, `julia`, `make` |

### Cloud & Infrastructure (23 commands)

| Category | Commands |
|----------|----------|
| Cloud CLIs | `aws`, `gcloud`, `az` |
| Containers | `docker`, `docker-compose`, `podman`, `colima`, `lima` |
| Kubernetes | `kubectl`, `helm` |
| IaC | `terraform`, `pulumi` |
| PaaS | `vercel`, `netlify`, `railway`, `heroku`, `flyctl`, `wrangler` |
| VMs | `multipass`, `vagrant` |

### Database Clients (5 commands)

`psql`, `mysql`, `sqlite3`, `redis-cli`, `mongosh`

### File Operations (27 commands)

`ls`, `cat`, `head`, `tail`, `grep`, `find`, `mkdir`, `rm`, `mv`, `cp`, `touch`, `chmod`, `chown`, `echo`, `sed`, `awk`, `cut`, `tr`, `paste`, `join`, `diff`, `tar`, `zip`, `unzip`, `gzip`, `gunzip`, `rsync`

### System & Network (45 commands)

| Category | Commands |
|----------|----------|
| Process | `ps`, `top`, `htop`, `kill`, `pkill`, `pgrep`, `lsof` |
| Network | `curl`, `wget`, `ssh`, `scp`, `ping`, `traceroute`, `dig`, `nslookup`, `host`, `whois`, `netstat`, `nc`, `nmap`, `ifconfig`, `ip` |
| System Info | `uname`, `hostname`, `whoami`, `id`, `df`, `du`, `stat`, `file` |
| Services | `systemctl`, `launchctl` |
| Power | `reboot`, `shutdown` |

### Editors & Tools (26 commands)

| Category | Commands |
|----------|----------|
| Editors | `vim`, `nvim`, `nano`, `code`, `cursor`, `subl` |
| Modern CLI | `bat`, `exa`, `eza`, `delta`, `rg`, `fd`, `fzf`, `ag`, `jq`, `yq`, `tree` |
| Docs | `man`, `info`, `tldr`, `apropos` |
| macOS | `open`, `pbcopy`, `pbpaste`, `brew` |

### Script Execution

| Pattern | Purpose |
|---------|---------|
| `./node_modules/.bin/*` | Local npm bin scripts (eslint, tsc, etc.) |
| `./*` | Any relative path script execution |

### Web Access (97 domains)

| Category | Domains |
|----------|---------|
| Core | GitHub, MDN, Node.js, npm, Anthropic, OpenAI |
| Languages | Python, Rust, Go, TypeScript docs |
| Frameworks | React, Next.js, Vue, Svelte, Angular, Astro, Remix, Nuxt |
| Backend | Express, FastAPI, Flask, Django |
| Data | Prisma, Drizzle, Zod, tRPC, TanStack |
| Testing | Vitest, Jest, Playwright, Cypress |
| Build | esbuild, Vite, Turbo, Nx, pnpm, Yarn |
| Databases | Supabase, Firebase, PlanetScale, Neon, Upstash, Redis, MongoDB, PostgreSQL |
| Auth/Payments | Stripe, Clerk, Auth.js, Lucia |
| UI | shadcn/ui, Radix, Headless UI, Mantine, Chakra, MUI, Ant Design, Framer |
| Cloud | AWS, GCP, Azure, Docker, Kubernetes, Terraform |
| Services | Linear, Notion, Asana, Slack, Craft, Ghost, Readwise |
| Reference | Stack Overflow, Wikipedia |

### MCP Server Integrations (8 servers)

| Server | Purpose |
|--------|---------|
| `mcp__github__*` | GitHub API operations |
| `mcp__slack__*` | Slack messaging |
| `mcp__linear__*` | Linear issue tracking |
| `mcp__asana__*` | Asana project management |
| `mcp__notion__*` | Notion workspace |
| `mcp__craft__*` | Craft documents |
| `mcp__ghost__*` | Ghost CMS |
| `mcp__readwise__*` | Readwise highlights |

## Commands NOT Included

These commands are intentionally omitted due to high risk of irreversible damage:

| Command | Risk |
|---------|------|
| `dd` | Can overwrite entire disks |
| `mkfs` / `fdisk` | Filesystem/partition destruction |
| `:(){ :\|:& };:` | Fork bombs |
| `> /dev/sda` | Direct disk writes |
| `chmod -R 777 /` | Recursive permission disasters |

## Customization

### Adding Commands

Edit `~/.claude/settings.json`:

```json
{
  "permissions": {
    "allow": [
      "Bash(your-command *)",
      "Bash(another-command)"
    ]
  }
}
```

**Pattern syntax:**
- `Bash(command *)` - Allow command with any arguments
- `Bash(command)` - Allow command with no arguments
- `Bash(command --flag *)` - Allow only with specific flag

### Full Autonomy Mode

For completely hands-off operation (use with extreme caution):

```bash
claude --dangerously-skip-permissions
```

## Security Considerations

This configuration trades security for productivity. Before using:

1. **Understand the risks** - These commands can modify/delete files, access networks, and manage system services
2. **Use in trusted environments** - Don't use on shared systems or with untrusted projects
3. **Review Claude's actions** - Even with autonomy, review what Claude does
4. **Backup important data** - Always have backups before letting Claude operate freely

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
- Additional safe commands to include
- Documentation improvements
- Platform-specific variations (Linux, Windows WSL)

## Related

- [Claude Code Documentation](https://docs.anthropic.com/en/docs/claude-code)
- [Claude Code GitHub](https://github.com/anthropics/claude-code)
