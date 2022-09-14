
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


# Functions
function current() {
  if [[ $(ls .git 2>/dev/null) ]]; then echo $(git branch --show-current); fi
}

# Aliases
alias gs="git status"
alias gfp="git fetch && git pull origin $(current)"
alias adb="$ANDROID_HOME/platform-tools/adb"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh

