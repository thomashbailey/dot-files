#!/usr/bin/env bash

git submodule update --init --remote --recursive

# TODO: install brew if its not installed

# TODO: install bat, fzf, rg if not installed


ln -sf $(pwd)/.oh-my-zsh $HOME
ln -sf $(pwd)/.oh-my-zsh-plugins $HOME
ln -sf $(pwd)/.zshrc $HOME/.zshrc
ln -sf $(pwd)/.zprofile $HOME/.zprofile
ln -sf $(pwd)/.ohmyzshrc $HOME
ln -sf $(pwd)/.p10k.zsh $HOME
ln -sf $(pwd)/.zshrc $HOME
ln -sf $(pwd)/.vimrc $HOME
ln -sf $(pwd)/.vim $HOME
ln -sf $(pwd)/.tmux.conf $HOME

mkdir -p $HOME/.config/alacritty
ln -sf $(pwd)/.config/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml

if [[ ! -f "${HOME}/Library/MesloLGS NF Regular.ttf" ]]; then
  cp .config/alacritty/*.ttf $HOME/Library/fonts
fi

zsh
