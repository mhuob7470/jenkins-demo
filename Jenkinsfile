pipeline {
    agent any
    environment {
        DOCKER_REGISTRY = 'localhost:5000'
        DOCKER_IMAGE = 'spring-boot-app'
    }
      tools{

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
                sh 'mvn clean package -DskipTests"'
            }
        }
        stage('Docker Build') {
            steps {
                // Build Docker image (use Docker Desktop)
                sh "docker build -t %DOCKER_REGISTRY%/%DOCKER_IMAGE%:latest ."
            }
        }
        stage('Docker Push') {
            steps {
                // Push Docker image to registry
                sh "docker push %DOCKER_REGISTRY%/%DOCKER_IMAGE%:latest"
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                // Deploy to Kubernetes
                sh 'kubectl apply -f deployment.yaml'
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
