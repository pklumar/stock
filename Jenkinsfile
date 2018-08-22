pipeline {
    agent any

    stages {
        stage('Compile') {
            steps {
                execute 'gradlew clean build -x test'
            }
        }
        stage('Test') {
            steps {
                execute 'gradlew test'
            }
        }
        stage('Build') {
            steps {
                execute 'gradlew docker'
            }
        }
        stage('Publish') {
            steps {
                execute 'gradlew dockerPush'
            }
        }
        stage('Publish-Using-Plugin') {
            steps {
                docker.withServe('tcp://192.168.99.100:2376') {
                    def image = docker.build('pklumar/stock:latest')
                    image.push()
                }
            }
        }
    }
}

void execute(String command) {
    if (isUnix()) {
        sh command
    } else {
        bat command
    }
}
