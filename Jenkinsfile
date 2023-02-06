pipeline {
  agent any
  tools {
  
  maven 'maven'
   
  }
    stages {

      stage ('Checkout SCM'){
        steps {
         checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/SriDevops-T/petclinicProject.git']]])
        }
      }
	  
	  stage ('Build')  {
	      steps {
          
           
            sh "mvn package"
         
        }
         
      }
}
}

