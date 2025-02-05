pipeline {
    agent any

    environment{
        SCANNER_HOME = tool 'sonar-scanner'
    }
    stages {
        stage('SonarQube-analysis') {
            steps {
                script {
                    echo "Sonar scanner"
                    withSonarQubeEnv('sonar-server') {
                    sh '''
                      ${SCANNER_HOME}/bin/sonar-scanner \
                      -Dsonar.projectKey=nodekey \
                      -Dsonar.projectName=nodejs 
                      '''
                    }     
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    echo "docker build"
                    if (env.GIT_BRANCH == 'origin/dev') {
                        sh 'docker build -t danushvithiyarth/dev:latest .'
                    } else if (env.GIT_BRANCH == 'origin/main') {
                        sh 'docker build -t danushvithiyarth/prod:latest .'
                    }
                }
            }
        }
        stage('Push') {
            steps {
                script {
                    sh 'docker login -u "danushvithiyarth" -p "$Docker_pass" docker.io'
                    if (env.GIT_BRANCH == 'origin/dev') {
                        sh 'docker push danushvithiyarth/dev:latest'
                    } else if (env.GIT_BRANCH == 'origin/main') {
                        sh 'docker push danushvithiyarth/prod:latest'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'docker ps -aq | xargs -r docker rm -f'
                    if (env.GIT_BRANCH == 'origin/dev') {
                        sh 'docker run -d -p 800:80 danushvithiyarth/dev:latest'
                    } else if (env.GIT_BRANCH == 'origin/main') {
                        sh 'docker run -d -p 80:80 danushvithiyarth/prod:latest'
                    }
                }
            }
        }
        stage('Cleanup') {
            steps {
                script {
                    sh 'docker image prune -f'
                }
            }
        }
    }
}
