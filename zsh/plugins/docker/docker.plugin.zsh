# remove unused containers
alias docker-rmuc='docker ps -a -f status=exited -q | xargs docker rm'
# remove unused images
alias docker-rmui='docker images -f dangling=true -q | xargs docker rmi'

alias doco='docker-compose'
alias doco-exec='doco exec'
alias doco-run='doco run'
alias doco-up='doco up'
alias doco-dj='doco exec web python manage.py'
