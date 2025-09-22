pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('Docker_Hub_Credentials')
        IMAGE_NAME = "mohdsaquib31/static-site-demo"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Saquib71/Saquib_Elevate_Labs-Internship.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:latest")
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'Docker_Hub_Credentials') {
                        docker.image("${IMAGE_NAME}:latest").push()
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                sh """
                docker rm -f static-site-demo || true
                docker run -d -p 8080:80 --name static-site-demo ${IMAGE_NAME}:latest
                """
            }
        }
    }
}
