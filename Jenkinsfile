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
                bat 'docker build -t etrosa/petclinic:jenkins .'
            }
        }
         stage('build') {
            steps {
                // build
                bat 'docker run -d -p 8080:8080 etrosa/petclinic:jenkins'
            }
        }
        stage('dhLogin') {
            steps {
		bat 'docker login -u etrosa -p 125f0129-f577-431e-b0fb-a5f73d4abbbe'
                   }
	}
         stage('dhPush') {
            steps {
		bat 'docker push etrosa/petclinic:jenkins'
                   }
	}
    }
}
