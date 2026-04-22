# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

Personal dotfiles repo for Ghostty terminal configuration. Part of a five-repo tooling stack (`unix-utils`, `oh-my-zsh`, `tmux`, `neovim`, `ghostty`).

Depends on `~/oh-my-zsh/lib/detect-os.sh` for cross-platform OS detection.

## Setup

```bash
./install.sh
```

Idempotent; safe to re-run.

## Editing

Always edit `~/ghostty/config` (source), never `~/.config/ghostty/config` (symlink target). Ghostty config uses `key = value` syntax.
