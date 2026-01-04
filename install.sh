#!/bin/bash
#
# Claude Code Global Settings Installer
# https://github.com/daniel-scrivner/claude-code-settings
#
# One-liner: curl -fsSL https://raw.githubusercontent.com/daniel-scrivner/claude-code-settings/main/install.sh | bash
#

set -e

REPO_URL="https://raw.githubusercontent.com/daniel-scrivner/claude-code-settings/main"
CLAUDE_DIR="$HOME/.claude"

echo "🤖 Claude Code Settings Installer"
echo "=================================="
echo ""

# Create .claude directory if it doesn't exist
if [ ! -d "$CLAUDE_DIR" ]; then
    echo "Creating $CLAUDE_DIR directory..."
    mkdir -p "$CLAUDE_DIR"
fi

# Backup existing settings if they exist
if [ -f "$CLAUDE_DIR/settings.json" ]; then
    BACKUP_FILE="$CLAUDE_DIR/settings.json.backup.$(date +%Y%m%d_%H%M%S)"
    echo "Backing up existing settings to $BACKUP_FILE"
    cp "$CLAUDE_DIR/settings.json" "$BACKUP_FILE"
fi

if [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
    BACKUP_FILE="$CLAUDE_DIR/CLAUDE.md.backup.$(date +%Y%m%d_%H%M%S)"
    echo "Backing up existing CLAUDE.md to $BACKUP_FILE"
    cp "$CLAUDE_DIR/CLAUDE.md" "$BACKUP_FILE"
fi

# Download settings.json
echo "Downloading settings.json..."
curl -fsSL "$REPO_URL/settings.json" -o "$CLAUDE_DIR/settings.json"

# Download CLAUDE.md
echo "Downloading CLAUDE.md..."
curl -fsSL "$REPO_URL/CLAUDE.md" -o "$CLAUDE_DIR/CLAUDE.md"

echo ""
echo "✅ Installation complete!"
echo ""
echo "Files installed:"
echo "  - $CLAUDE_DIR/settings.json (189 commands allowlisted)"
echo "  - $CLAUDE_DIR/CLAUDE.md (global instructions)"
echo ""
echo "⚠️  These settings grant extensive permissions. Review them before use:"
echo "    cat $CLAUDE_DIR/settings.json"
echo ""
echo "To revert, restore your backup files or delete the installed files."
