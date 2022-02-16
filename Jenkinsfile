pipeline {
    agent any
    tools { 
        maven 'MAVEN' 
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
