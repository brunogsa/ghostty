# ghostty

Cross-platform Ghostty terminal configuration and installer. Replicates my previous gnome-terminal setup (font, theme, opacity, auto-tmux) in Ghostty.

## Setup

```bash
# Prerequisite: ~/oh-my-zsh/ must be set up first (provides detect-os.sh)
./install.sh
```

The script installs Ghostty, the Inconsolata font, and symlinks the config file to `~/.config/ghostty/config`. All steps are idempotent.

## What It Can Configure

Font, theme, transparency, and more. See the [config](./config) file for current settings and Ghostty docs for all available options.

## Platforms

- **macOS**: Ghostty via Homebrew cask, font via Homebrew
- **Linux**: Ghostty via Snap, font via apt

## Part of

Five-repo tooling stack: [unix-utils](https://github.com/brunogsa/unix-utils) | [oh-my-zsh](https://github.com/brunogsa/oh-my-zsh) | [tmux](https://github.com/brunogsa/tmux) | [neovim](https://github.com/brunogsa/neovim) | **ghostty**
