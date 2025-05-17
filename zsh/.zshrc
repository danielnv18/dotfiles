# ┌───────────────────────────────────────────────────────────┐
# │           1. Oh My Zsh Installation & Setup               │
# └───────────────────────────────────────────────────────────┘

# Path to your Oh My Zsh installation (after you’ve run the installer below)
export ZSH="$HOME/.oh-my-zsh"

# If Oh My Zsh isn't installed yet, install it automatically
if [ ! -d "$ZSH" ]; then
  echo "Installing Oh My Zsh…"
  RUNZSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Load Oh My Zsh core
source "$ZSH/oh-my-zsh.sh"

# ┌───────────────────────────────────────────────────────────┐
# │                 2. Theme & Plugins                        │
# └───────────────────────────────────────────────────────────┘

# Theme — bullet-train requires a Powerline-patched font
ZSH_THEME="bullet-train"

# Plugins — keep this list lean; too many can slow startup
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  node
  docker
  # Add others you use frequently: aws, terraform, kubectl, etc.
)

# ┌───────────────────────────────────────────────────────────┐
# │               3. Shell & Completion Init                  │
# └───────────────────────────────────────────────────────────┘

# Enable command correction
ENABLE_CORRECTION="true"

# Change how often to auto-update Oh My Zsh (e.g., every 7 days)
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 7

# Initialize and load completions once
autoload -Uz compinit
compinit

# If you need bash-completion for specific tools
autoload -U +X bashcompinit && bashcompinit

# ┌───────────────────────────────────────────────────────────┐
# │               4. nvm / Node LTS Setup                     │
# └───────────────────────────────────────────────────────────┘

export NVM_DIR="$HOME/.nvm"
# If you installed via Homebrew, adjust path:
# export NVM_DIR="/usr/local/opt/nvm"

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"            # load nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # nvm bash_completion

# ┌───────────────────────────────────────────────────────────┐
# │                5. PATH & FPATH Tweaks                     │
# └───────────────────────────────────────────────────────────┘

# Add your own completion directory
FPATH="$HOME/.zsh/completions:$FPATH"

# Composer global bin
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Lando CLI
export PATH="$HOME/.lando/bin:$PATH"

# LM Studio CLI
export PATH="$PATH:$HOME/.lmstudio/bin"

# Bun & Deno
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
[ -s "$HOME/.deno/env" ] && source "$HOME/.deno/env"

# Herd PHP
export HERD_PHP_84_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/84/"
export PATH="$HOME/Library/Application Support/Herd/bin:$PATH"

# Terraform completion
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# ┌───────────────────────────────────────────────────────────┐
# │                    6. Aliases                             │
# └───────────────────────────────────────────────────────────┘

alias d='cd $HOME/dev'
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
# Add your project-specific shortcuts here

# ┌───────────────────────────────────────────────────────────┐
# │                7. Optional macOS Defaults                 │
# └───────────────────────────────────────────────────────────┘

# # Enable tap to click on the Trackpad
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# # Show hidden files by default in Finder
# defaults write com.apple.finder AppleShowAllFiles -bool true

# ┌───────────────────────────────────────────────────────────┐
# │                8. Final Touch                             │
# └───────────────────────────────────────────────────────────┘

# Source this file after changes
# exec zsh

