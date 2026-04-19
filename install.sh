#!/bin/bash
# install.sh - Cross-platform Ghostty terminal setup
#
# Usage:
#   ./install.sh
#
# Examples:
#   cd ~/ghostty && ./install.sh   # install Ghostty + symlink config
#   bash ~/ghostty/install.sh      # same, from anywhere

set -e

# shellcheck source=/dev/null
source ~/oh-my-zsh/lib/detect-os.sh
OS=$(detect_os)
echo "Detected OS: $OS"

# Install Ghostty
if [[ "$OS" == "macos" ]]; then
    if ! command -v ghostty &> /dev/null && ! [ -d "/Applications/Ghostty.app" ]; then
        brew install --cask ghostty
    else
        echo "Ghostty already installed, skipping"
    fi
elif [[ "$OS" == "linux" ]]; then
    if ! command -v ghostty &> /dev/null; then
        sudo snap install --classic ghostty
    else
        echo "Ghostty already installed, skipping"
    fi
fi

# Install Inconsolata font if missing
if ! fc-list | grep -qi 'inconsolata'; then
    echo "Installing Inconsolata font..."
    if [[ "$OS" == "macos" ]]; then
        brew install font-inconsolata
    elif [[ "$OS" == "linux" ]]; then
        sudo apt-get install -y fonts-inconsolata
    fi
else
    echo "Inconsolata font already installed, skipping"
fi

# Symlink config
mkdir -p ~/.config/ghostty
ln -sf ~/ghostty/config ~/.config/ghostty/config

echo "Ghostty setup complete for $OS!"
