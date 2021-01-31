source <(/usr/local/bin/kubectl completion zsh)

alias k8s.local="kubectl --namespace agr"
alias k8s.pcscol="kubectl --kubeconfig $HOME/.kube/config.prod"
alias k8s.pcscol.dev2="kubectl --namespace dev2 --kubeconfig $HOME/.kube/config.dev2"
alias k8s.pcscol.sxb="kubectl --namespace test-sxb --kubeconfig $HOME/.kube/test-sxb.prod"
alias k8s.pcscol.test="kubectl --namespace test --kubeconfig $HOME/.kube/config.prod"
alias k8s.pcscol.demo="kubectl --namespace demo --kubeconfig $HOME/.kube/config.prod"
alias k8s.pcscol.kafka-test="kubectl --namespace kafka-test  --kubeconfig $HOME/.kube/kafka-test.prod"
