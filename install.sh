#! /usr/bin/env sh

## install oh-my-zsh
if [ -z "$ZSH" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install zsh-syntax-highlighting
brew install gh

## simlink files
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/pryrc ~/.pryrc
ln -sf ~/dotfiles/gitconfig ~/.gitconfig


#if [ "$SPIN" ]; then
#  ECHO "hi"
#fi
