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
                  sh '''
                        make lint
                    '''
              }
         }
        stage('show file') {
              steps {
                  sh '''
                        cat kubernetes/container.yml
                    '''
              }
        }
        stage('test environment switch') {
              steps {
                  sh '''
                        export IMAGE="$registry:$BUILD_NUMBER"
                        sed -ie "s~IMAGE~$IMAGE~g" kubernetes/container.yml
                    '''
              }
         }
         stage('view file') {
              steps {
                  sh '''
                        cat kubernetes/container.yml
                    '''
              }
         }
        //  stage('Building image') {
        //     steps{
        //         script {
        //             dockerImage = docker.build registry + ":latest"
        //         }
        //     }
        // }
        // stage('Upload Image to Docker hub') {
        //     steps{
        //         script {
        //             docker.withRegistry( '', registryCredential ) {
        //                 dockerImage.push()
        //             }
        //         }
        //     }
        // }
        // stage('Remove Unused docker image') {
        //     steps{
        //         sh "docker rmi $registry:latest"
        //     }
        // }
        // stage('Deploy Kubernetes') {
        //     steps {
        //         sh 'aws s3 ls'
        //     }
        // }
        // stage('Configure and Build Kubernetes Cluster'){
        //     steps {
        //         sh 'ansible-playbook ./playbooks/kubernetes-configure.yml'                    
        //     }
        // }
        // stage('Deploy Updated Image to Cluster'){
        //     steps {
        //         sh "sudo kubectl apply -f ./kubernetes"
        //     }
        // }
    }
}