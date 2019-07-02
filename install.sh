#!/usr/bin/env sh
for config in .zshrc .vimrc .tmux.conf
do
  echo Backing up $config as ${config}_old
  mv ~/$config ~/${config}_old
  echo Creating symlink for $config
  ln -s $(pwd)/$config ~/
done
