#!/bin/bash

DOT_FILES=(.bashrc .gitconfig .gitignore .zshrc .vimrc)

for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done
