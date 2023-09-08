node {
    docker.image('timbru31/node-alpine-git:16').inside('-p 3000:3000') {
        withEnv(["GITHUB_REPOSITORY=aldybw/a428-cicd-labs", 'PUBLIC_URL=https://aldybw.github.io/a428-cicd-labs']) {
            withCredentials([string(credentialsId: 'jenkins-github-token', variable: 'GITHUB_TOKEN')]) {
                try {
                    stage('Build') {
                        checkout scm
                        sh 'npm install'
                    }
                    stage('Test') {
                        checkout scm
                        sh './jenkins/scripts/test.sh'
                    }
                    stage('Deploy') {
                        checkout scm
                        input message: 'Lanjutkan ke tahap Deploy? (Klik "Proceed" untuk melanjutkan eksekusi pipeline ke tahap Deploy atau "Abort" untuk menghentikan eksekusi pipeline)' 
                        sh './jenkins/scripts/deliver.sh'
                        sleep time: 1, unit: 'MINUTES'
                        sh './jenkins/scripts/kill.sh'
                        sh 'chmod +x ./jenkins/scripts/github-pages.sh && ./jenkins/scripts/github-pages.sh'
                    }
                } finally {
                    archiveArtifacts artifacts: 'build/**/*', fingerprint: true
                }
            }
        }
    }
}