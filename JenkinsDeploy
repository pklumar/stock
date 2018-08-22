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
                    docker.withServer('unix:///var/run/docker.sock') {
                        docker.build('pklumar/stock:latest')
                    }
                }
            }
        }
        stage('Publish') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'DOCKER_HUB_CREDENTIALS') {
                        def image = docker.image('pklumar/stock:latest')
                        image.push()
                    }
                }
            }
        }
    }
}
