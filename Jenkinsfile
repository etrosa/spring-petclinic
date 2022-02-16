pipeline {
    agent any
    tools { 
        maven 'maven: 3.8.4' 
    }
    stages {
        stage('Compile') {
            steps {
                bat './mvnw package'
            }
        }
        stage('Test') {
            steps {
                bat './mvnw test'
            }
        }
        stage('Package') {
            steps {
                bat 'docker buid .'
            }
        }
    }
}
