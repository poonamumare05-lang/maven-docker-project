pipeline {
    agent any

    tools {
        jdk 'JDK17'
        maven 'Maven'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/cjcnkolhe/B53_springbootjavaapp_docker_maven_jenkins.git'
            }
        }

        stage('Build using Maven') {
            steps {
                sh 'java -version'
                sh 'mvn -version'
                sh 'mvn clean package'
            
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t myapp:latest .'
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                    docker stop myappcontainer || true
                    docker rm myappcontainer || true
                    docker run -d --name myappcontainer -p 8081:8080 myapp:latest
                '''
            }
        }
    }
}
