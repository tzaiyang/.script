pipeline {
    agent { docker 'maven:3.3.3' }
    stages {
        stage('build') {
            steps {
                sh 'mvn --version'
                sh '''
                    apt-get update
                    apt-get install sudo
                '''
                sh 'Development/Blockchain/docker.sh'
            }
        }
    }
}
