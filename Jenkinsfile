pipeline {
    agent any

    stages {
        stage('Build Dev') {
            steps {
                echo 'Build Dev..'
                sh("test -d k3s/dev && cd k3s/dev/ && skaffold run")
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
