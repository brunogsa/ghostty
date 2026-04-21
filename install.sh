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

# Install Inconsolata with full weights
# (Ubuntu's fonts-inconsolata ships single-weight only, breaking bold/italic in
# the terminal. Use the Google Fonts multi-weight distribution instead.)
if fc-list :family=Inconsolata 2>/dev/null | grep -qi 'style=Bold'; then
    echo "Inconsolata (with bold variant) already installed, skipping"
else
    echo "Installing Inconsolata (full weights)..."
    if [[ "$OS" == "macos" ]]; then
        brew install --cask font-inconsolata
    elif [[ "$OS" == "linux" ]]; then
        # User-level install takes precedence over any single-weight apt package
        INCONSOLATA_DIR="$HOME/.local/share/fonts/inconsolata"
        mkdir -p "$INCONSOLATA_DIR"
        TMP_INCONSOLATA=$(mktemp -d)
        git clone --depth 1 https://github.com/googlefonts/Inconsolata "$TMP_INCONSOLATA/Inconsolata"
        find "$TMP_INCONSOLATA/Inconsolata" -name 'Inconsolata*.ttf' -exec cp {} "$INCONSOLATA_DIR/" \;
        rm -rf "$TMP_INCONSOLATA"
        fc-cache -f
    fi
fi

# Symlink config
mkdir -p ~/.config/ghostty
ln -sf ~/ghostty/config ~/.config/ghostty/config

echo "Ghostty setup complete for $OS!"
