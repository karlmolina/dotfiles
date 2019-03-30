# git

# Add git completion to aliases
__git_complete ga _git_add
__git_complete go _git_checkout
__git_complete gm _git_merge
__git_complete pl _git_pull
__git_complete gb _git_branch

NETBEANS="/mnt/c/Users/$WUSER/Documents/NetBeansProjects/"

# add
alias ga='git add'
alias gai='git add -i'
alias gap='git add -p'
alias gaa='git add .'
alias gs='git status'
alias gc='git commit'
alias gd='git diff'
alias gds='git diff --staged'

# remove this alias because I use interactive checkout tool
alias go='git checkout '

# checkout
#alias go='git_checkout.py'
alias go.='git checkout -- .'
alias gof='git checkout --'
alias gob='git checkout -b'
alias gov='git checkout dev'
alias guw='git checkout --'
alias guwa='git checkout -- .'

# branch
alias gb='git branch'
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
alias gusa='git reset HEAD .'
alias gus='git reset HEAD'
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
alias phdelete='git push origin --delete HEAD'
alias gx='gitx --all'
alias gr='git remote'
alias grao='git remote add origin'
alias gca='git commit -a'
alias grm='git rm'
alias gst='git stash'
alias gf='git fetch'
alias gfp='git fetch -p'
alias pl='git pull; gfp'
alias pll='git pull'
alias plo='git pull origin'
alias pld='git pull origin dev'
alias plh='git -C ~ pull'
alias gm='git merge'
alias pdg='go dev; pll; gob'
alias dog='go dev; pl'
alias gcl='git clone'
alias gri='git rebase -i'
alias rmc='git rm -r --cached .; git add .'
alias gcf='git clean -f'
alias glt='git ls-tree HEAD -r --name-only'
alias gt='git tag'

# not git
alias py='python3'
alias py2='python'
alias pip='pip3.exe'
alias cmd='/mnt/c/Windows/System32/cmd.exe'
alias kc='cmd /mnt/c/Users/KarlMolina/cmd_aliases/kc.bat'
alias specflow='packages/SpecFlow.2.4.0/tools/specflow.exe'
alias chrome='/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe'
alias sr='specflow stepdefinitionreport -p ESMS/ESMS.csproj /BinFolder:ESMS/bin/Debug/'
alias vsr='stepreport; chrome TestResult.html'
alias rmsr='rm TestResult.html'
alias firefox='/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe'
alias devenv='/mnt/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 14.0/Common7/IDE/devenv.exe'

# vi and source aliases
alias vba='vi ~/.bash_aliases'
alias sba='. ~/.bash_aliases'
alias vbp='vi ~/.bash_profile'
alias sbp='. ~/.bash_profile'
alias vbr='vi ~/.bashrc'
alias vvr='vi ~/.vimrc'
alias vggc='vi ~/.gitconfig' 
alias vgc='git config --edit'
alias vcgc='vi ~/.customgitconfig'
alias vir='vi ~/.inputrc'
alias vex='vi ~/.extra'
alias vgi='vi ~/.gitignore'

# cd aliases
alias b='cd -'
alias bt='tj; cd Builder-Tester'
alias ed='tj; cd ESMS-Tester-Desktop'
alias et='tj; cd ESMS-Tester'
alias km='cd /mnt/c/Users/$WUSER'
alias tj='km; cd techlink'
alias db='tj; cd PageElementDocumentationBuilder'
alias td='tj; cd TestLink.Desktop'
alias tw='tj; cd TestLink.Web'
alias repos='km; cd Documents/repos'
alias ti='tj; cd TestLink.wiki'
alias ns='tj; cd NumberScenarios'
alias c.='cd ..'
alias tl='tj; cd TestLink'
alias dow='km; cd Downloads'
alias doc='km; cd Documents'
alias nbs='cd $NETBEANS'
alias dri='km; cd Google\ Drive'
alias vp='cd /mnt/c/Users/KarlMolina/Documents/Visual\ Studio\ 2015/Projects'
alias xml='cd /mnt/c/Users/KarlMolina/Documents/Visual\ Studio\ 2015/Projects/ExcelToXML'
alias intellij='cd /mnt/c/Users/Karl/Documents/IntellijProjects/'

# cd to projects
alias 1='repos'
alias 2='repos; cd poodl'
alias 3='cd /mnt/c/Users/Karl/Documents/IntellijProjects/esof423hw2'
alias 4='cd /mnt/c/Users/Karl/PycharmProjects/csci442hw4'
alias 5='cd /mnt/c/Users/Karl/Documents/repos/sysAdminNotes'
alias 6='cd "/mnt/c/Users/KarlMolina/Documents/Visual Studio 2015/Projects/LoginHistoryCalculator"'

alias rss='rsstail -r -i 1 -u http://lorem-rss.herokuapp.com/feed?unit=second&interval=1 | while read x ; do play fail.ogg ; done'

alias d2u='dos2unix'

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
alias dot='dfca -m "Update dotfiles"; df pull; sbp; df push --quiet &'

# ssh aliases
alias s1='ssh molina@csci351.cs.montana.edu'

# cat aliases
alias clh='cat /mnt/c/Users/KarlMolina/Documents/loginhistory/loginhistory.txt'

alias findnm='find ! -path "./directory/*" -name' 

vind () {
    vi $(findnm "$1")
}

alias exp='explorer.exe'


# apt
alias sat='sudo apt update'
alias sag='sudo apt upgrade'

# alias mongo='/mnt/c/Program\ Files/MongoDB/Server/4.0/bin/mongo.exe'
alias mongo='cmd.exe "C:\Program Files\MongoDB\Server\4.0\bin\mongo.exe"'
