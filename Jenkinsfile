pipeline {
    agent any

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
