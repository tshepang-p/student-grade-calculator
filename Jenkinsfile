pipeline {
    agent any
    
    tools {
        maven 'Maven-3.9'
        jdk 'JDK-11'
    }
    
    environment {
        RENDER_DEPLOY_HOOK_URL = credentials('render-deploy-hook-url')
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo 'Code checked out successfully'
            }
        }
        
        stage('Compile') {
            steps {
                sh 'mvn clean compile'
            }
            post {
                success {
                    echo 'Compilation successful'
                }
                failure {
                    echo 'Compilation failed'
                }
            }
        }
        
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
                success {
                    echo 'All tests passed'
                }
                failure {
                    echo 'Some tests failed - check test reports'
                }
            }
        }
        
        stage('Package') {
            steps {
                sh 'mvn package'
            }
            post {
                success {
                    archiveArtifacts artifacts: 'target/*.war', fingerprint: true
                }
            }
        }
        
        stage('Deploy to Render') {
            when {
                branch 'main'
            }
            steps {
                script {
                    sh "curl -X POST ${RENDER_DEPLOY_HOOK_URL}"
                }
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline execution completed'
        }
        failure {
            echo 'Pipeline failed - check logs'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
    }
}
