pipeline {
    agent any
    tools { 
        maven 'Maven 3.3.9' 
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
