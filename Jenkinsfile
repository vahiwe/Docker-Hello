pipeline {
    agent any
    stages {
        stage('Install Dependencies') {
              steps {
                  sh """
                        make install
                        wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
                        chmod +x /bin/hadolint                    
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