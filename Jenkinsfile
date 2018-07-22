#!groovy

pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
    }

    stages {
        stage('Dev (Deploy & Test)') {
            environment {
                AWS_STAGE = 'dev'
            }
            steps {
                sh 'serverless deploy -s dev'
            }
        }
        stage('Test (Deploy & Test)') {
            environment {
                AWS_STAGE = 'test'
            }
            steps {
                sh 'serverless deploy -s test'
            }
        }
        stage('Prod (Deploy)') {
            environment {
                AWS_STAGE = 'prod'
            }
            steps {
                sh 'serverless create_domain'
                sh 'serverless deploy -s prod'
            }
        }
        stage('Inspec Test'){
            steps {
                sh 'inspec exec test/api-ping/controls/ping.rb'
            }
        }
    }
}
