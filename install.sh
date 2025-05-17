#!/usr/bin/env bash
set -e

REPO_DIR="$HOME/dotfiles"

# 1. Install Homebrew if needed
if ! command -v brew >/dev/null; then
  echo "Installing Homebrew…"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 2. Brew bundle
echo "Running brew bundle…"
brew tap homebrew/bundle
brew bundle --file="$REPO_DIR/Brewfile"

# 3. Symlink dotfiles
echo "Linking dotfiles…"
declare -A DOTFILES=(
  ["$REPO_DIR/zsh/.zshrc"]="$HOME/.zshrc"
  ["$REPO_DIR/zsh/.zprofile"]="$HOME/.zprofile"
  ["$REPO_DIR/git/.gitconfig"]="$HOME/.gitconfig"
  ["$REPO_DIR/vim/.vimrc"]="$HOME/.vimrc"
  ["$REPO_DIR/vscode/settings.json"]="$HOME/Library/Application Support/Code/User/settings.json"
  ["$REPO_DIR/ssh/config"]="$HOME/.ssh/config"
)

for src in "${!DOTFILES[@]}"; do
  dest="${DOTFILES[$src]}"
  mkdir -p "$(dirname "$dest")"
  ln -sfv "$src" "$dest"
done

# 4. Apply macOS defaults
echo "Applying macOS defaults…"
source "$REPO_DIR/.macos"

echo "All done! Restart your shell or run: exec zsh"
