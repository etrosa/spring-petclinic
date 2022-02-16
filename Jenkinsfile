pipeline {
  agent {
    docker { image 'node:16-alpine' }
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
        stage('build') {
            steps {
                // build
                bat 'docker build -t etrosa/petclinic:windowpain .'
            }
        }
        stage('dhLogin') {
            steps {
		bat 'docker login -u etrosa -p 125f0129-f577-431e-b0fb-a5f73d4abbbe'
                   }
	}
         stage('dhPush') {
            steps {
		bat 'docker push etrosa/petclinic:windowpain'
                   }
	}
    }
}
