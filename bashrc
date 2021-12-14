## Not used anymore


# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

## GIT alias
alias force-push="git push --force-with-lease"
alias rebase="git pull --rebase origin main"
alias gs='git status'
alias gd='git diff'
alias co='git checkout'
alias gb="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
alias amend='git commit --amend --no-edit'
alias gl='git log --oneline -n 8'
alias pull="git pull"

#fzf git branch
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

cob() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

function gcm {
 git commit -m"$1"
}

## End GIT alias

alias list-port="sudo lsof -PiTCP -sTCP:LISTEN"
export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] > "

export VISUAL=vim
export EDITOR="$VISUAL"

alias vi=vim
alias bashrc='vi ~/.bashrc'

## Shopify commands
alias testb='dev test --include-branch-commits'
alias pr='dev open pr'
alias styleb="dev style --include-branch-commits"
alias tc="dev typecheck"
alias up="git pull; reup"
alias reup='dev down; dev up && TDD=0 dev server'
alias devup='dev up && TDD=0 dev server'

function lhmRevert() {
    bin/rake lhm:revert VERSION=$1
}

function lhmCheck() {
  bin/rake lhm:check VERSION=$1
}

function lhmNew {
  bin/rails generate lhm $1
}

# load dev, but only if present and the shell is interactive
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi
## End Shopify

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

[[ -x /usr/local/bin/brew ]] && eval $(/usr/local/bin/brew shellenv)

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
