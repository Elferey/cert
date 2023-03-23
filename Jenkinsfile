pipeline {
    agent any


  stages {
      stage ('Clone repo with .tf file') {
          steps {
              git 'https://github.com/Elferey/cert.git'
              sh 'mv ./template/.terraformrc ~/.terraformrc'
          }
      }

      stage ('Launch terraform apply') {
          steps {
              sh 'cd ./template && terraform init && terraform apply -auto-approve'
          }
      }
      
      stage ('Slepp 2 min') {
          steps {
              sleep 120
          }
      }

      stage ('Launch ansible playbook') {
          steps {
              sh 'cd ./ansible/roles && sudo ansible-playbook roles.yaml -u ubuntu'
          }
      }
  }
}