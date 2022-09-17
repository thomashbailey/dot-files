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

export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/Users/t/Library/Python/3.9/bin:$PATH"

if [[ $(uname -m) =~ "arm64" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [[ -d $HOME/fvm ]]; then
  PATH="$PATH:$HOME/fvm/default/bin"
fi




# This is where you can source your machine specifc stuff
# Just name your file .myzprofile
if [[ -r $HOME/.myzprofile ]]; then source $HOME/.myzprofile; fi



# Ruby Stuff
# We want this to be at the bottom so the path of ruby via rbenv is resolved before others
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

