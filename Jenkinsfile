pipeline {
    agent any
    environment {
      PYTHONPATH="/usr/bin/python3"
    }
    stages {
         stage('Lint Docker') {
              steps {
                  sh 'make lint'
              }
         }
    }
}