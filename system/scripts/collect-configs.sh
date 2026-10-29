#!/usr/bin/env bash
# collect-configs.sh - Gathers local dotfiles into the repo

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/dotfiles"
mkdir -p "$DOTFILES_DIR/config"

echo "📂 Collecting dotfiles into $DOTFILES_DIR..."

# List of files to collect from $HOME
FILES=(
    ".zshrc"
    ".tmux.conf"
    ".p10k.zsh"
    ".gitconfig"
    ".gitignore_global"
)

for file in "${FILES[@]}"; do
    if [[ -f "$HOME/$file" ]]; then
        cp "$HOME/$file" "$DOTFILES_DIR/"
        echo "✅ Copied $file"
    else
        echo "⚠️ $file not found in $HOME"
    fi
done

# Collect ~/.config/nvim
if [[ -d "$HOME/.config/nvim" ]]; then
    mkdir -p "$DOTFILES_DIR/config/nvim"
    # Use rsync if available to avoid recursive cp issues, otherwise standard cp
    cp -r "$HOME/.config/nvim/." "$DOTFILES_DIR/config/nvim/"
    # Keep generated artifacts (logs, backups) out of the repo
    find "$DOTFILES_DIR/config/nvim" -type f \( -name '*.log' -o -name '*.bak' \) -delete
    echo "✅ Copied nvim config"
fi

# Collect ~/.ssh/config (never collect private keys)
if [[ -f "$HOME/.ssh/config" ]]; then
    mkdir -p "$DOTFILES_DIR/config/ssh"
    cp "$HOME/.ssh/config" "$DOTFILES_DIR/config/ssh/config"
    echo "✅ Copied ssh config"
fi

# Collect ~/.config/oh-my-posh
if [[ -d "$HOME/.config/oh-my-posh" ]]; then
    mkdir -p "$DOTFILES_DIR/config/oh-my-posh"
    cp -r "$HOME/.config/oh-my-posh/." "$DOTFILES_DIR/config/oh-my-posh/"
    echo "✅ Copied oh-my-posh config"
fi

echo "✨ Collection complete."
