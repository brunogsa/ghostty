# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

Personal dotfiles repo for Ghostty terminal configuration. Part of a five-repo tooling stack (`unix-utils`, `oh-my-zsh`, `tmux`, `neovim`, `ghostty`). Two files: `config` (Ghostty settings) and `install.sh` (cross-platform installer).

## Setup

```bash
./install.sh
```

The install script:
- Requires `~/oh-my-zsh/lib/detect-os.sh` (cross-repo dependency -- oh-my-zsh must be set up first)
- Installs Ghostty: `brew install --cask ghostty` (macOS) / `sudo snap install ghostty` (Linux)
- Installs Inconsolata font: `brew` (macOS) / `apt` (Linux)
- Symlinks: `~/ghostty/config` -> `~/.config/ghostty/config`
- All steps are idempotent (safe to re-run)

## Config

Ghostty uses `key = value` syntax. Configures font, theme, opacity, and more.

Always edit `~/ghostty/config` (source), never `~/.config/ghostty/config` (symlink target).

## Conventions

Follows the shared pattern across all five tooling repos:
- `install.sh` detects OS via `detect-os.sh`, branches on macOS/Linux, uses idempotent checks, symlinks config at the end
- `set -e` for fail-loud behavior
- Config comments explain the "why"
