node
{
    stage('Git clone')
    {
        checkout([$class: 'GitSCM', branches: [[name: '*/J2EE']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'dd6df3a6-4b85-45f4-ae53-dcbcc29a0f56', url: 'https://github.com/manjitmaharjan/onlinebookstore.git']]])
    }
   
    stage('sonarqube')
    {
       def sonarhome = tool name: 'SQ', type: 'hudson.plugins.sonar.SonarRunnerInstallation';
        withSonarQubeEnv(credentialsId: 'sonarqub') {
         sh "${sonarhome}/bin/sonar-scanner "
          
     }
    }
    
    
    stage('build')
    {
        sh "mvn clean install"
    }
    
    stage('Deploying application')
    {
        sh "/var/lib/jenkins/workspace/docker.sh"
    }
    
    
}
