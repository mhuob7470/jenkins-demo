pipeline {
    agent any
    environment {
        DOCKER_HUB_REPO = 'abdu7470/spring-boot-app' // Change this to your Docker Hub username
    }
    tools {
        maven 'jenkins-maven'
    }
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub
                git branch: 'main', url: 'https://github.com/mhuob7470/jenkins-demo.git'
            }
        }
        stage('Build') {
            steps {
                // Build Spring Boot JAR on Windows
                bat 'cmd /c "mvn clean package -DskipTests"'
            }
        }
        stage('Docker Build') {
            steps {
                // Build Docker image
                bat "docker build -t %DOCKER_HUB_REPO%:latest ."
            }
        }
        stage('Docker Push') {
            steps {
                // Login to Docker Hub
                bat "docker login -u abdu7470 -p Abdu461689#" // Replace with credentials or use Jenkins credentials
                // Push Docker image to Docker Hub
                bat "docker push %DOCKER_HUB_REPO%:latest"
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                // Deploy to Kubernetes using the image from Docker Hub
                bat 'kubectl --insecure-skip-tls-verify=true apply -f deployment.yaml'
            }
        }
    }
    post {
        success {
            echo 'Build and deployment successful!'
        }
        failure {
            echo 'Build or deployment failed!'
        }
    }
}