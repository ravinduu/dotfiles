#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "========================================"
echo "       DOTFILES INSTALLER"
echo "========================================"

echo ""
echo "Running Homebrew setup..."
"$DOTFILES_DIR/scripts/brew.sh"

echo ""
echo "Running Git setup..."
"$DOTFILES_DIR/scripts/git.sh"

echo ""
echo "Running VS Code setup..."
"$DOTFILES_DIR/scripts/vscode.sh"

echo ""
echo "========================================"
echo "       INSTALLATION COMPLETE"
echo "========================================"