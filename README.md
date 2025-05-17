# Dotfiles

A central, version-controlled collection of my macOS, shell, editor, and tool configurations—fully bootstrappable on any new machine.

## 🎯 Goals

- Keep all personal configs (macOS defaults, shell, editor, IDE, utilities) in one place
- Automate installation of Homebrew, apps, fonts, and dev tools
- Symlink all dotfiles into `~` for easy updates
- Provide a reproducible, documented setup for new machines

## 📋 Prerequisites

1. **macOS** (tested on 11+ / 12+ / 13+)
2. **Xcode Command Line Tools**
   ```bash
   xcode-select --install
   ```
3. **Git** (if not already installed, it will be installed by Homebrew below)

## 🚀 Quickstart

1. **Clone your dotfiles**

   ```bash
   git clone git@github.com:youruser/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Run the bootstrap script**

   ```bash
   ./install.sh
   ```

   This will:

   - Install Homebrew (if missing)
   - Tap & install packages, casks & fonts via `Brewfile`
   - Install `nvm`, Node LTS, Bun
   - Clone the `bullet-train` Oh My Zsh theme
   - Create your `~/dev` directory
   - Symlink all dotfiles (e.g. `.zshrc`, `.gitconfig`, `.vimrc`) into `~`
   - Apply macOS defaults (`.macos`)

3. **Restart your shell**

   ```bash
   exec zsh
   ```

## 🗂 Repository Layout

```
dotfiles/
├── Brewfile            # Homebrew formulae, casks & fonts
├── install.sh          # Bootstrap script
├── .macos              # macOS defaults script
│
├── zsh/
│   ├── .zshrc
│   └── .zprofile
│
├── git/
│   └── .gitconfig
│
├── vim/
│   └── .vimrc
│
├── tmux/
│   └── .tmux.conf
│
├── vscode/
│   └── settings.json
│
└── ssh/
    └── config
```

## 🔧 Customization

- **Add new apps/fonts**
  Simply update the `Brewfile` and re-run:

  ```bash
  brew bundle --file="$HOME/dotfiles/Brewfile"
  ```

- **Add or change dotfiles**

  1. Place your file under the appropriate folder (e.g. `zsh/.zshrc`).
  2. Ensure `install.sh` maps it to the correct `$HOME` location.
  3. Commit & push.

- **macOS tweaks**
  Edit `.macos` for any `defaults write …` adjustments, then re-source:

  ```bash
  source ~/.macos
  ```

## 👀 Tips & Troubleshooting

- **Oh My Zsh auto-update**
  You can configure update frequency in your `.zshrc`:

  ```bash
  zstyle ':omz:update' mode reminder
  zstyle ':omz:update' frequency 7
  ```

- **Font issues**
  If Powerline glyphs aren’t displaying, ensure your terminal uses **JetBrains Mono Nerd Font** (or whichever you’ve installed).

- **nvm not found**
  Make sure `export NVM_DIR="$HOME/.nvm"` and its `source` lines are present in your `.zshrc` **after** Oh My Zsh loads.

## 📝 License

This repository is MIT-licensed. See [LICENSE](./LICENSE) for details.

> _Created & maintained by Daniel · Reproduce your environment everywhere!_
