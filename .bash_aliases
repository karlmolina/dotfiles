. ~/.git_aliases.sh
. ~/.dataminr_aliases.sh
. ~/.docker_aliases.sh

# cd to projects
alias 1='repos; cd karlmolina.com'

NETBEANS="/mnt/c/Users/$WUSER/Documents/NetBeansProjects/"

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

# chrome
alias seecover='chrome client/coverage/lcov-report/index.html'

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
alias vex='vi ~/.extra.sh'
alias vgi='vi ~/.gitignore'

# cd aliases
alias b='cd -'
alias km='cd $USER'
alias repos='km; cd Documents/repos'
alias c.='cd ..'
alias dow='km; cd Downloads'
alias doc='km; cd Documents'
alias nbs='cd $NETBEANS'
alias dri='km; cd Google\ Drive'
alias intellij='cd $USER/IdeaProjects/'
alias pycharm='cd $USER/PycharmProjects/'
alias webstorm='cd $USER/WebstormProjects'


alias d2u='dos2unix'

# ssh aliases
alias s1='ssh molina@csci351.cs.montana.edu'

# cat aliases
alias clh='cat /mnt/c/Users/KarlMolina/Documents/loginhistory/loginhistory.txt'

alias findnm='find ! -path "./directory/*" -name' 

vind () {
    vi $(findnm "$1")
}

seer () {
    grep -r -i --exclude-dir=.git "$1" .
}

see () {
    grep -i "$1" *
}

alias exp='explorer.exe'

# apt
alias sat='sudo apt update'
alias sag='sudo apt upgrade'
