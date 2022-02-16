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
 
        stage('DH_Login') {

			steps {
				        withDockerRegistry([ credentialsId: "erosa", url: "" ]) {
                                                 bat  'docker push etrosa/petclinic:latest'
                                                 bat  'docker push etrosa/petclinic:$BUILD_NUMBER' 
        }
			}
		}

	stage('DH_Push') {

			steps {
				bat 'docker push etrosa/petclinic:latest'
			}
		}
    }
}
