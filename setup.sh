#!/usr/bin/env bash

function check_file_exists() {
    local path="$1"
    local backup_dir="$(pwd)/backup"

    if [ -e "$path" ] && [ ! -L "$path" ]; then
        if [ ! -d "$backup_dir" ]; then
            mkdir "$backup_dir"
        fi
        cp -r "$path" "$backup_dir"
        echo "[*] File $path exists and has been backed up"
    fi
}

# Setup tmux
echo "[*] Setting up tmux"
check_file_exists "$HOME/.tmux.conf"
rm -f ~/.tmux.conf
ln -s "$(pwd)/tmux.conf" ~/.tmux.conf
tmux source-file ~/.tmux.conf

# Setup nvim
echo "[*] Setting up nvim"
check_file_exists "$HOME/.config/nvim"
rm -rf ~/.config/nvim
ln -s "$(pwd)/nvim" ~/.config/nvim

# Setup git
echo "[*] Setting up git"
check_file_exists "$HOME/.gitconfig"
check_file_exists "$HOME/.githelpers"
rm -f ~/.githelpers
ln -s "$(pwd)/githelpers" ~/.githelpers
cat gitconfig >> ~/.gitconfig

# Setup bash
echo "[*] Setting up bash profile"
check_file_exists "$HOME/.bash_aliases"
rm -f ~/.bash_aliases
ln -s "$(pwd)/bash_aliases" ~/.bash_aliases
source ~/.bash_aliases

echo "[*] Setup complete."
