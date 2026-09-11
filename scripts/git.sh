#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

if command -v git >/dev/null 2>&1; then
    echo "Git is already installed:"
    git --version
    exit 0
fi

echo "Git is not installed. Installing..."

case "$PLATFORM" in

    macos)
        brew install git
        ;;

    linux)
        if command -v apt >/dev/null 2>&1; then
            sudo apt update
            sudo apt install -y git
        else
            echo "Unsupported Linux package manager."
            exit 1
        fi
        ;;

esac

echo "Git setup complete."