pipeline {
    agent any
    
    environment {
        IMAGE_NAME = "my-custom-app"
        CONTAINER_NAME = "my-running-app"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                echo 'Building the Docker Image...'
                sh 'docker build -t ${IMAGE_NAME} .'
            }
        }
        
        stage('Stop Old Container') {
            steps {
                echo 'Stopping any previously running containers...'
                sh 'docker stop ${CONTAINER_NAME} || true'
                sh 'docker rm ${CONTAINER_NAME} || true'
            }
        }
        
        stage('Run New Container') {
            steps {
                echo 'Starting the new container...'
                // We map port 8000 on your AWS server to port 80 inside the container
                sh 'docker run -d -p 8000:80 --name ${CONTAINER_NAME} ${IMAGE_NAME}'
            }
        }
    }
}
