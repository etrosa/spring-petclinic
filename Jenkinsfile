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
                bat 'docker build -t etrosa/petclinic:latest .'
            }
        }
 
        stage('dockerhub') {

			steps {
			        withDockerRegistry([ credentialsId: "docker-hub-etrosa", url: "" ]) {
                                bat  'docker push etrosa/petclinic:latest'
                                }
                           }
		}
    }
}
