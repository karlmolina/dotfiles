alias vda='vi ~/.dataminr_aliases.sh'
alias sda='vi ~/.dataminr_aliases.sh'

alias et='repos; cd enterprise-management-testing'
alias vl='repos; cd dm-vigil'
alias ca='repos; cd ca-testing'


alias listlinks='ls -l node_modules | grep ^l'

# npm links
alias lkvl='npm link $REPOS/dm-vigil'
alias ulvl='npm unlink $REPOS/dm-vigil'

alias v='echo "npm@$(npm -v) node@$(node -v)"'
