# devsecops-pipeline

Deploy serverless function with custom domain and Inspec test:

* create a Jenkins server in AWS using https://github.com/celidor/devsecops-jenkins
* create a SCM pipeline pointing to this repository
* run the pipeline

Stages:

* build
* unit test
* dev deploy
* create test custom domain
* test deploy
* inspec test
* create prod custom domain
* prod deploy
* inspec prod

![alt text](devsecops-pipeline.png "DevSecOps Pipeline")

## delete serverless function

* start with a dry run
* default region is us-east-1, change if needed using --region argument
* default AWS credential profile is used, change if needed using --profile argument

```
cd resources/python27
python delete-serverlessenv.py --env {YOUR-ENVIRONMENT-NAME} --dry_run
```
* then delete resources
```
python delete-serverlessenv.py --env {YOUR-ENVIRONMENT-NAME}
```
