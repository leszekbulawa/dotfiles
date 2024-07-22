#!/usr/bin/env bash

set -e
set -o pipefail

# install zsh
sudo apt install zsh

# install ohmyzsh
if [ ! -d $HOME/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# install fzf
if [ ! -d $HOME/.fzf ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

# install .zshrc config
for config in .zshrc
do
  echo Backing up $config as ${config}_old
  mv ~/$config ~/${config}_old
  echo Creating symlink for $config
  ln -s $(pwd)/$config ~/
done

cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

