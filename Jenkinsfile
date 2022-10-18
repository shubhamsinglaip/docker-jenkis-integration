pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                echo 'building docker image'
                sh('docker build -t shubham030899/dockerjenkinsintegration .')
            }
        }
        stage('Publish to Hub/Registry') {
            steps {               
                sh('docker login -u shubham030899 -p Qazwsxedcrfv@030899')
                echo "successfully connected to Docker-Hub"
                echo 'publishing to Hub'
                sh('docker push shubham030899/dockerjenkinsintegration')
                echo 'pushed image to docker hub'
            }
        }
        stage('pull image from hub/registry') {
            steps {
                echo 'pulling image from docker hub'
                sh('docker pull shubham030899/dockerjenkinsintegration')
                echo 'pulled image '
                sh('docker images')
            }
        }
        stage('start a container') {
            steps {
               sh '''if [ $(docker ps | awk \'{print $NF}\' | grep shubhamcontainer) = \'shubhamcontainer\' ]; then
                        docker stop "shubhamcontainer"
                        docker rm "shubhamcontainer"
                fi'''
                sh('docker run -it -d -p 8082:80 --name shubhamcontainer shubham030899/dockerjenkinsintegration')
                sh('docker exec shubhamcontainer service nginx start')
            }
        }
    }
}
