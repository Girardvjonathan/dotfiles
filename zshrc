# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_DISABLE_COMPFIX=true
ZSH_THEME="agnoster"
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

source $ZSH/oh-my-zsh.sh

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

cob(){
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

gcmessage(){
 git commit -m"$1"
}

## End GIT alias

## Shopify Project specific
alias pr="dev open pr"
alias sfr="dev cd storefront-renderer"
alias reindex="bundle exec rake elasticsearch:all"
alias t="dev test"
alias testb='dev test --include-branch-commits'
alias pr='dev open pr'
alias styleb="dev style --include-branch-commits"
alias tc="dev typecheck"
alias up="git pull; reup"
alias reup='dev down; dev up && TDD=0 dev server'
alias devup='dev up && TDD=0 dev server'

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }
if [ -e /Users/john/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/john/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

[[ -x /usr/local/bin/brew ]] && eval $(/usr/local/bin/brew shellenv)

tsimple(){
  dev test "$1" | grep 'ERROR\|assertions\|FAIL'
}
## End shopify

source /Users/john/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
