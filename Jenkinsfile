node {    
      def app     
      stage('Clone repository') {               
             
            checkout scm    
      }     
      stage('Build image') {         
       
            app = docker.build("roarceus/static-site")    
       } 
       stage('Push image') {

       def tag = sh(returnStdout: true, script: "git rev-parse --short=10 HEAD").trim()` 
       docker.withRegistry('https://registry.hub.docker.com', 'docker-pat') {            
       app.push("${tag}")            
       app.push("latest")        
              }    
           }
        }