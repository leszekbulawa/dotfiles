#!/usr/bin/env bash

set -e
set -o pipefail

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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

