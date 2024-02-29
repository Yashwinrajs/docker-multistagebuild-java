pipeline {

agent {label 'Docker'}

environment {     
    DOCKERHUB_CREDENTIALS= credentials('dockerhubcredentials')     
}

stages {
  stage('Git checkout') {
    steps {
      git branch: 'main', url: 'https://github.com/Yashwinrajs/docker-multistagebuild-java.git'
    }
  }

  stage('build') {
    steps {
      sh 'docker build -t java-jar:v1 .'
      echo 'docker image is built'
    }
  }

  stage('Login to Dockerhub') {
    steps {
      sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'                		
      echo 'Login Completed'
    }
  }

  stage('Pushing Image to dockerhub') {
    steps {
      sh 'docker push yash545/java-jar:v1'
      echo 'Push Image Completed'
    }
  }

  stage('deploy') {
    steps {
      sh "docker run java-jar:v1"
    }
  }
  }
}
