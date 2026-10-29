# Atlas

This repository exists to keep my development environment portable and reproducible. It is a single place for the setup scripts and dotfiles that let me configure a new machine — or recover an existing one — with the same shell, editor, and toolchain configs.

## What's here

- **`system/dotfiles/`** — My personal configs: `.zshrc`, `.gitconfig`, `.tmux.conf`, `.p10k.zsh`, Neovim config under `config/nvim/`, and oh-my-posh theme under `config/oh-my-posh/`.
- **`system/scripts/`** — Environment setup and management shell scripts:
  - `setup-env.sh` — Unified cross-platform setup (macOS and Linux/WSL) that installs tools and applies dotfiles.
  - `collect-configs.sh` — Collect current machine's dotfiles back into the repo.
  - `restore.sh` — Restore the saved environment and dotfiles.
  - `generate-inventory.sh` — Regenerate a markdown inventory of installed packages.

## Usage

From the repository root:

```bash
# Set up a new machine (installs packages and applies configs)
bash system/scripts/setup-env.sh install

# Collect current dotfiles back into the repo
bash system/scripts/setup-env.sh collect

# Restore dotfiles from the repo
bash system/scripts/setup-env.sh restore

# Generate a package inventory
bash system/scripts/setup-env.sh inventory
```

For full details, see [`system/scripts/README.md`](system/scripts/README.md).

## Why this exists

Machines drift, break, and get replaced. This repo is the source of truth for my environment so that rebuilding a setup is a short series of commands instead of remembering manual steps.
