pipeline {
    agent any
    environment {
        registry = "vahiwe/udacity"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    stages {
         stage('Lint files') {
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
        stage('Deploy Kubernetes') {
            steps {
                withAWS(region:'us-west-2', credentials:'aws') {
                    sh 'aws s3 ls'
                }
            }
        }
    }
}