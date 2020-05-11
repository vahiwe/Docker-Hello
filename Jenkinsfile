pipeline {
    agent any
    environment {
      PYTHONPATH="/usr/bin/python3"
    }
    stages {
        stage('Install Dependencies') {
              steps {
                  sh """
                        make install
                        which python3                   
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