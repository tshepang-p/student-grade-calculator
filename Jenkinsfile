pipeline {
    agent any

    tools {
        maven 'Maven'
        jdk 'Java 21'
    }


    stages {

         stage('Build'){
            steps{
                bat 'mvn clean package'
            }
        }

        stage('Run Tests'){
            steps{
                bat 'mvn clean test'
                
            }
        }
       
    }
}