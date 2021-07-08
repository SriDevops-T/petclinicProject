pipeline
{
    agent
    {
        label 'master'
    }
    options { buildDiscarder(logRotator(numToKeepStr: '1')) }
    tools
    {
        maven 'MAVEN'
    }
    
    stages
    {
        stage("checkout")
        {
            steps
            {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'petrepo', url: 'https://github.com/SriDevops-T/petclinicProject.git']]])
            }
        }
        stage("'build")
        {
            steps
            {
                sh "mvn package"
            }
        }
        stage("SonarQube-Code Analysis")
        {
            steps
            {
                withSonarQubeEnv('sonar') {
    sh 'mvn -U clean install sonar:sonar'
}
            }
        }
        stage ('Artifactory configuration') {
            steps {
                rtServer (
                    id: "jfrog",
                    url: "http://34.212.121.64:8081/artifactory",
                    credentialsId: "jfrog"
                )

                rtMavenDeployer (
                    id: "MAVEN_DEPLOYER",
                    serverId: "jfrog",
                    releaseRepo: "libs-release-local",
                    snapshotRepo: "libs-snapshot-local"
                )

                rtMavenResolver (
                    id: "MAVEN_RESOLVER",
                    serverId: "jfrog",
                    releaseRepo: "libs-release",
                    snapshotRepo: "libs-snapshot"
                )
            }
    }

stage ('Deploy Artifacts') {
            steps {
                rtMavenRun (
                    tool: "MAVEN", // Tool name from Jenkins configuration
                    pom: 'pom.xml',
                    goals: 'clean install',
                    deployerId: "MAVEN_DEPLOYER",
                    resolverId: "MAVEN_RESOLVER"
                )
         }
    }
    stage ('Publish build info') {
            steps {
                rtPublishBuildInfo (
                    serverId: "jfrog"
             )
        }
    }
    
stage('Copy Dockerfile & Playbook to Ansible Server') {
            
            steps {
                  sshagent(['sshkey']) {
                      dir("/var/lib/jenkins/workspace/DEMOCICDPIPELINE")
                      {
                       sh "scp -o StrictHostKeyChecking=no Dockerfile ec2-user@35.160.235.224:/home/admin"
                      }
                    }
                }
            
        } 
    }
   
}
