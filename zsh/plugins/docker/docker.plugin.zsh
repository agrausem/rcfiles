# remove unused containers
alias docker-rmuc='docker ps -a -f status=exited -q | xargs docker rm'
# remove unused images
alias docker-rmui='docker images -f dangling=true -q | xargs docker rmi'

alias dtc='docker-compose'
alias dtc-exec='dtc exec'
alias dtc-run='dtc run'
alias dtc-up='dtc up'
alias dtc-dj='dtc exec web python manage.py'
alias dockviz="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"
