# ghostty

Cross-platform Ghostty terminal configuration and installer. Replicates my previous gnome-terminal setup (font, theme, opacity, auto-tmux) in Ghostty.

## Setup

```bash
# Prerequisite: ~/oh-my-zsh/ must be set up first (provides detect-os.sh)
./install.sh
```

The script installs Ghostty, the Inconsolata font, and symlinks the config file to `~/.config/ghostty/config`. All steps are idempotent.

## What It Configures

| Setting | Value | Rationale |
|---|---|---|
| `font-family` | Inconsolata | Matches gnome-terminal's Inconsolata Medium |
| `font-size` | 16 | Matches gnome-terminal's size |
| `theme` | Matrix | Built-in green-on-black, replaces custom palette |
| `background-opacity` | 0.86 | Matches gnome-terminal's 14% transparency |
| `command` | `tmux new-session -A -s main` | Auto-launches/attaches tmux session |

## Platforms

- **macOS**: Ghostty via Homebrew cask, font via Homebrew
- **Linux**: Ghostty via Snap, font via apt

## Part of

Five-repo tooling stack: [unix-utils](https://github.com/brunogsa/unix-utils) | [oh-my-zsh](https://github.com/brunogsa/oh-my-zsh) | [tmux](https://github.com/brunogsa/tmux) | [neovim](https://github.com/brunogsa/neovim) | **ghostty**
