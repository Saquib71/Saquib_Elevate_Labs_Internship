pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('Docker_Hub_Credentials')
        IMAGE_NAME = "mohdsaquib31/static-site-demo"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', 
                    url: 'https://github.com/Saquib71/Saquib_Elevate_Labs_Internship.git', 
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
                    docker.withR
