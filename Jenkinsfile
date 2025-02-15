node {
    stage('Clone repository') {
        checkout scm
    }
    stage('Build and Push multi-platform image') {
      def tag = sh(returnStdout: true, script: "git rev-parse --short=10 HEAD").trim()
       withCredentials([usernamePassword(credentialsId: 'docker-pat', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_TOKEN')]){
            sh '''
             docker login -u ${DOCKER_USERNAME} -p ${DOCKER_TOKEN}
                docker buildx create --use --name builder || docker buildx use builder
                docker buildx inspect --bootstrap

                # Build and push the multi-platform image for linux/amd64, linux/arm64, and linux/arm/v7
                docker buildx build \
                    --platform linux/amd64,linux/arm64,linux/arm/v7 \
                    -t roarceus/static-site:${tag} \
                    -t roarceus/static-site:latest \
                    --push .
            '''
        }
    }
}

