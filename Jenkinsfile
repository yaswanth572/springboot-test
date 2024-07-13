pipeline {
    agent any
    stages {
        stage ('GIT CHECKOUT') {
            steps {
                git url:'https://github.com/vickydevo/springboot-hello.git', branch:'main'
            }
        }// stage1
        stage ('MAVEN BUILD') {
            steps {
            sh '''
                mvn clean install
                '''
            }
        }//stage2 
        stage ('DOCKER BUILD') {
            steps {
                sh '''
                docker build -t spring-boot:v1 .
                docker tag spring-boot:v1 vignan91/spring-boot:v1
                echo "######################################"
                echo "     DOCKER TAG IS COMPLETED             "
                echo "######################################"
                '''
            }
        }// stage3
        stage ('DOCKER LOGIN PUSH') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh '''
                    echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                     echo "######################################"
                     echo "     DOCKER LOGIN IS COMPLETED             "
                     echo "######################################"
                     docker push vignan91/spring-boot:v1
                     echo "######################################"
                     echo "     DOCKER PUSH IS COMPLETED             "
                     echo "######################################"
                    '''
                }
            }
        }// stage4
        // stage ('DOCKER BUILD') {}// stage5
        // stage ('DOCKER LOGIN') {}// stage6
        // stage ('DOCKER BUILD') {}// stage7
        // stage ('DOCKER LOGIN') {}// stage8
    } //stages
}//pipeline close
