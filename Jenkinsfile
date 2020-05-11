pipeline {
    agent any
    stages {
        stage('Install Dependencies') {
              steps {
                  sh """
                        make setup
                        make install                   
                    """
              }
         }
         stage('Lint Docker and Python file') {
              steps {
                  sh 'make lint'
              }
         }
    }
}