pipeline {
    agent any 
        environment {
        NEXUS_VERSION = "nexus3"
        NEXUS_PROTOCOL = "http"
        NEXUS_URL = "44.198.246.87:8081"
        NEXUS_REPOSITORY = "achat"
        NEXUS_CREDENTIAL_ID = "nexus-credentials"
        }    
    stages {
        stage ('Git') {
            steps {
                
                //git 'https://github.com/mhassini/timesheet-devops.git'
                git 'https://github.com/kaoutherchalbi/devops.git'
            }
        }
        stage ('Maven Clean') {
            steps {

                sh 'mvn clean'
            }
        }
        stage ('Maven Compile') {
            steps {

                sh "mvn compile"
            }
        }

        
     stage ('Scan and Build Jar File') {
            steps {
               withSonarQubeEnv(installationName: 'SonarQube Scanner', credentialsId: 'Sonarqubetoken') {
                sh 'mvn clean package sonar:sonar'
                }
            }
        
          
        }

        stage ('Maven Test JUnit') {
            steps {
                echo 'hello world'
            }
        }
        
        
        
        
        stage('email'){
 
 steps {

 mail bcc: '', body: '''Hello from kaouther,
 Devops Pipeline with success.

 Cordialement''', cc: '', from: '', replyTo: '', subject: 'Devops Timesheet', to: 'kaouther.chalbi@esprit.tn'
    
 }}
        
        
        
        
        stage("Publish to Nexus Repository Manager") {
            steps {
                script {
                    pom = readMavenPom file: "pom.xml";
                    filesByGlob = findFiles(glob: "target/*.${pom.packaging}");
                    echo "${filesByGlob[0].name} ${filesByGlob[0].path} ${filesByGlob[0].directory} ${filesByGlob[0].length} ${filesByGlob[0].lastModified}"
                    artifactPath = filesByGlob[0].path;
                    artifactExists = fileExists artifactPath;
                    if(artifactExists) {
                        echo "*** File: ${artifactPath}, group: ${pom.groupId}, packaging: ${pom.packaging}, version ${pom.version}";
                        nexusArtifactUploader(
                            nexusVersion: NEXUS_VERSION,
                            protocol: NEXUS_PROTOCOL,
                            nexusUrl: NEXUS_URL,
                            groupId: pom.groupId,
                            version: pom.version,
                            repository: NEXUS_REPOSITORY,
                            credentialsId: NEXUS_CREDENTIAL_ID,
                            artifacts: [
                                [artifactId: pom.artifactId,
                                classifier: '',
                                file: artifactPath,
                                type: pom.packaging],
                                [artifactId: pom.artifactId,
                                classifier: '',
                                file: "pom.xml",
                                type: "pom"]
                            ]
                        );
                    } else {
                        error "*** File: ${artifactPath}, could not be found";
                    }
                }
            }
    }
}
}
    
