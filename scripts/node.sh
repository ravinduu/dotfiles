#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

if ! command -v curl >/dev/null 2>&1; then
    echo "curl is required to install nvm. Please install curl and try again."
    exit 1
fi

export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"

if [[ ! -s "$NVM_DIR/nvm.sh" ]]; then
    echo "Installing nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
fi

if [[ ! -s "$NVM_DIR/nvm.sh" ]]; then
    echo "nvm installation did not create $NVM_DIR/nvm.sh"
    exit 1
fi

# Load nvm in this process so Node can be installed without opening a new shell.
# shellcheck disable=SC1090
source "$NVM_DIR/nvm.sh"

echo "Installing the latest Node.js LTS release (npm is included)..."
nvm install --lts
nvm alias default 'lts/*'
nvm use default

echo "Node setup complete:"
node --version
npm --version
