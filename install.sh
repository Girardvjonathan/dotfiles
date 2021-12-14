#! /usr/bin/env sh

## install oh-my-zsh
if [ -z "$ZSH" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd ..
  rm -rf fonts
fi

## simlink files
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/pryrc ~/.pryrc
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
#ln -sf ~/dotfiles/bashrc ~/.bashrc


if [ "$SPIN" ]; then
  ECHO "hi"
fi
