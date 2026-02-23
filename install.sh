#!/bin/bash

# Create config directories
mkdir -p ~/.config
mkdir -p ~/.config/alacritty

# Remove existing nvim config dir if it exists so symlink works correctly
rm -rf ~/.config/nvim

# Symlinks
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/bashrc ~/.bashrc
ln -sf ~/dotfiles/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -sf ~/dotfiles/zshrc ~/.zshrc

# Only symlink Alacritty config on non-WSL systems
if ! grep -q Microsoft /proc/version 2>/dev/null; then
    ln -sf ~/dotfiles/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
fi

echo "Done! Open nvim to install plugins."
