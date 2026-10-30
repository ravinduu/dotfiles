# Dotfiles

Personal setup scripts and configuration for a development environment. The repository installs or checks for a few tools and links.

## What's included

- `install.sh` runs the Homebrew, Git, Node.js, and VS Code setup scripts in order.
- `scripts/brew.sh` installs Homebrew on macOS if it is not already installed. On Linux it skips Homebrew.
- `scripts/git.sh` checks for Git and installs it if missing (Homebrew on macOS or `apt` on Linux).
- `scripts/node.sh` installs nvm if needed, then installs the latest Node.js LTS release and uses it as the default. npm is included with Node.js.
- `scripts/vscode.sh` installs VS Code on macOS if needed and links the settings and keybindings in `vscode/` into the VS Code user directory.
- `vscode/extensions.txt` is a place to record VS Code extensions; the installer does not currently install extensions from this file.
- `git/setup-git.sh` is a separate helper that generates a 4096-bit RSA SSH key under a local `tmp/` directory. It is not run by `install.sh`.

## Usage

Clone the repository, then run:

```sh
./install.sh
```

The installer may use `sudo` to install Git on Linux. It needs `curl` to install nvm and Node.js. On macOS, installing Homebrew or VS Code may require interactive input. The complete installer is currently intended for macOS: although the Git, Homebrew, and Node.js scripts support Linux, the VS Code setup exits with an error on Linux if VS Code is missing.

To generate an SSH key separately, run:

```sh
./git/setup-git.sh
```

That helper creates the key in `./tmp/` relative to the directory where you run it. Review the script before use and protect the generated private key.

## VS Code configuration behavior

The installer links `vscode/settings.json` and `vscode/keybindings.json` into the platform's VS Code user settings directory. If a target is already a symlink, the script removes it; if it is an existing regular file, the script renames it to `<filename>.backup` before creating the link.

## Requirements

- Bash
- macOS for the full setup
- On Linux, `apt` and `sudo` are needed if Git must be installed
- `curl` is needed to install Homebrew when it is not already present
