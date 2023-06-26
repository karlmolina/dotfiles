# cd  to projects
alias 1='repos; cd karlmolina.com'
alias 2='repos; cd blog'
alias 3='repos; cd lumincenter'
alias 4='repos; cd ipal-backend'
alias 5='repos; cd ipal-mobile'
alias 6='repos; cd ipal-unityProject'

alias vp='venv/bin/python'
alias vpm='venv/bin/python -m'
alias vpp='venv/bin/pip'
alias py='python3'
alias py2='python'
alias cmd='/mnt/c/Windows/System32/cmd.exe'
alias kc='cmd /mnt/c/Users/KarlMolina/cmd_aliases/kc.bat'
alias specflow='packages/SpecFlow.2.4.0/tools/specflow.exe'

# ls
alias la='ls -A'

# vi and source aliases
alias vba='vi ~/.bash_aliases'
alias sba='. ~/.bash_aliases'
alias vidf='vi ~/.install_dot_files.sh'
alias vbp='vi ~/.bash_profile'
alias sbp='. ~/.bash_profile'
alias vbr='vi ~/.bashrc'
alias ev='vi ~/.vimrc'
alias vggc='vi ~/.gitconfig'
alias vgc='git config --edit'
alias vcgc='vi ~/.customgitconfig'
alias vir='vi ~/.inputrc'
alias vex='vi ~/.extra.sh'
alias vgi='vi ~/.gitignore'
alias vjc='vi ~/.jira.d/config.yml'
alias vsc='vi ~/.ssh/config'

# cd aliases
alias b='cd -'
alias km='cd ~'
alias repos='cd ~; cd Documents/repos'
alias r='repos'
alias c.='cd ..'
alias dow='km; cd Downloads'
alias doc='km; cd Documents'
alias des='km; cd Desktop'
alias nbs='cd $NETBEANS'
alias drive='km; cd Google\ Drive'

alias mkdir='mkdir -p'

alias d2u='dos2unix'

# ssh aliases
alias s1='ssh -Y pi@10.200.9.213'
alias skr='ssh-keygen -R'

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

google () {
    q="${@/ /\+}"
    chrome "https://google.com/search?q=$q"
}

alias exp='explorer.exe'

# apt
alias sat='sudo apt update'
alias sag='sudo apt upgrade'

# antlr
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.8-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java -Xmx500M -cp "/usr/local/lib/antlr-4.8-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'

openIde () {
    if ! [[ -n "$2" ]]; then open -a $1 .; return; fi

    if [[ $2 =~ "([^/]+)/*-*/blob/[^/]+/([^#]*)" ]]
    then
        cd ~/Documents/repos
        cd $match[1]
        open -a $1 $match[2]
    else
        open -a $1 $2
    fi
}

alias pc='openIde Pycharm'
alias ws='openIde Webstorm'
alias ij='openIde "IntelliJ IDEA"'
alias code='openIde "Visual Studio Code"'
alias android='openIde "Android Studio"'

# npm
alias ni='npm install'

# find local ip address
alias ip='ifconfig | grep -A 4 en0 | grep "inet " | egrep -oh "([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}" | grep -m 1 ".*"'

alias venv='. venv/bin/activate'

alias golang='/usr/local/bin/go'

# git aliases
. ~/.git_aliases.sh

# dataminr aliases
. ~/.dataminr_aliases.sh

# docker aliases
. ~/.docker_aliases.sh


