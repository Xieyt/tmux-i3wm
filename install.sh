tmux_dir="${HOME}/.tmux-alok"
tmux_link="${HOME}/.tmux.conf.alok"

git clone https://github.com/Xieyt/tmux-i3wm "${tmux_dir}"

if [[ -d "$tmux_dir" ]]; then
    ln -sfn "$tmux_dir/.tmux.conf" "$tmux_link"
fi

new_alias="alias xtmux='tmux -f ${HOME}/.tmux.conf.alok -S /tmp/tmux-alok '"

if [ -n "$BASH_VERSION" ]; then
    if ! grep -qF "$new_alias" ~/.bashrc; then
    # Append the alias to the Bash configuration file (e.g., ~/.bashrc)
        echo "$new_alias" >> ~/.bashrc
    fi
fi

# Check if the current shell is Zsh
if [ -n "$ZSH_VERSION" ]; then
    if ! grep -qF "$new_alias" ~/.zshrc; then
    # Append the alias to the Zsh configuration file (e.g., ~/.zshrc)
        echo "$new_alias" >> ~/.zshrc
    fi
fi
