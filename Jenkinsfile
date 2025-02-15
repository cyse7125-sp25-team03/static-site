node {
    def tag = ''
    stage('Clone repository') {
        checkout scm
    }
    stage('Determine Git Tag') {
        tag = sh(returnStdout: true, script: "git rev-parse --short=10 HEAD").trim()
    }
    stage('Build and Push multi-platform image') {
        withCredentials([string(credentialsId: 'docker-pat', variable: 'DOCKER_PAT')]) {
            sh '''
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
