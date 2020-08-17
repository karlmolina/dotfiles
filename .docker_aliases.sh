alias voa='vi ~/.docker_aliases.sh'

alias sdd='open -a "Docker 2"'

alias ds='docker ps'
alias dt='docker start'
alias dl='docker logs -f'

# docker
startjenkins () {
    docker run \
        --name jenkins \
        --detach -p 50000:50000 -p 49001:8080 \
        -v /Users/kmolina/Documents/jenkins:/var/jenkins_home \
        --rm jenkins/jenkins:lts
}

startgitlab () {
    docker run \
      --detach \
      --hostname gitlab.example.com \
      --publish 443:443 --publish 80:80 --publish 22:22 \
      --name gitlab \
      --volume /Users/kmolina/Documents/gitlab/config:/etc/gitlab \
      --volume /Users/kmolina/Documents/gitlab/logs:/var/log/gitlab \
      --volume /Users/kmolina/Documents/gitlab/data:/var/opt/gitlab \
      --rm \
      gitlab/gitlab-ce:latest
}


startjenkinsagent () {
    # -d \
    docker run \
    --name jenkins-agent \
    -v /Users/kmolina/Documents/jenkins:/var/jenkins_home \
    --rm \
    --init jenkins/inbound-agent \
    -url http://host.docker.internal:49001 \
    241eca8ab5f337caef8869b261eb7f67c8647cf63af749361dbc2748c4212fff \
    Labeling

    # -workDir=~/Documents/jenkins \
}
