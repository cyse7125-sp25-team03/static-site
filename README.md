# static-site
This repository contains a static HTML website that displays team information.
## Project Structure
```
static-site/
├── Caddyfile     # Configuration for Caddy web server
├── Dockerfile    # Defines the instructions for building Docker image
├── index.html    # Static website with team information
├── Jenkinsfile   # CI/CD pipeline configuration for Jenkins
```

1. `Caddyfile`: Contains configuration for a simple web server that provides a /healthz endpoint for health checks.
2. `Dockerfile`: Contains instructions for building a Docker image.
3. `index.html`: A static HTML page displaying team information.
4. `Jenkinsfile`: Defines the CI/CD pipeline steps for building a Docker image and pushing it to Dockerhub with the commit hash as image tag.



