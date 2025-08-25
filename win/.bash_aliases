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
alias gitname='git config --global user.name'
alias gitemail='git config --global user.email'

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
alias ghila='gh issue list -s all'
alias ghilc='gh issue list -s closed'
alias ghiv='gh issue view'
alias ghie='gh issue edit'
alias ghp='gh pr'
alias ghpc='gh pr create'
alias ghpl='gh pr list'
alias ghpla='gh pr list -s all'
alias ghplm='gh pr list -s merged'
alias ghplc='gh pr list -s closed'
alias ghpv='gh pr view'
alias ghps='gh pr status'
alias ghpk='gh pr checks'
alias ghpm='gh pr merge'
alias ghpe='gh pr edit'
alias ghr='gh run'
alias ghrl='gh run list'
alias ghrv='gh run view'
alias ghrw='gh run watch'
alias ghrell='gh release list'
alias ghrelv='gh release view'
alias ghrele='gh release edit'

# general functions
is-same() {
  if [[ "$1" == "$2" ]]; then
    return 0  # true
  else
    return 1  # false
  fi
}

# git&gh functions
git-branch-getcurrent() {
  git rev-parse --abbrev-ref HEAD
}

gh-pr-getnum() {
  ghpl --limit 1 | awk '{print $1}' | cut -d' ' -f1
}
gh-pr-getanum() {
  ghpla --limit 1 | awk '{print $1}' | cut -d' ' -f1
}
gh-run-getnum() {
  ghrl --limit 1 | sed 's/^.*\s\([0-9]\{7,\}\)\s.*$/\1/g'
}
gh-run-getwnum() {
  ghrl --workflow $1.yml --limit 1 | sed 's/^.*\s\([0-9]\{7,\}\)\s.*$/\1/g'
}
gh-pr-merge() {
  ghpm $(gh-pr-getnum) -d && grpo
}
gh-pr-pull() {
  ghrw -i2 && git pull
}

ghpvl() { # gh pr view latest
  ghpv $(gh-pr-getanum)
}
ghrvl() { # gh run view latest
  ghrv $(gh-run-getnum)
}
ghrvL() { # gh run view latest (--log-failed)
  ghrv $(gh-run-getnum) --log-failed
}
ghrvlw() { # gh run view latest (of workflow)
  ghrv $(gh-run-getwnum $1)
}
ghrvLw() { # gh run view latest (--log-failed) (of workflow)
  ghrv $(gh-run-getwnum $1) --log-failed
}
ghrlw() { # gh run list --workflow
  ghrl --workflow $1.yml
}

gh-pr-get-assignee() {
  ghpvl | grep "assignees" | awk -F' ' '{ print $2 }'
}

gpW() { # git push (-u) and gh run Watch
  branch=$(git-branch-getcurrent)

  if git ls-remote --exit-code --heads origin "$branch" &> /dev/null; then
    git push && sleep 3 && ghrw -i2 && ghrvl
  else
    git push -u origin "$branch" && sleep 3 && ghrw -i2 && ghrvl
  fi
}
ghpMP() { # gh pr Merge and git Pull
  # Automatically merge only when PR assignee matches Git user
  if is-same $(gh-pr-get-assignee) $(gitname); then
    echo "Start merging.."
    gh-pr-merge && gh-pr-pull
  else
    echo "The assignee of the PR does not match Git user"
  fi
}

# tools
alias lg='lazygit'
