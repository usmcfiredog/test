#           _
#   _______| |__  _ __ ___
#  |_  / __| '_ \| '__/ __|
# _ / /\__ \ | | | | | (__
#(_)___|___/_| |_|_|  \___|
#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source all dotfiles
for file in ~/.{path,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Source other files
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/local/share/zsh-you-should-use/you-should-use.plugin.zsh
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# Activate ZSH Completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  zstyle ':completion:*' menu select
  autoload -Uz compinit
  compinit
fi

# rm -f "$HOME/.zcompdump"; compinit

# Activate pyenv and pyenv/virtualenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Enable zsh case insensitivity
# unsetopt menu_complete
# compinit
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' special-dirs true


# Use arrow keys to go through history based on what is typed so far
bindkey "^[[A" history-substring-search-up # Up
bindkey "^[[B" history-substring-search-down # Down

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=20000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
#setopt share_history         # share command history data

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zsh vim mode
# source /usr/local/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
