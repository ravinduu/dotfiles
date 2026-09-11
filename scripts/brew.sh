#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

if [[ "$PLATFORM" != "macos" ]]; then
    echo "Skipping Homebrew installation on $PLATFORM"
    exit 0
fi

if command -v brew >/dev/null 2>&1; then
    echo "Homebrew is already installed."
else
    echo "Installing Homebrew..."

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Homebrew setup complete."