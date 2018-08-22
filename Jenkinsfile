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
                sh './gradlew dockerBuildImage'
            }
        }
        stage('Publish') {
            steps {
                withCredentials([string(credentialsId: 'DOCKER_HUB_USERNAME', variable: '$DOCKER_HUB_USERNAME'), string(credentialsId: 'DOCKER_HUB_PASSWORD', variable: 'DOCKER_HUB_PASSWORD')]) {
                    sh './gradlew dockerPushImage -Pdocker-hub-username=$DOCKER_HUB_USERNAME -Pdocker-hub-password=$DOCKER_HUB_PASSWORD'
                }
            }
        }
    }
}
