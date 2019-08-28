pipeline {

  environment {
    registry = "166427690327.dkr.ecr.us-east-1.amazonaws.com/nodeapp"
    registryCredential = 'ecr:us-east-1:aws_ecr'
  }

  agent any

  stages {
        stage("Cloning") {
              steps {
                git "https://github.com/clarencecloud/csye7374-fall2018.git"
              }
    }
    stage('Building image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}
