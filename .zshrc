tmux='tmux -2'
export DISPLAY=":0"
export TERM=screen-256color
export GREP_OPTIONS="--color=always"

export PATH="$PATH:/usr/local/opt/flutter/bin"
export PATH="$PATH:/usr/local/opt/flutter/bin/cache/dart-sdk/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"

export ANDROID_SDK="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"
export PATH="$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH"
export ANDROID_HOME="$HOME/Library/Android/sdk"

export BUNDLE_USER_HOME="$HOME/.bundle"
export BUNDLE_USER_CACHE="$BUNDLE_USER_HOME/cache"
export BUNDLE_USER_CONFIG="$BUNDLE_USER_HOME/config"
export BUNDLE_USER_PLUGIN="$BUNDLE_USER_HOME/plugin"
alias adb="$ANDROID_HOME/platform-tools/adb"

export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/Users/t/Library/Python/3.9/bin:$PATH"

if [[ $(uname -m) =~ "arm64" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [[ -d $HOME/fvm ]]; then
  PATH="$PATH:$HOME/fvm/default/bin"
fi


# Functions
function current() {
  if [[ $(ls .git 2>/dev/null) ]]; then echo $(git branch --show-current); fi
}


# Aliases
alias gs="git status"
alias gfp="git fetch && git pull origin $(current)"

if [[ -n $(brew list | grep fzf) ]]; then
  if [[ $(uname -m) =~ "arm64" ]]; then
    export FZF_BASE="/opt/homebrew/bin/fzf"
  else
    export FZF_BASE="/usr/local/bin/fzf"
  fi
  alias fzf="$FZF_BASE --preview='bat --color=always --style=numbers {}' \
    --bind 'shift-up:preview-page-up,shift-down:preview-page-down' \
    --bind 'ctrl-o:execute(vim {})+abort,ctrl-y:execute-silent(echo {} | pbcopy).abort'"
fi


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

export ZSH_CUSTOM="$HOME/.oh-my-zsh-plugins"
source $HOME/.ohmyzshrc

if [[ -d $HOME/.oh-my-zsh-plugins/themes/powerlevel10k ]]; then 
  source $HOME/.oh-my-zsh-plugins/themes/powerlevel10k/powerlevel10k.zsh-theme; 
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh



# This is where you can source your machine specifc stuff
# Just name your file .myzhsrc
if [[ -r $HOME/.myzshrc ]]; then source $HOME/.myzshrc; fi





# Ruby Stuff
# We want this to be at the bottom so the path of ruby via rbenv is resolved before others
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

