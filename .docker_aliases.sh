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
    17293017b5257143dabe8a78710b05d2a4fd1260a4916bd2302269eaa9c5b17e \
    Labeling-Node

    # -workDir=~/Documents/jenkins \
}
