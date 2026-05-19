#!/usr/bin/env bash
set -euo pipefail

# ── helpers ──────────────────────────────────────────────────────────────────

log() { echo "==> $*"; }
skip() { echo "--- $* (already installed, skipping)"; }

command_exists() { command -v "$1" &>/dev/null; }

# ── zsh ───────────────────────────────────────────────────────────────────────

if command_exists zsh; then
  skip "zsh"
else
  log "Installing zsh"
  sudo apt-get update -qq
  sudo apt-get install -y zsh
fi

# ── oh-my-zsh ─────────────────────────────────────────────────────────────────

if [ -d "$HOME/.oh-my-zsh" ]; then
  skip "oh-my-zsh"
else
  log "Installing oh-my-zsh"
  RUNZSH=no CHSH=no sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# ── neovim ────────────────────────────────────────────────────────────────────

if command_exists nvim; then
  skip "neovim"
else
  log "Installing neovim (latest prebuilt release)"
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
  sudo rm -rf /opt/nvim-linux-x86_64
  sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
  sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
  rm -f nvim-linux-x86_64.tar.gz
fi

# lazyvim
NVIM_DIR="$HOME/.config/nvim"
NVIM_REPO="https://github.com/alan2000alex/lazy-nvim-config.git"
if [ -d "$NVIM_DIR" ]; then
  skip "lazyvim"
else
  log "setting up lazyvim"
  mkdir -p "$HOME/.config"
  git clone "$NVIM_REPO" "$NVIM_DIR"
fi

# ── tmux ──────────────────────────────────────────────────────────────────────

if command_exists tmux; then
  skip "tmux"
else
  log "Installing tmux"
  sudo apt-get update -qq
  sudo apt-get install -y tmux
fi

# ── chezmoi ───────────────────────────────────────────────────────────────────

if command_exists chezmoi; then
  skip "chezmoi"
else
  log "Installing chezmoi"
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
fi

# ── tpm (tmux plugin manager) ────────────────────────────────────────────────

TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ -d "$TPM_DIR" ]; then
  skip "tpm"
else
  log "Installing TPM"
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

# ── catppuccin tmux theme ─────────────────────────────────────────────────────

CATPPUCCIN_DIR="$HOME/.config/tmux/plugins/catppuccin/tmux"
if [ -d "$CATPPUCCIN_DIR" ]; then
  skip "catppuccin tmux theme"
else
  log "Cloning catppuccin tmux theme"
  mkdir -p "$(dirname "$CATPPUCCIN_DIR")"
  git clone https://github.com/catppuccin/tmux "$CATPPUCCIN_DIR"
fi
echo ""
echo "All tools installed."
echo ""
