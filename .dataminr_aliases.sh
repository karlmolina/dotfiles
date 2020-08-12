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


alias generateLabels='node node_modules/dm-vigil/utils/generateLabels.js'

function hosts() {
    OUTPUT=''
    if wget -q --spider https://google.com; then
        for x in $(curl -s -H "Content-Type:application/json" -H "accept:application/json" -H "X-RunDeck-Auth-Token:${RUNDECK_API_TOKEN}" https://rundeck-ops.dataminr.com/api/21/projects | jq -r '.[].name'); do
            RAW_HOSTS=$(curl -s -H "accept:application/json" -H "X-RunDeck-Auth-Token:${APIKEY}" https://rundeck-ops.dataminr.com/api/21/project/$x/resources | jq -r '.|keys[]')
            OUTPUT="$OUTPUT $RAW_HOSTS"
        done
        HOSTS=$(echo ${OUTPUT} | tr '[:upper:]' '[:lower:]' | tr ' ' '\n' | sed 's/$/.dm.vpc/g' | grep -v localhost | grep -v ops-rundeck | sort | uniq | xargs)
        complete -W "${HOSTS}" ssh
        echo "${HOSTS}"
        echo "AWS host list updated - $(echo ${HOSTS} | wc -w | awk '{print $1}') found"
    else
        echo "No network detected. Skipping host collection."
    fi
}


# now call the function to create the complete list in your newly opened shell
# hosts

alias report='chrome target/cucumber-html-reports/overview-features.html'
