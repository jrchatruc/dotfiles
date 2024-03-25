# dotfiles
# To setup:
# dotfiles
# To setup:
# $> git init --bare $HOME/.dotfiles.git
# $> dotfiles config --local status.showUntrackedFiles no
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
alias ls='eza'

# git
alias g='git'
alias gs='git status'
alias gd='git diff --color'
alias gst='git stash'
alias gl='git --no-pager log --pretty=oneline --abbrev-commit -n 15'
alias gc='git commit'
alias gco='git checkout'
alias gcm='git checkout master'
alias gb='git branch -v'
alias gcb='git checkout -b'
alias gr='git reset'
alias grh='git reset --hard'
alias ga='git add'
alias gu='git add -u'
alias gp='git pull --rebase'
alias gup='git push'

# Linux only
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
