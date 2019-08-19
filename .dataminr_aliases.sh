alias vda='vi ~/.dataminr_aliases.sh'
alias sda='vi ~/.dataminr_aliases.sh'

alias et='repos; cd enterprise-management-testing'
alias vl='repos; cd dm-vigil'
alias ca='repos; cd ca-testing'
alias st='repos; cd ghost-testing'
alias tt='repos; cd test-testing'
alias js='repos; cd jenkins-workflow-scripts'
alias js2='intellij; cd jenkins-workflow-scripts'


alias listlinks='ls -l node_modules | grep ^l'

# npm links
alias lkvl='npm link $REPOS/dm-vigil'
alias ulvl='npm unlink $REPOS/dm-vigil'

alias v='echo "npm@$(npm -v) node@$(node -v)"'


alias runet='grunt --files="tests/end-to-end/client-app-first-alert-dark-hardcoded.js"'
alias runca='grunt test:chrome:stage --files="tests/corporate/historical/apply-searches/edit-searches/foreign-language.js"'
alias runst='grunt --files="tests/finance/streams.js"'


alias installvl='npm install ../dm-vigil'
alias nivl='npm install ../dm-vigil'
