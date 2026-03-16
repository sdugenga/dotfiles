# Plugins
source ~/dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# PATH thing from fedora
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Git branch info
git_branch() {
  git branch 2>/dev/null | grep '*' | sed 's/* //'
}

# Prompt directory
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

# Git indicator
git_indicator() {
  git rev-parse --is-inside-work-tree 2>/dev/null 1>/dev/null && echo "● "
}

# Disable the automatice prompt from venv
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Venv indicator
venv_indicator() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "(v) "
  fi
}

# tmux work session starter
work() {
  local project=${1:-.}
  cd "$project"
  local project_dir=$(pwd)

  # activate venv if one exists
  if [ -f "$project_dir/.venv/bin/activate" ]; then
    source "$project_dir/.venv/bin/activate"
  elif [ -f "$project_dir/venv/bin/activate" ]; then
    source "$project_dir/venv/bin/activate"
  fi

  tmux new-session -d -s work -x "$(tput cols)" -y "$(tput lines)"
  tmux split-window -v -p 20 -t work
  tmux select-pane -t work:1.1
  tmux send-keys -t work:1.1 "nvim ." Enter
  tmux select-pane -t work:1.1
  tmux attach -t work
}

setopt PROMPT_SUBST
PROMPT='%F{green}$(venv_indicator)%f%F{#74c7ec}${USER:0:3}%f%F{#89b4fa}@%f%F{#74c7ec}${HOST:0:3}%f %F{green}$(prompt_dir) %f%% '

# Aliases
alias ll="ls -la"
alias ..="cd .."
alias ...="cd ../.."
alias gs="git status"
alias gp="git push"
alias gc="git commit"
