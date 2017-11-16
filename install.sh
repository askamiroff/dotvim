#!/bin/bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
  nvim +PlugInstall +UpdateRemotePlugins +qa &&
  nvim "+echo 'Done!'"
