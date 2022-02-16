pipeline {
    agent any

    stages {
        stage('git') {
            steps {
                // get git
                git url: 'https://github.com/etrosa/spring-petclinic.git', branch: 'main'
            }
        }
        stage('test') {
            steps {
                // Test code
                bat './mvnw test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
         stage('compile') {
            steps {
                // Compile
                bat './mvnw clean package'
            }
        }
        stage('build') {
            steps {
                // build
                bat 'docker build .'
            }
        }
    }
}
