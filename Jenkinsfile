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
        stage('Deploy') {
            input message: 'Lanjutkan ke tahap Deploy? (Klik "Proceed" untuk melanjutkan eksekusi pipeline ke tahap Deploy atau "Abort" untuk menghentikan eksekusi pipeline)' 
            checkout scm
            sh './jenkins/scripts/deliver.sh'
            sleep time: 1, unit: 'MINUTES'
            // input message: 'Sudah selesai menggunakan React App? (Klik "Proceed" untuk mengakhiri)' 
            sh './jenkins/scripts/kill.sh'
        }
    }
}