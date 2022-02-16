pipeline {
    agent any
	
    environment {
        
		DOCKERHUB_CREDENTIALS_USR="etrosa93@gmail.com"
		DOCKERHUB_CREDENTIALS_PW="288527d9-97d0-496b-af4f-887b1ccb07e5"
	}
    
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
 
        stage('Login') {

			steps {
				bat 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PW'
			}
		}

		stage('Push') {

			steps {
				bat 'docker push etrosa/petclinic:latest'
			}
		}
    }
}
