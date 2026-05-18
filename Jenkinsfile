pipeline {
    agent any

    tools {
        maven 'Maven'
        jdk 'JDK21'
    }

    stages {

        stage('Run Tests'){

            steps{
                bat 'mvn clean package'
                bat 'mvn test'
            }
        }



        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
    }
}