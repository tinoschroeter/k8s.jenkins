pipeline {
    agent any

    stages {
        stage('Build Dev') {
            steps {
                echo 'Build Dev..'
                sh("test -f k3s/dev && exit 0")
                sh("cd k3s/dev/ && skaffold run")
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Build Production') {
            steps {
                echo 'Build Production....'
                sh("cd k3s/production/ && skaffold run")
            }
        }
    }
}
