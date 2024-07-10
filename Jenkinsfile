pipeline {
    agent any

    environment {
        DOCKER_COMPOSE_FILE = 'docker-compose.yml'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Images') {
            steps {
                sh 'docker-compose -f ${DOCKER_COMPOSE_FILE} build'
            }
        }

        stage('Run Containers') {
            steps {
                sh 'docker-compose -f ${DOCKER_COMPOSE_FILE} up -d'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'docker-compose -f ${DOCKER_COMPOSE_FILE} run web php artisan test'
            }
        }

        // stage('Deploy') {
        //     steps {
        //         sh 'docker-compose -f ${DOCKER_COMPOSE_FILE} down'
        //         sh 'docker-compose -f ${DOCKER_COMPOSE_FILE} up -d'
        //     }
        // }
    }

    post {
        always {
            cleanWs()
        }
    }
}
