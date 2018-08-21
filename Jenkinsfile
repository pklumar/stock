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
    }
}

void execute(String command) {
    if (isUnix()) {
        sh command
    } else {
        bat command
    }
}
