#!groovy

pipeline {
    agent any

    environment {
        AWS_REGION = 'eu-west-1'
    }

    stages {
        stage('setup'){
        steps {
            sh 'export ENVIRONMENT = csa1'
            sh 'export DOMAIN = celidor.uk'
            }
        }
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
        stage('Dev (Deploy)') {
            environment {
                AWS_STAGE = 'dev'
            }
            steps {
                sh 'export STAGE = dev'
                sh 'serverless create_domain'
                sh 'serverless deploy -s dev'
            }
        }
        stage('Inspec Test'){
            steps {
                sh 'inspec exec test/api-ping/controls/ping.rb'
            }
        }
    }
}
