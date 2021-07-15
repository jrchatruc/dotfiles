#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export CPATH=`xcrun --show-sdk-path`/usr/include
#export PATH="$HOME/mybins:$HOME/.local/bin:$HOME/bin:/Users/jrchatruc/anaconda3/bin:/usr/local/sbin:$PATH"
export PATH="$HOME/flutter/bin:$PATH"
export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export SDKROOT="$(xcrun --sdk macosx --show-sdk-path)"
#export PATH="/usr/local/opt/erlang@22/bin:$PATH"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases
[[ -f ~/.config/aliases.zsh ]] && source ~/.config/aliases.zsh

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
eval "$(direnv hook zsh)"

. /usr/local/opt/asdf/asdf.sh

# This is to make fzf respect .gitignore in vim 
export FZF_DEFAULT_COMMAND='rg --files'
