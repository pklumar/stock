pipeline {
    agent any

    stages {
        stage('Compile') {
            steps {
                sh './gradlew clean build'
            }
        }
        stage('Test') {
            steps {
                sh './gradlew test'
            }
        }
        stage('Build') {
            steps {
                script {
                    docker.build('pklumar/stock:latest')
                }
            }
        }
        stage('Publish') {
            steps {
                script {
                    docker.push('pklumar/stock:latest')
                }
            }
        }
    }
}
