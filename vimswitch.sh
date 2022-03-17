#!/usr/bin/env bash
modefile=$HOME/.config/nvim/mode
mode=$(cat $modefile)
sudo cp -r $HOME/.config/nvim $HOME/.config/nvim-modes/$mode
newvim=$HOME/.config/nvim-modes/$1/
if [[ -d $newvim ]]; then
  echo "$1 found"
  if [[ $1 == "lvim" ]]; then
    echo "alias nvim='lvim'
    $(cat $HOME/.zsh_alias)" > $HOME/.zsh_alias
  else
    sed -i /'lvim/d' $HOME/.zsh_alias
    # empty current nvim directory
    sudo rm -r $HOME/.config/nvim/*

    # copy neovim config from newvim towards nvim in .config
    sudo cp -r $HOME/.config/nvim-modes/$1/* $HOME/.config/nvim/
    touch $modefile
    echo $1 >> $modefile
  fi
else
  echo "nvim config not found named $1 not found"
fi

