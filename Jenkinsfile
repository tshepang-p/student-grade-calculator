pipeline {
    agent any

    tools {
        maven 'Maven'
        jdk 'JDK11'
    }

    stages {

        stage('Run Tests'){

            steps{
                mvn clean package
                mvn test
            }
        }



        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
    }
}