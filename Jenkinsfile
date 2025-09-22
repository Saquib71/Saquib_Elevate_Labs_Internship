pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('Docker_Hub_Credentials')
        IMAGE_NAME = "mohdsaquib31/static-site-demo"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Saquib71/Saquib_Elevate_Labs_Internship.git', 
                    credentialsId: 'GitHub_Credentials'
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
        script {
            // Stop & remove existing container if exists
            sh "docker rm -f static-site-demo || true"

            // Check if port 8080 is free
            def portCheck = sh(script: "lsof -i:8080", returnStatus: true)
            
            if (portCheck == 0) {
                // Port 8080 is in use, use 9090 instead
                sh "docker run -d -p 9090:80 --name static-site-demo ${IMAGE_NAME}:latest"
                echo "Port 8080 is busy, running container on port 9090"
            } else {
                // Port 8080 is free
                sh "docker run -d -p 8080:80 --name static-site-demo ${IMAGE_NAME}:latest"
                echo "Container deployed on port 8080"
            }
        }
    }
}
