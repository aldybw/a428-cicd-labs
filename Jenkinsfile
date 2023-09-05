node {
    docker.image('timbru31/node-alpine-git:16').inside('-p 3000:3000') {
        withEnv(['GITHUB_TOKEN=credentials('jenkins-github-token')', 'GITHUB_REPOSITORY=aldybw/a428-cicd-labs']) {
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

// pipeline {
//     agent {
//         docker {
//             image 'timbru31/node-alpine-git:16' 
//             args '-p 3000:3000' 
//         }
//     }
//     environment {
//         GITHUB_TOKEN     = credentials('jenkins-github-token')
//         GITHUB_REPOSITORY = 'aldybw/a428-cicd-labs'
//     }
//     stages {
//         stage('Build') { 
//             steps {
//                 sh 'npm install' 
//             }
//         }
//         stage('Test') {
//             steps {
//                 sh './jenkins/scripts/test.sh'
//             }
//         }
//         stage('Deploy') {
//             steps {
//                 sh './jenkins/scripts/deliver.sh'
//                 input message: 'Sudah selesai menggunakan React App? (Klik "Proceed" untuk mengakhiri)'
//                 sh './jenkins/scripts/kill.sh'
//                 sh 'chmod +x ./jenkins/scripts/github-pages.sh && ./jenkins/scripts/github-pages.sh'
//             }
//         }
//     }
//     post {
//         always {
//             archiveArtifacts artifacts: 'build/**/*', fingerprint: true
//         }
//     }
// }
