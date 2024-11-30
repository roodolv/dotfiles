# unix
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -A --color=auto'
alias lla='ls -lA --color=auto'
alias catn='cat -n'

alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'

# git config
alias gcng='git config --global -e'
alias gcnl='git config --local -e'

# git
alias ga='git add'
alias gaa='git add --all'
alias gcm='git commit -m'
alias grs='git restore --staged'
alias gck='git checkout'
alias gs='git status'
alias gcl='git clone'
alias gb='git branch'
alias gba='git branch -a'
alias gbm='git branch --merged | egrep -v "\*|master|main|develop"'
alias gbmdd='git branch --merged | egrep -v "\*|master|main|develop" | xargs git branch -d'
alias glsf='git ls-files'
alias glsfg='git ls-files | grep'
alias glsr='git ls-remote'
alias grv='git remote -v'
alias grpo='git remote prune origin'
alias gup='git config --get-regexp branch'
alias gsh='git show'
alias gstl='git stash list'
alias gsts='git stash save'
alias gstp='git stash pop'
alias gstc='git stash clear'
alias gtl='git tag -l'

# git log
alias gl='git log --graph --decorate --pretty=oneline --abbrev-commit -n 15'
alias gla='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias gll='git log --graph --pretty=format:"%C(cyan)%h %C(yellow)%s %C(magenta)%ae %C(blue)%cd" --date=format:"%Y-%m-%d %H:%M:%S" --abbrev-commit -n 15'
alias gmyl='git log --author=$(git config --global user.name) --pretty=tformat: --numstat -n 15'
alias gmyll='git log --author=$(git config --global user.name) -n 15'

# git search
alias gg='git grep'
alias ggl='git grep -l'
alias gbl='git blame'
alias grl='git reflog --date=local -n 15'
alias grp='git rev-parse'
alias gnr='git name-rev --all | head -n 15'

# gh commands
alias ghi='gh issue'
alias ghic='gh issue create'
alias ghil='gh issue list'
alias ghp='gh pr'
alias ghpc='gh pr create'
alias ghpl='gh pr list'
alias ghps='gh pr status'
alias ghpk='gh pr checks'
alias ghpm='gh pr merge'
alias ghrl='gh run list'
alias ghrw='gh run watch'
alias ghrll='gh release list'
alias ghrlv='gh release view'

# tools
alias lg='lazygit'
