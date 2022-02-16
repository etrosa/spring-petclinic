pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                // Get some code from a GitHub repository
                git url: 'https://github.com/etrosa/spring-petclinic.git', branch: 'main'
            }
        }
        stage('compile') {
            steps {
                // Compile the code
                sh 'docker run .'
            }
        }
        stage('test') {
            steps {
                // Test the code and publish the results
                sh './mvnw test'
            }
        }
        stage('build') {
            steps {
                // Run Maven on a Unix agent.
                sh './mvnw clean package'
            }

            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    archiveArtifacts 'target/*.jar'
                }
            }
        }
    }
}
