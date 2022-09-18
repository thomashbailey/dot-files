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


# Functions
function current() {
  if [[ $(ls .git 2>/dev/null) ]]; then echo $(git branch --show-current); fi
}

# Aliases
alias gs="git status"
alias gfp="git fetch && git pull origin $(current)"
alias adb="$ANDROID_HOME/platform-tools/adb"

if [[ -n $(brew list | grep fzf) ]]; then
  if [[ $(uname -m) =~ "arm64" ]]; then
    export FZF_BASE="/opt/homebrew/bin/fzf"
  else
    export FZF_BASE="/usr/local/bin/fzf"
  fi
  alias fzf="$FZF_BASE --preview='bat --color=always --style=numbers {}' \
    --bind 'ctrl-o:execute(vim {})+abort' \
    --bind 'ctrl-v:execute(code {1})+cancel' \
    --bind 'ctrl-y:execute(echo {} | pbcopy)+abort' \
    --bind 'shift-up:preview-page-up,shift-down:preview-page-down' \
      "
fi

fif() {
  rg  \
    --column \
    --no-heading \
    --fixed-strings \
    --ignore-case \
    --hidden \
    --follow \
    --glob '!.git/*' \
    --glob '!.vscode-server/*' \
    "$1" \
    | awk -F  ":" '/1/ {start = $2<5 ? 0 : $2 - 5; end = $2 + 5; print $1 " " $2 " " $3 " " start ":" end}' \
    | fzf \
    --bind 'ctrl-y:execute(echo {} | pbcopy)+abort' \
    --bind 'ctrl-o:execute(vim "+call cursor({2},{3})" {1})+cancel' \
    --bind 'ctrl-v:execute(code --goto {1}:{2}:{3})+cancel' \
    --preview-window wrap \
    --preview 'bat --wrap character --color always {1} --highlight-line {2} --line-range {4}' \
  }
  
# This is where you can source your machine specifc stuff
# Just name your file .myzhsrc
if [[ -r $HOME/.myzshrc ]]; then source $HOME/.myzshrc; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
