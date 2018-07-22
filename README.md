# devsecops-pipeline

Deploy serverless function with custom domain and Inspec test:

* create a Jenkins server in AWS using https://github.com/celidor/devsecops-jenkins
* create a SCM pipeline pointing to this repository
* run the pipeline

Stages:

* build
* unit test
* dev deploy and test
* test deploy and test
* create custom domain
* prod deploy and test
* inspec test
