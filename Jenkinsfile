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
        stage('Configure and Build Kubernetes Cluster'){
            steps {
                withAWS(region:'us-west-2', credentials:'aws') {
                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                        sh 'ansible-playbook ./playbooks/kubernetes-configure.yml'
                    }
                }
            }
        }
        stage('Deploy Updated Image to Cluster'){
            steps {
                withAWS(region:'us-west-2', credentials:'aws') {
                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                        sh "sudo kubectl apply -f ./kubernetes --kubeconfig='/home/ubuntu/.kube/config'" // Bad idea but this is a demo and I'm lazy right :)
                    }
                }
            }
        }
    }
}