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

        
        stage ('Sonar') {
            steps {
               
 sh 'mvn sonar:sonar -Dsonar.projectKey=keyspring -Dsonar.host.url=http://44.198.246.87:9000  -Dsonar.login=64ca48605093d2e1b3ca9abcca1a57ec6816ec28'
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
