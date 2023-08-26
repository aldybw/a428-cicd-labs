node {
    stage('Build') {
        docker.image('node:16-buster-slim').inside('-p 3200:3200') {
            sh 'npm install'
        }
    }
    stage('Test') {
        docker.image('node:16-buster-slim').inside('-p 3200:3200') {
            sh './jenkins/scripts/test.sh'
        }
    }
}

node {
    docker.image('node:16-buster-slim').inside('-p 3000:3000'){
        stage('Build') {
            checkout scm
            sh 'npm install'
        }
        stage('Test') {
            checkout scm
            sh './jenkins/scripts/test.sh'
        }
    }
}