# Use an Alpine Linux base image
FROM alpine:latest

# Install Git and GitHub CLI using the package manager
RUN apk update && \
    apk add --no-cache git github-cli

# Copy the entrypoint script and set permissions
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint script to be executed when the container starts
ENTRYPOINT ["/entrypoint.sh"]
