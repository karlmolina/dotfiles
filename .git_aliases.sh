alias vga='vi ~/.git_aliases.sh'
alias sga='. ~/.git_aliases.sh'
alias vig='vi .gitignore'

# alias ok='git add .;gc -m "Update files";pl;ph'

# add
alias ga='git add'
alias 'ga.'='git add .'
alias gau='git add -u .'
alias gai='git add -i'
alias gap='git add -p'
alias gaa='git add .'
alias gad='git rm $(git ls-files --deleted)'
alias gan='git add -N .'
alias gs='git status'
alias gc='git commit'
alias gcn='git commit --no-verify'
alias gcf='git commit --fixup'
alias gcfh='git commit --fixup head'
alias gd='git diff'
alias gds='git diff --staged'

alias go='git checkout'

# find a branch and check it out
function gof {
    git branch -a | grep -v remotes | grep $1 | head -n 1 | xargs git checkout
}

alias gob='git checkout -b'
alias guw='git checkout --'
alias guwa='git checkout -- .'

# branch
alias gb='git branch'
# rename current branch
alias gbm='git branch -m'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbdelete='git branch -D'
alias gdeleteallbranches='git branch | grep -v \* | xargs git branch -D'
alias gdeletemerged='git branch --merged | grep -v \* | xargs git branch -D'
alias gbu='git branch -u'

# reset
alias grhh='git reset --hard HEAD'
alias grod='git reset origin/dev'
alias grhod='git reset --hard origin/dev'
alias grhom='git reset --hard origin/master'
alias gusa='git reset .'
alias gus='git reset'
alias gusp='git reset --patch'
#git reset hard parent
alias grhp='git reset --hard HEAD^'
#git reset parent
alias grp='git reset HEAD^'


alias gk='gitk --all&'
alias gll='git log --abbrev-commit --decorate'
alias gl='git log --oneline --decorate'

# don't use ps because that is already a command
alias ph='git push'
alias phu='git push -u origin HEAD'
alias phf='git push -f'
alias phdelete='git push origin --delete HEAD'

alias gx='gitx --all'

alias gr='git remote'
alias grao='git remote add origin'
alias grro='git remote rm origin'

alias gca='git commit -a'
alias gcan='git commit -a --no-verify'
alias gcm='git commit --amend'
alias gcmn='git commit --amend --no-edit'

alias grm='git rm'

alias gst='git stash'
alias gast='git stash apply'

alias gf='git fetch'
alias gfp='git fetch -p'

alias pl='git pull; gfp'
alias pll='git pull'
alias plr='git pull -r'
alias plo='git pull origin'
alias pld='git pull origin dev'
alias plm='git pull origin master'
alias plmr='git pull origin master --rebase'
alias plh='git -C ~ pull'

alias gm='git merge'
alias gma='git merge --abort'

alias pdg='go dev; pll; gob'
alias dog='go dev; pl'

alias mog='go master; pl'

alias gcl='git clone'

alias gri='git rebase -i'
alias grc='git rebase --continue'
alias gra='git rebase --abort'

alias rmc='git rm -r --cached .; git add .'
alias gclf='git clean -df'
alias glt='git ls-tree HEAD -r --name-only'
alias gt='git tag'

# dotfile aliases
alias df='git -C ~ --git-dir ~/.dotfiles/.git --work-tree=$HOME'
alias dfd='df diff'
alias dfds='df diff --staged'
alias dfs='df status'
alias dfc='df commit'
alias dfca='df commit -a'
alias dfa='df add'
alias cdf='cd ~/.dotfiles'
alias dfl='df log'
alias dfpl='df pull'
alias dfph='df push'
alias dfsh='df show'
alias dot='dfca -m "Update dotfiles"; df pull; szr; df push --quiet &'
alias dotfiles='chrome https://github.com/karlmolina/dotfiles'

# curl aliases
alias jetbrainsgitignore="curl 'https://raw.githubusercontent.com/github/gitignore/master/Global/JetBrains.gitignore' -o .gitignore"

# open gitlab repo in chrome
gitlab () {
    url=$(git config --get remote.origin.url)
    url="${url/://}"
    https="https://"
    url="${url/git@/$https}"
    url="${url//.git/}"
    if [ -n "$1" ]; then url="${url}/blob/master/$1"; fi
    chrome $url
}
