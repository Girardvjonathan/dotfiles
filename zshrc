## oh-my-zsh config
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_DISABLE_COMPFIX=true
ZSH_THEME="steeef"
DISABLE_UPDATE_PROMPT="true"
export UPDATE_ZSH_DAYS=10
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh
## END oh-my-zsh config

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

alias edit_config="vi ~/.zshrc"
alias save_config="source ~/.zshrc"

## GIT alias
alias force-push="git push --force-with-lease"
alias push="git push"
alias add.="git add ."

alias rebase="git pull --rebase origin main"
alias gs='git status'
alias gd='git diff'
alias co='git checkout'
alias gb="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
alias amend='git commit --amend --no-edit'
alias gl='git log --oneline -n 8'
alias pull="git pull"
alias pr="gh pr create --web"
cob(){
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

gcmessage(){
 git commit -m"$1"
}
alias repo="gh repo view --web"
## End GIT alias

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
source /Users/john/.config/elevate/config.sh
eval "$(rbenv init -)";
eval "$(fnm env --use-on-cd)"
export PATH="/opt/homebrew/opt/imagemagick@6/bin:$PATH"
eval "$(direnv hook zsh)"
