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

#kubectl
alias k='kubectl'
alias kg='kubectl get'
alias ka='kubectl apply -f'
alias kd='kubectl describe'
alias kl='kubectl logs'
alias kdel='kubectl delete'
alias ke='kubectl edit'
alias kx='kubectl exec'
alias kpf='kubectl port-forward'
alias bb='kubectl run busybox --image=busybox:1.28 --rm -it --restart=Never --command --'
alias bcurl='kubectl run busybox-curl --image-radial/busyboxplus:curl -it --rm --restart=Never --command -- curl -s'

# Linux only
alias co='code . &> /dev/null &'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
