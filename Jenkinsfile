pipeline {
    agent any
    environment {
      DOCKERHUB_CREDENTIALS = credentials('DockerHub')
      backendImageTag = "${BUILD_NUMBER}"
  }
    tools{
        maven 'Maven'
        jdk 'jdk'
    }            
 stages {
    stage('MVN CLEAN'){
            steps {
                sh "mvn clean"
            }
        }
    stage("Tests ") {
            steps{
                sh "mvn test"
            }
        }
    stage('maven package') {
		 steps {
			sh 'mvn package'
		   }
        }
    stage("MVN SonarQube") {
        steps {
        sh "mvn sonar:sonar \
      -Dsonar.projectKey=sonarqube \
      -Dsonar.host.url=http://192.168.2.128:9000 \
      -Dsonar.login=889588cb127c0a275580f95ab92f4683ef07a853"
      }
    } 
    stage('Build docker image'){
        steps {              
    //      sh 'docker images'
            sh 'docker build -t olfarejeb/back-ecommerce:${backendImageTag} .'
        }
    }
    stage('docker Login & push') {
        steps {
              sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
              sh 'docker push olfarejeb/back-ecommerce:${backendImageTag}'
        }
    }
    stage('deploy k8s'){
       steps {
           sh "sed -i 's|__IMAGE_NAME__|olfarejeb/back-ecommerce|g; s|__IMAGE_TAG__|${backendImageTag}|g' deployement.yml"
           kubernetesDeploy (configs:'deployement.yml', kubeconfigId:'k8sconfigid')
       }
    }
 }
}
