# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Custom prompt directory display
prompt_dir() {
  local dir="${PWD}"
  local home="${HOME}"
  
  if [[ "$dir" == "$home" ]]; then
    echo "~"
  elif [[ "$dir" == "$home/"* ]]; then
    local relative="${dir#$home/}"
    local depth=$(echo "$relative" | tr -cd '/' | wc -c)
    if [ "$depth" -eq 0 ]; then
      echo "~/$relative"
    else
      echo "../${dir##*/}"
    fi
  else
    echo "../${dir##*/}"
  fi
}

PS1='\[\e[34m\]sam@'${HOSTNAME:0:3}'\[\e[0m\] \[\e[32m\]$(prompt_dir)\[\e[0m\] $ '

# Aliases
alias ll="ls -la"
alias ..="cd .."
alias ...="cd ../.."
alias gs="git status"
alias gp="git push"
alias gc="git commit"
