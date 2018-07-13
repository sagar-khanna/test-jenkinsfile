#!/usr/bin/env groovy

pipeline {
  agent none
  stages {
    stage('Checkout repo') {
      agent any
      steps {
        checkout scm
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
