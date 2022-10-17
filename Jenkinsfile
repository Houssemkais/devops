pipeline {
    agent any 
    
    stages {
        stage ('Git') {
            steps {
                
                //git 'https://github.com/mhassini/timesheet-devops.git'
                git 'https://github.com/Zeroxcharisma/CI-CD.git'
            }
        }
        stage ('Maven Clean') {
            steps {
//                sh 'cd achat'
                sh 'mvn clean'
            }
        }
        stage ('Maven Compile') {
            steps {
//                sh "cd achat"
                sh "mvn compile"
            }
        }

        
     stage ('Scan and Build Jar File') {
            steps {
               withSonarQubeEnv(installationName: 'SonarQube Scanner', credentialsId: 'sonqubeforgeneration') {
                sh 'mvn clean package sonar:sonar'
                }
            }
        }
          
        }

        stage ('Maven Test JUnit') {
            steps {
                echo 'hello world'
            }
        }
        stage ('Maven Deploy Nexus') {
            steps {
                sh 'mvn deploy'
            }
        }
    }
}
