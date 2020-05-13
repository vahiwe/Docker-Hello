pipeline {
    agent any
    environment {
        registry = "vahiwe/udacity"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    stages {
         stage('Lint Docker') {
              steps {
                  sh 'make lint'
              }
         }
         stage('Building image') {
            steps{
                script {
                    dockerImage = docker.build registry + ":latest"
                }
            }
        }
        stage('Deploy Image') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Remove Unused docker image') {
            steps{
                sh "docker rmi $registry:latest"
            }
        }
    }
}