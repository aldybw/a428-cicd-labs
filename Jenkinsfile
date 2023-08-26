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