pipeline {
    agent any


  stages {
      stage ('Clone repo with .tf file') {
          steps {
              git 'https://github.com/Elferey/cert.git'
              sh 'mv ./template/.terraformrc ~/.terraformrc'
          }
      }

      stage ('Slepp 2 min') {
          steps {
              sleep 120
          }
      }

      stage ('Launch terraform apply') {
          steps {
              sh 'cd ./template && terraform init && terraform plan -out=tfplan -input=false && terraform apply --input=false tfplan'
          }
      }
      
      stage ('Launch ansible playbook') {
          steps {
              sh 'cd ./ansible/roles && ls -l && sudo ansible-playbook roles.yaml -u ubuntu'
          }
      }
  }
}