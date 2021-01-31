# remove unused containers
alias docker-rmuc='docker ps -a -f status=exited -q | xargs docker rm'
# remove unused images
alias docker-rmui='docker images -f dangling=true -q | xargs docker rmi'

alias dtc='docker-compose'
alias dtc-e='dtc exec'
alias dtc-r='dtc run'
alias dtc-u='dtc up'
alias dtc-dj-run='dtc exec web python manage.py'
alias dockviz="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"
