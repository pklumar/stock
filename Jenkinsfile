pipeline {
    agent any

    stages {
        stage('Compile') {
            steps {
                sh './gradlew clean build -x test'
            }
        }
        stage('Test') {
            steps {
                sh './gradlew test'
            }
        }
        stage('Build') {
            steps {
                sh './gradlew docker'
            }
        }
        stage('Publish') {
            steps {
                sh './gradlew dockerPush'
            }
        }
        stage('Publish-Using-Plugin') {
            steps {
                script {
                    def image = docker.build('pklumar/stock:latest')
                    image.push()
                }
            }
        }
    }
}
