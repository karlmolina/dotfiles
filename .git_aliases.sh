alias vga='vi ~/.git_aliases.sh'
alias sga='. ~/.git_aliases.sh'
alias vig='vi .gitignore'

# alias ok='git add .;gc -m "Update files";pl;ph'

# add
alias ga='git add'
alias 'ga.'='git add .'
alias gaa='git add .'
alias gau='git add -u .'
alias gai='git add -i'
alias gap='git add -p'
alias gad='git rm $(git ls-files --deleted)'
alias gan='git add -N .'
# updates staged files
alias guia='git update-index --again'

alias gs='git status'

# --verbose shows diff in vim
alias gc='git commit --verbose'
alias gcn='gc --no-verify'
alias gcne='gc --no-edit'
alias gcf='gc --fixup'
alias gcfh='gc --fixup head'
alias gca='gc -a'
alias gcan='gc -a --no-verify'
alias gcm='gc --amend'
alias gcmn='gc --amend --no-edit'

alias gd='git diff'
alias gds='git diff --staged'

alias gu='git checkout'
alias gub='git checkout -b'
alias guw='git checkout --'
alias guwa='git checkout -- .'

# branch
alias gb='git branch -vv'
# rename current branch
alias gbm='git branch -m'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbdelete='git branch -D'
alias gdeleteallbranches='git branch | grep -v \* | xargs git branch -D'
alias gdeletemerged='git branch --merged | grep -v \* | xargs git branch -D'
# change upstream branch
alias gbu='git branch -u'

# reset
alias grhh='git reset --hard HEAD'
alias grod='git reset origin/dev'
alias grhod='git reset --hard origin/dev'
alias grhom='git reset --hard origin/master'
alias gus='git restore --staged'
alias gusa='gus .'
alias gusp='gus --patch'
#git reset hard parent
alias grhp='git reset --hard HEAD^'
#git reset parent
alias grp='git reset HEAD^'


alias gk='gitk --all&'
alias gll='git log --abbrev-commit --decorate'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

alias grl='git reflog'

# don't use ps because that is already a command
alias ph='git push'
alias phu='git push -u origin HEAD'
alias phf='git push -f'
alias phdelete='git push origin --delete HEAD'

alias gx='gitx --all'

alias gr='git remote'
alias grao='git remote add origin'
alias grro='git remote rm origin'


alias grm='git rm'

alias gst='git stash'
alias gast='git stash apply'

alias gf='git fetch'
alias gfp='git fetch -p'

alias pl='git pull; gfp'
alias pll='git pull'
alias plr='git pull -r'
alias plo='git pull origin'
alias plm='git pull origin master'
alias pld='git pull origin develop'
alias plmr='git pull origin master --rebase'
alias plh='git -C ~ pull'

alias gm='git merge'
alias gma='git merge --abort'

alias pdg='go dev; pll; gob'
alias dog='go dev; pl'

alias mug='git checkout master; pl'
alias dug='git checkout develop; pl'

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
