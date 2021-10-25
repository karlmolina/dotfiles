alias vda='vi ~/.dataminr_aliases.sh'
alias sda='. ~/.dataminr_aliases.sh'

alias t='vi ~/Documents/today/today.txt'

# cd aliases
alias c='z customization'
alias m='z mariara'
alias d='z deliverable-alerts'
alias w='z watchlist-matching'
alias v='z vpc-config'

alias listlinks='ls -l node_modules | grep ^l'

# Depends on ~/gethosts.sh
function hosts() {
    OUTPUT=$(curl -s -H "Content-Type:application/json" -H "accept:application/json" -H "X-RunDeck-Auth-Token:${RUNDECK_API_TOKEN}" https://rundeck-ops.dataminr.com/api/21/projects | jq -r '.[].name' | xargs -P 0 -n 1 ~/gethosts.sh)
    HOSTS=$(echo ${OUTPUT} | tr "\n" " ")
    zstyle ':completion:*:ssh:*' hosts $(echo $HOSTS)
    # echo
    echo "AWS host list updated - $(echo ${HOSTS} | wc -w | awk '{print $1}') found"
}

alias browser='chrome'
alias report='browser target/cucumber-html-reports/overview-features.html'

function copyalert { for i in "$@"; do echo "> $i"; curl -sk https://alerting-marinara-elasticsearch-v2-test:9200/alerts-index-v1/_doc/$i  | jq -r ._source.alertDetail | pbcopy ;  done; }
function catalert { for i in "$@"; do curl -sk https://alerting-marinara-elasticsearch-v2-test:9200/alerts-index-v1/_doc/$i  | jq -r ._source.alertDetail | jq; done; }
