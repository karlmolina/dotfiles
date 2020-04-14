alias vda='vi ~/.dataminr_aliases.sh'
alias sda='. ~/.dataminr_aliases.sh'

alias et='repos; cd enterprise-management-testing'
alias dm='repos; cd dm-vigil'
alias ca='repos; cd ca-testing'
alias ht='repos; cd ghost-testing'
alias tt='repos; cd test-testing'
alias hub='repos; cd hub-testing'

alias jv='repos; cd jenkins-views'
alias jw='repos; cd jenkins-workflow-scripts'

alias at='repos; cd admin-testing'
alias st='repos; cd smoketest'
alias ut='repos; cd utah-testing'

alias tp='repos; cd tag-proxy'

alias ktp='repos; cd karl-test-project'
alias api='repos; cd api-testing'

alias jenkins='doc; cd jenkins-test/jenkins'

alias listlinks='ls -l node_modules | grep ^l'

# npm links
alias lkvl='npm link $REPOS/dm-vigil'
alias ulvl='npm unlink $REPOS/dm-vigil'

alias v='echo "npm@$(npm -v) node@$(node -v)"'


alias runet='grunt --files="tests/end-to-end/client-app-first-alert-dark-hardcoded.js"'
alias runca='grunt test:chrome:stage --files="tests/corporate/historical/apply-searches/edit-searches/foreign-language.js"'
alias runht='grunt test:chrome:stage --files="tests/end-to-end/alert-endorse/gov-news-flags.js"'


alias installvl='npm install ../dm-vigil'
alias nivl='npm install ../dm-vigil'


alias fmp='flake8;mypy;pylint **/*.py *.py'

# ssh
alias stp='ssh kmolina@qa-tag-proxy-qa'
