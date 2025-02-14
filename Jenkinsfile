node {    
      def app     
      stage('Clone repository') {               
             
            checkout scm    
      }     
      stage('Build image') {         
       
            app = docker.build("roarceus/static-site")    
       } 
       stage('Push image') {
       docker.withRegistry('https://registry.hub.docker.com', 'docker-pat') {            
       app.push("${env.BUILD_NUMBER}")            
       app.push("latest")        
              }    
           }
        }