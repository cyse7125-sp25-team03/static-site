# Dockerfile
FROM caddy:2.7-alpine

# Copy configuration and content
COPY Caddyfile /etc/caddy/Caddyfile
COPY index.html /usr/share/caddy/index.html

# Expose port 8080
EXPOSE 8080