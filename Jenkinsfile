pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                // Get some code from a GitHub repository
                git url: 'https://github.com/etrosa/spring-petclinic.git', branch: 'main'
            }
        }
        stage('test') {
            steps {
                // Test the code and publish the results
                sh './mvnw test'
            }
        }
         stage('compile') {
            steps {
                // Compile the code
                sh './mvnw clean package'
            }
        }
        stage('build') {
            steps {
                // Run Maven on a Unix agent.
                sh 'docker run .'
            }
        }
    }
}
