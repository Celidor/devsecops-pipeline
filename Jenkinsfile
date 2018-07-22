#!groovy

pipeline {
    agent any

    environment {
        AWS_REGION = 'eu-west-1'
    }

    stages {
        stage('Build'){
            steps {
                sh 'npm i'
            }
        }
        stage('Unit Test'){
            steps {
                sh 'npm test'
            }
        }
        stage('Test (Deploy & Test)') {
            environment {
                AWS_STAGE = 'test'
            }
            steps {
                sh './node_modules/.bin/sls deploy -s test'
            }
        }
        stage('Test (Deploy & Test)') {
            environment {
                AWS_STAGE = 'test'
            }
            steps {
                sh './node_modules/.bin/sls deploy -s test'
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
