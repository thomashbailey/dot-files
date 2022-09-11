# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

source $HOME/.ohmyzsh
if [[ -d $HOME/powerlevel10k ]]; then source $HOME/powerlevel10k/powerlevel10k.zsh-theme; fi

# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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


# Functions
function current() {
  if [[ $(ls .git 2>/dev/null) ]]; then echo $(git brach --show-current); fi
}


# Aliases
alias gs="git status 2>/dev/null"
alias gfp="git fetch && git pull origin $(current)"
export FZF_PATH=$(which fzf)
alias fzf="$FZF_PATH --preview='bat --color=always --style=numbers {}' \
  --bind 'shift-up:preview-page-up,shift-down:preview-page-down' \
  --bind 'ctrl-o:execute(vim {})+abort,ctrl-y:execute-silent(echo {} | pbcopy).abort'"


# This is where you can source your machine specifc stuff
if [[ -r $HOME/.myzsh ]]; then source $HOME/.myzsh; fi


# Ruby Stuff
# We want this to be at the bottom so the path of ruby via rbenv is resolved before others
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

