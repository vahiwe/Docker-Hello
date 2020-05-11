pipeline {
    agent any
    stages {
        stage('Install Dependencies') {
              steps {
                  withPythonEnv('~/.hello') {
                    // Creates the virtualenv before proceeding
                    sh """
                        make install                   
                    """
                }
              }
         }
         stage('Lint Docker and Python file') {
              steps {
                  withPythonEnv('~/.hello') {
                    // Creates the virtualenv before proceeding
                    sh 'make lint'
                }                                
              }
         }
    }
}