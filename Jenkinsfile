pipeline {
    agent any

    tools {
        maven 'Maven'
        jdk 'Java 21'
    }


    stages {

         stage('Build'){
            steps{
                sh 'mvn clean package'
            }
        }

        stage('Run Tests'){
            steps{
                sh 'mvn clean test'
                
            }
        }
       
    }
}