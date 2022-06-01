pipeline {
    environment {
        registry = "20.29.193.150:8085/react-image"
        dockerImage = ''
        registryCredential = 'NEXUS_ID'
    }
   agent any
   stages {
      stage('clone repo') {
          steps {
              git credentialsId: 'GITHUB_ID', url: 'https://github.com/Amulya625/react_sampleapp.git'
            } 
        }  
        stage('Building image') {
            steps{
                script {
                 dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }    
        }
        stage('Login to Nexus Repository'){
            steps{
                script {
                    sh 'docker login -u admin -p Ammu@2506 20.29.193.150:8085/react-image'     
                    dockerImage.push()
                }
            }
        } 
        stage('Deploy using SSH steps') {
            steps {
                script {
                    def remote = [:]
                    remote.name = "minikube"
                    remote.host = "20.118.166.214"
                    remote.user = "azureuser"
                    remote.password = "Amulya@9703006654"
                    remote.allowAnyHosts = true  
                    sshPut remote: remote, from: 'deployment.yaml', into: '.'
                    sshCommand remote: remote,command: "kubectl apply -f deployment.yaml"
                }
            }
        }                     
   }        
}          