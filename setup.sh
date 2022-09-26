#!/usr/bin/env bash

git submodule update --init --remote --recursive

if [[ ! -f $(which brew) ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"  
fi

if [[ ! $(brew list bat) =~ "bat" ]]; then brew install bat; fi
if [[ ! $(brew list fzf) =~ "fzf" ]]; then brew install fzf; fi
if [[ ! $(brew list rg) =~ "ripgrep" ]]; then brew install rg; fi
if [[ ! $(brew list fd) =~ "fd" ]]; then brew install fd; fi

ln -sf $(pwd)/.oh-my-zsh $HOME
ln -sf $(pwd)/.oh-my-zsh-plugins $HOME
ln -sf $(pwd)/.zshrc $HOME/.zshrc
ln -sf $(pwd)/.zprofile $HOME/.zprofile
ln -sf $(pwd)/.ohmyzshrc $HOME
ln -sf $(pwd)/.p10k.zsh $HOME
ln -sf $(pwd)/.zshrc $HOME
ln -sf $(pwd)/.vimrc $HOME
ln -sf $(pwd)/.vim $HOME
ln -sf $(pwd)/.tmux/ $HOME
ln -sf $(pwd)/.tmux.conf $HOME

mkdir -p $HOME/.config/alacritty
ln -sf $(pwd)/.config/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml

if [[ ! -f "${HOME}/Library/MesloLGS NF Regular.ttf" ]]; then
  cp .config/alacritty/*.ttf $HOME/Library/fonts
fi

zsh
