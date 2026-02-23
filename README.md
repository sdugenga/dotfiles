# Dotfiles Setup Guide

A step-by-step guide to getting the full environment running on a new machine.
This guide assumes Fedora — either native or via WSL on Windows.

---

## Windows: Install WSL with Fedora

Open PowerShell as Administrator and run:

```powershell
wsl --install FedoraLinux-42
```

Restart when prompted. Then launch Fedora from the Start menu and set up your username and password when asked.

To use Alacritty as your terminal pointing at WSL, add this to your Alacritty config on the Windows side (`%APPDATA%\alacritty\alacritty.toml`):

```toml
[terminal.shell]
program = "wsl.exe"
args = ["--distribution", "FedoraLinux-42"]
```

---

## 1. Install Dependencies

```bash
sudo dnf install git zsh tmux neovim ripgrep tree alacritty
```

---

## 2. Set Up SSH Key for GitHub

```bash
ssh-keygen -t ed25519 -C "your@email.com"
cat ~/.ssh/id_ed25519.pub
```

Copy the output and add it to GitHub under Settings → SSH and GPG keys → New SSH key.

Test it works:

```bash
ssh -T git@github.com
```

You should see: `Hi username! You've successfully authenticated.`

---

## 3. Clone Dotfiles

```bash
git clone git@github.com:sdugenga/dotfiles.git ~/dotfiles
```

---

## 4. Initialise Submodules (zsh plugins)

```bash
cd ~/dotfiles
git submodule update --init
```

---

## 5. Run Install Script

```bash
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

This creates symlinks for:
- `~/.config/nvim` → `~/dotfiles/nvim`
- `~/.tmux.conf` → `~/dotfiles/tmux.conf`
- `~/.bashrc` → `~/dotfiles/bashrc`
- `~/.zshrc` → `~/dotfiles/zshrc`
- `~/.config/alacritty/alacritty.toml` → `~/dotfiles/alacritty/alacritty.toml`

---

## 6. Set Zsh as Default Shell

```bash
chsh -s /usr/bin/zsh
```

If that doesn't work:

```bash
sudo usermod -s /usr/bin/zsh yourusername
```

On Alacritty, make sure the config has:

```toml
[terminal.shell]
program = "/usr/bin/zsh"
```

---

## 7. Set Up Git Config

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

---

## 8. Install Neovim Plugins

Open Neovim:

```bash
nvim
```

lazy.nvim will bootstrap itself and install all plugins automatically on first launch.
Once complete, install Treesitter parsers:

```
:TSInstall lua python bash markdown
```

---

## Keeping Dotfiles Up to Date

After making config changes, push them:

```bash
cd ~/dotfiles
git add .
git commit -m "describe change"
git push
```

On another machine, pull latest changes:

```bash
cd ~/dotfiles
git pull
git submodule update
```

---

## Quick Reference

| Tool | Config location |
|------|----------------|
| Neovim | `~/dotfiles/nvim/init.lua` |
| Tmux | `~/dotfiles/tmux.conf` |
| Zsh | `~/dotfiles/zshrc` |
| Alacritty | `~/dotfiles/alacritty/alacritty.toml` |
| Bash | `~/dotfiles/bashrc` |
