pipeline {
    agent any

    environment {
        DIST_DIR = 'dist/browser'
        NGINX_DIR = '/var/www/html'
    }

    stages {
        stage('Piepeline bgin') {
            steps {
              sh 'Pipeline started'
            }}
        stage('Clean Workspace') {
            steps {
                deleteDir()
            }
        }

        stage('Checkout Code') {
            steps {
                // Replace this with direct Git checkout if not using Multibranch Pipeline
                git url: 'https://github.com/saifeddine01/personalblog.git', branch: 'master'
            }
        }

        stage('Build Angular App in Docker') {
            steps {
                script {
                    // Build a Docker image with Angular CLI
                    sh 'docker build -t angular-builder .'

                    // Uncomment below if you want to build inside the container
                    /*
                    sh '''
                        docker run --rm \
                          -v $(pwd):/app \
                          -w /app \
                          angular-builder \
                          sh -c "npm install && npm run build --prod"
                    '''
                    */
                }
            }
        }

        stage('Deploy to Nginx') {
            steps {
                withCredentials([string(credentialsId: 'jenkins-user-password', variable: 'JENKINS_PASS')]) {
                    script {
                        sh 'ls -l $DIST_DIR'

                        // Copy dist content to nginx using sudo with password
                        sh """
                            echo '${JENKINS_PASS}' | sudo -S rm -rf ${NGINX_DIR}/*
                            echo '${JENKINS_PASS}' | sudo -S cp -r ${DIST_DIR}/* ${NGINX_DIR}/
                            echo '${JENKINS_PASS}' | sudo -S systemctl reload nginx
                        """
                    }
                }
            }
        }
    }

    post {
        failure {
            echo '❌ Build or deployment failed!'
        }
        success {
            echo '✅ Deployment successful!'
        }
    }
}
