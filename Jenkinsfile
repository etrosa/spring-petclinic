pipeline {
    agent any
	
    environment {
        
	DOCKERHUB_CREDENTIALS=credentials('erosa')
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
				bat 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				bat 'docker push etrosa/petclinic:latest'
			}
		}
    }
}
