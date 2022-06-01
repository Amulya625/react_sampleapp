pipeline {
    environment {
        dockerImage = ''
    }
   agent any
   stages {
      stage('clone repo') {
          steps {
              git credentialsId: 'GITHUB_ID', url: 'https://github.com/Amulya625/react_sampleapp.git'
            } 
        }  
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
}          