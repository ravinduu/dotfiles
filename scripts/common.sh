#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

OS="$(uname -s)"

case "$OS" in
    Darwin)
        PLATFORM="macos"
        ;;
    Linux)
        PLATFORM="linux"
        ;;
    *)
        echo "Unsupported operating system: $OS"
        exit 1
        ;;
esac


create_symlink() {
    local source="$1"
    local target="$2"

    if [[ -L "$target" ]]; then
        echo "Removing existing symlink: $target"
        rm "$target"

    elif [[ -e "$target" ]]; then
        echo "Backing up existing file: $target"
        mv "$target" "$target.backup"
    fi

    mkdir -p "$(dirname "$target")"

    echo "Linking:"
    echo "  $target -> $source"

    ln -s "$source" "$target"
}