node {
    docker.image('timbru31/node-alpine-git:16').inside('-p 3000:3000') {
        withEnv(["GITHUB_TOKEN=credentials('jenkins-github-token')", "GITHUB_REPOSITORY=aldybw/a428-cicd-labs"]) {
            try {
                stage('Build') {
                    // checkout scm
                    sh 'npm install'
                }
                stage('Test') {
                    // checkout scm
                    sh './jenkins/scripts/test.sh'
                }
                stage('Deploy') {
                    input message: 'Lanjutkan ke tahap Deploy? (Klik "Proceed" untuk melanjutkan eksekusi pipeline ke tahap Deploy atau "Abort" untuk menghentikan eksekusi pipeline)' 
                    // checkout scm
                    sh './jenkins/scripts/deliver.sh'
                    sleep time: 1, unit: 'MINUTES'
                    // input message: 'Sudah selesai menggunakan React App? (Klik "Proceed" untuk mengakhiri)' 
                    sh './jenkins/scripts/kill.sh'
                    sh 'chmod +x ./jenkins/scripts/github-pages.sh && ./jenkins/scripts/github-pages.sh'
                }
            } finally {
                archiveArtifacts artifacts: 'build/**/*', fingerprint: true
            }
        }
    }
}