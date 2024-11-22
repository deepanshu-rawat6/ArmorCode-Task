pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "deepanshuurawat6/armorcode-task"
        DOCKER_TAG = "latest"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'master', url: 'https://github.com/deepanshu-rawat6/ArmorCode-Task.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
            }
        }

        stage('Docker login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USER')]) {
                sh 'docker login -u ${DOCKER_USER} -p ${DOCKER_PASSWORD}'
            }
        }

        stage('Push Docker Image') {
            steps {
                    sh 'docker push ${DOCKER_IMAGE}:${DOCKER_TAG}'
            }
        }

        stage('Deploy Container') {
            steps {
                sh 'docker run --name python-app ${DOCKER_IMAGE}:${DOCKER_TAG}'
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
