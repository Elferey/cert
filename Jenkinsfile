pipeline {
    agent any


  stages {
      stage ('Clone repo with .tf file') {
          steps {
              git 'https://github.com/Elferey/cert.git'
          }
      }
      stage ('Launch terraform apply') {
          steps {
              sh 'pwd && ls -l'
              sh 'cd ./template && terraform apply'
          }
      }
      
      stage ('Launch ansible playbook') {
          steps {
              sh 'pwd && ls -l'
              sh 'cd ./ansible && ansible-playbook roles.yaml'
          }
      }
  }
}