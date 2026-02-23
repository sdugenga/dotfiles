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

setopt PROMPT_SUBST
PROMPT='%F{blue}sam@leg%f %F{green}$(prompt_dir)%f%F{yellow}$(git_branch)%f $ '

# Aliases
alias ll="ls -la"
alias ..="cd .."
alias ...="cd ../.."
alias gs="git status"
alias gp="git push"
alias gc="git commit"
