alias vda='vi ~/.dataminr_aliases.sh'
alias sda='. ~/.dataminr_aliases.sh'

alias emt='repos; cd enterprise-management-testing'
alias dm='repos; cd dm-vigil'
alias ca='repos; cd ca-testing'
alias ghost='repos; cd ghost-testing'
alias tt='repos; cd test-testing'
alias hub='repos; cd hub-testing'

alias jv='repos; cd jenkins-views'
alias jw='repos; cd jenkins-workflow-scripts'

alias admin='repos; cd admin-testing'
alias smoke='repos; cd smoketest'
alias utah='repos; cd utah-testing'

alias tp='repos; cd tag-proxy'

alias ktp='repos; cd karl-test-project'
alias api='repos; cd api-testing'

alias jenkins='doc; cd jenkins-test/jenkins'

alias badger='repos; cd qa-badger'

alias listlinks='ls -l node_modules | grep ^l'

# npm links
alias linkvl='npm link $REPOS/dm-vigil'
alias unlinkvl='npm unlink $REPOS/dm-vigil'

alias v='echo "npm@$(npm -v) node@$(node -v)"'


alias runet='grunt --files="tests/end-to-end/client-app-first-alert-dark-hardcoded.js"'
alias runca='grunt test:chrome:stage --files="tests/corporate/historical/apply-searches/edit-searches/foreign-language.js"'
alias runht='grunt test:chrome:stage --files="tests/end-to-end/alert-endorse/gov-news-flags.js"'

alias mockdriver='grunt mochaTest:mockWebdriver'


alias installvl='npm install ../dm-vigil'
alias nivl='npm install ../dm-vigil'

alias rmvl='rm -r node_modules/dm-vigil; ni'


alias lint='flake8;mypy;pylint tag_proxy config/__init__.py app.py;pydocstyle'

# ssh
alias stp='ssh kmolina@qa-tag-proxy-qa'

alias streams='r; cd streams'

# eslint
alias eslint='node node_modules/.bin/eslint'

# docker
startjenkins () {
    docker run --name jenkins \
        --detach -p 50000:50000 -p 49001:8080 \
        -v /Users/kmolina/Documents/jenkins:/var/jenkins_home \
        --rm jenkins/jenkins:lts
}

alias generateLabels='node node_modules/dm-vigil/utils/generateLabels.js'
