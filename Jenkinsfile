#!/usr/bin/env groovy

pipeline {
  agent none
  stages {
    stage('Checkout repo') {
      agent any
      steps {
        checkout scm: [$class: 'GitSCM',
            poll: false,
            branches: [[name: "$BRANCH"]],
            doGenerateSubmoduleConfigurations: false,
            userRemoteConfigs: [[refspec: 'refs/changes/*:refs/changes/*',
                                 url: "git@github.com:sagar-khanna/test-jenkinsfile.git"]]]
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t centos:sagar-jenkins-test .'
      }
    }
  }
}