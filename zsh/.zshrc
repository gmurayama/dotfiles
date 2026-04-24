# Source multiple configuration files
if [ -d ~/.config/zsh ]; then
  for zsh_cfg_file in ~/.config/zsh/*; do
    source $zsh_cfg_file;
  done
  unset zsh_cfg_file;

fi

# ASDF
export ASDF_DATA_DIR="${HOME}/.asdf"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

if [[ -z $GOROOT ]] && [[ -n $(asdf plugin list | grep golang) ]]; then
  . ~/.asdf/plugins/golang/set-env.zsh
fi
if [[ -z $JAVA_HOME ]] && [[ -n $(asdf plugin list | grep java) ]]; then
  . ~/.asdf/plugins/java/set-java-home.zsh
fi
if [[ -z $DOTNET_ROOT ]] && [[ -n $(asdf plugin list | grep dotnet-core) ]]; then
  . ~/.asdf/plugins/dotnet-core/set-dotnet-home.zsh
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic"

# ZSH Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8
export EDITOR='nvim'

function fman() {
  manpage="echo {} | sed 's/[()]/ /g' | awk '{print \$2 \" \" \$1}'"
  tldr="echo {} | sed 's/[()]/ /g' | awk '{print \$1}'"
  batman="${manpage} | xargs -r man | bat --language=man --plain --color always --theme=\"Monokai Extended\""
   man -k . | sort \
   | awk -v cyan=$(tput setaf 6) -v blue=$(tput setaf 4) -v res=$(tput sgr0) -v bld=$(tput bold) '{ $1=cyan bld $1; $2=res blue $2; } 1' \
   | fzf  \
      -q "$1" \
      --ansi \
      --tiebreak=begin \
      --prompt=' Man > '  \
      --preview-window '50%,rounded,<50(up,85%,border-bottom)' \
      --preview "${batman}" \
      --bind "enter:execute(${manpage} | xargs man)" \
      --bind "alt-m:+change-preview(${batman})+change-prompt( Man > )" \
      --bind "alt-t:+change-preview(${tldr} | xargs tldr --color=always)+change-prompt(ﳁ TLDR > )"
}
export MANPAGER="sh -c 'col -bx | bat -l man -p --paging always'"

function rgr() {
  rg --color=always --line-number --no-heading --smart-case "${*:-}" |
  fzf --ansi \
      --color "hl:-1:underline,hl+:-1:underline:reverse" \
      --delimiter : \
      --preview 'bat --color=always {1} --highlight-line {2}' \
      --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
      --bind 'enter:become(nvim {1} +{2})'
}

# Personal aliases
function alias_if_cmd_exists() {
  if command -v $2 &> /dev/null; then
    alias $1
  fi
}

alias vim="nvim"
alias_if_cmd_exists ls="eza --icons" eza

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
