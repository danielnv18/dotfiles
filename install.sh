#!/usr/bin/env bash
set -e

REPO_DIR="$HOME/dotfiles"

# 0. Install Xcode Command Line Tools (required)
if ! xcode-select -p &>/dev/null; then
  echo "Installing Xcode Command Line Tools…"
  xcode-select --install

  # wait until the install is complete
  until xcode-select -p &>/dev/null; do
    sleep 5
  done
  echo "✅ Xcode CLI Tools installed."
else
  echo "Xcode CLI Tools already installed."
fi

# 1. Install Homebrew if missing…
if ! command -v brew >/dev/null; then
  echo "Installing Homebrew…"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 2. Brew bundle (this will install font-jetbrains-mono)
echo "Tapping & installing Homebrew packages…"
brew tap homebrew/bundle
brew bundle --file="$REPO_DIR/Brewfile"

# 3. Install Oh My Zsh if it’s not already there
ZSH="$HOME/.oh-my-zsh"
if [ ! -d "$ZSH" ]; then
  echo "Installing Oh My Zsh…"
  # KEEP_ZSHRC=yes so it doesn’t overwrite your existing ~/.zshrc
  RUNZSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# 3. Install nvm via official installer if not present
if [ ! -d "$HOME/.nvm" ]; then
  echo "Installing nvm…"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
fi

# Ensure nvm is loaded in this session so we can call it immediately
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# 4. Install latest LTS and set default
echo "Installing latest LTS Node.js…"
nvm install --lts --latest-npm
nvm alias default 'lts/*'

echo "Creating ~/dev directory…"
mkdir -p "$HOME/dev"

# 5. Link your dotfiles
echo "Linking dotfiles…"
# … your existing symlink loop …

# 6. Apply macOS defaults
echo "Applying macOS defaults…"
source "$REPO_DIR/.macos"

echo "🎉 Bootstrapping complete. Restart your shell: exec zsh"
