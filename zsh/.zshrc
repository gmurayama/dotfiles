# Source multiple configuration files
if [ -d ~/.config/zsh ]; then
  for zsh_cfg_file in ~/.config/zsh/*; do
    source $zsh_cfg_file;
  done
  unset zsh_cfg_file;
fi

# ASDF
. "$HOME/.asdf/asdf.sh"
if [[ -z $GOROOT ]] && [[ -n $(asdf plugin list | grep golang) ]]; then
  . ~/.asdf/plugins/golang/set-env.zsh
fi
if [[ -z $JAVA_HOME ]] && [[ -n $(asdf plugin list | grep java) ]]; then
  . ~/.asdf/plugins/java/set-java-home.zsh
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
export EDITOR='vim'

# Personal aliases
function alias_if_cmd_exists() {
  if command -v $2 &> /dev/null; then
    alias $1
  fi
}

alias vim="nvim"
alias_if_cmd_exists ls="eza --icons" eza
alias_if_cmd_exists cat="bat" bat

eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"
