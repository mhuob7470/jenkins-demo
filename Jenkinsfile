pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'spring-boot-app'
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
                bat "docker build -t %DOCKER_IMAGE%:latest ."
            }
        }
        stage('Load Docker Image to Kubernetes') {
            steps {
                // Load Docker image into Docker Desktop Kubernetes
                bat 'docker save %DOCKER_IMAGE%:latest | docker load'
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                // Deploy to Kubernetes
                bat 'kubectl apply -f deployment.yaml --validate=false'
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
