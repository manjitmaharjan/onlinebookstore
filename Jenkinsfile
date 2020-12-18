pipeline {
    agent { node { label 'master' } }
    
     stages {
          
        stage('Git clone'){
      
          steps{
              checkout([$class: 'GitSCM', branches: [[name: '*/J2EE']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [],    userRemoteConfigs: [[credentialsId: 'dd6df3a6-4b85-45f4-ae53-dcbcc29a0f56', url: 'https://github.com/manjitmaharjan/onlinebookstore.git']]])
               }
            }

        stage('sonarqube'){

          steps{
            script{ def sonarhome = tool name: 'SQ', type: 'hudson.plugins.sonar.SonarRunnerInstallation';
                    withSonarQubeEnv(credentialsId: 'sonarqub')
                  {
                   sh "${sonarhome}/bin/sonar-scanner "
                  }   
               }
            }
        }
       
         stage('Compile Package'){
      
          steps{
              script{
                   def mvnHome = tool name: 'mvn', type: 'maven'
                   
                       sh "${mvnHome}/bin/mvn clean install"
                  //{
                  //sh "mvn clean install"
                  
               }
            }
         }
         stage('test'){
         steps{
              script{
                   def mvnHome = tool name: 'mvn', type: 'maven'
                   
                       sh "${mvnHome}/bin/mvn test"
                  //{
                  //sh "mvn clean install"
                  
               }
            }
         }
               
         stage('Deploying Application'){
      
          steps{
                  sh "/var/lib/jenkins/workspace/docker.sh"
               }
                post {
                always {
                    echo "always forever"
                  }
                success {
                    // we only worry about archiving the jar file if the build steps are successful
                    archiveArtifacts(artifacts: 'target/*.war', allowEmptyArchive: true)
                }
              failure {
                  echo "failed"
               }
           }
        }

       
    }
}
