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
  if [[ $(ls .git 2>/dev/null) ]]; then echo $(git branch --show-current 2>/dev/null); fi
}

function gfp() {
  git fetch && git pull origin $(current)
}

function addTextToTopOfFile() {
  if [[ $# -lt 2 ]]; 
  then
    echo "add what to what?";
  else 
    sed -i '' "1s|^|${1}\n|" "$2"
  fi
}

# To enable curses based pinentry 
export GPG_TTY=$(tty)

# Aliases
alias gs="git status 2>/dev/null"
alias glt="git rev-list --tags --max-count=1"
alias adb="$ANDROID_HOME/platform-tools/adb"

# bat --list-themes 
export BAT_THEME="Sublime Snazzy"  

 # Change behavior of fzf dialogue
 export FZF_DEFAULT_OPTS="--no-mouse --height 70% -1 --reverse --multi --inline-info \
   --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || \
   (bat --color=always --style=numbers {} || cat {}) 2> /dev/null | head -300' \
   --preview-window='right:wrap' \
   --bind='f2:toggle-preview' \
   --bind='f3:execute(bat --style=numbers {} || less -f {})' \
   --bind='ctrl-o:execute(vim {})' \
   --bind='ctrl-v:execute(code {1})+cancel' \
   --bind='ctrl-y:execute(echo {} | pbcopy)+abort' \
   --bind='ctrl-d:half-page-down,ctrl-u:half-page-up' \
   --bind='shift-up:preview-page-up,shift-down:preview-page-down' \
   "

 # Exclude those directories even if not listed in .gitignore, or if .gitignore is missing
 FD_OPTIONS="--follow --exclude .git --exclude node_modules"

 # Change find backend
 # Use 'git ls-files' when inside GIT repo, or fd otherwise
 export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTIONS"

 # Find commands for "Ctrl+T" and "Opt+C" shortcuts
 export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
 export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

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
    --bind 'ctrl-o:execute(vim "+call cursor({2},{3})" {1})' \
    --bind 'ctrl-v:execute(code --goto {1}:{2}:{3})+cancel' \
    --preview-window wrap \
    --preview 'bat --wrap character --color always {1} --highlight-line {2} --line-range {4}' \
  }
  
source "$HOME/.cargo/env"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# This is where you can source your machine specifc stuff
# Just name your file .myzhsrc
if [[ -r $HOME/.myzshrc ]]; then source $HOME/.myzshrc; fi

