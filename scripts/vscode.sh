#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

echo "Setting up VS Code..."


# Install VS Code
if ! command -v code >/dev/null 2>&1; then

    case "$PLATFORM" in
        macos)
            echo "Installing VS Code..."
            brew install --cask visual-studio-code
            ;;
        linux)
            echo "VS Code installation for Linux is not implemented yet."
            exit 1
            ;;
    esac

else
    echo "VS Code is already installed."
fi


# VS Code configuration location
case "$PLATFORM" in
    macos)
        VSCODE_USER="$HOME/Library/Application Support/Code/User"
        ;;
    linux)
        VSCODE_USER="$HOME/.config/Code/User"
        ;;
esac


mkdir -p "$VSCODE_USER"


# Settings
create_symlink \
    "$DOTFILES_DIR/vscode/settings.json" \
    "$VSCODE_USER/settings.json"


# Keybindings
if [[ -f "$DOTFILES_DIR/vscode/keybindings.json" ]]; then
    create_symlink \
        "$DOTFILES_DIR/vscode/keybindings.json" \
        "$VSCODE_USER/keybindings.json"
fi


echo "VS Code setup complete."