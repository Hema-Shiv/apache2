pipeline{
    agent {label 'assignment'}
    environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    stages{
         stage('Build docker image'){
            steps{
                sh 'docker build -t hemaj/ubuntu:$BUILD_NUMBER . '
            }
         }
        stage('login to dockerhub') {
            steps{
             sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                }
            }
        stage('push image'){
            steps{
                sh "docker push hemaj/ubuntu:$BUILD_NUMBER"
            }   
        }
        stage('depoly on dockerhost'){
            steps{
                sh "docker stop apache"
                sh "docker rm apache"
                sh "docker run -d --name apache -p 80:80 hemaj/ubuntu:$BUILD_NUMBER"
            }
            }
       }
    
}
