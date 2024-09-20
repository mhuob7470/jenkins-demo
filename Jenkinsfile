pipeline {
    agent any
    environment {
        DOCKER_REGISTRY = 'localhost:5000'
        DOCKER_IMAGE = 'spring-boot-app'
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
                bat 'mvn -B -DskipTests clean package'
            }
        }
        stage('Docker Build') {
            steps {
                // Build Docker image (use Docker Desktop)
                bat "docker build -t %DOCKER_REGISTRY%/%DOCKER_IMAGE%:latest ."
            }
        }
        stage('Docker Push') {
            steps {
                // Push Docker image to registry
                bat "docker push %DOCKER_REGISTRY%/%DOCKER_IMAGE%:latest"
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                // Deploy to Kubernetes
                bat 'kubectl apply -f deployment.yaml'
            }
        }
    }
    post {
        success {
            echo 'Build successful!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
