pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script{
                    build()
                }
            }
        }
        stage('Deploy to DEV') {
            steps {
                script{
                    deploy("DEV", 1010)
                }
            }
        }
        stage('Tests on DEV') {
            steps {
                script{
                    test("DEV")
                }
            }
        }
        stage('Deploy to STG') {
            steps {
                script{
                    deploy("STG", 1020)
                }
            }
        }
        stage('Tests on STG') {
            steps {
                script{
                    test("STG")
                }
            }
        }
        stage('Deploy to PRD') {
            steps {
                script{
                    deploy("PRD", 1030)
                }
            }
        }
        stage('Tests on PRD') {
            steps {
                script{
                    test("PRD")
                }
            }
        }
    }
}

// for win: bat "npm ..."
// for mac/linux : sh "npm ..."
def build(){
    echo "Building of node application has started"
    // bat "dir"
    bat "npm -v"
    bat "npm install"
    bat "npm -v"
}

def deploy(String environment, int port){
    echo "Deployment to ${environment} has started"
    bat "sudo npm install -g pm2@latest"
    bat "pm2 delete ${environment}"
    bat "pm2 start -n \"${environment}\" index.js -- ${port}"
}

def test(String environment){
    echo "Testing on ${environment} has started"
    bat "npm test"
}