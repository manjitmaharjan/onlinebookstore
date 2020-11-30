pipeline {
    agent { node { label 'master' } }

    environment {
        TEST_PREFIX = "test-IMAGE"
        
    }
    
     stages {

         stage("Getting Information Regarding Build") {
            steps {
                 echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
                
                
            }
         
          stage("Compile Package") {
            steps {
                sh "/usr/bin/mvn package"
                
                
            }
        }
         }
