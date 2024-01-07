# Use an Alpine Linux base image
FROM alpine:latest

# Install Git and GitHub CLI using the package manager
RUN apk update && \
    apk add --no-cache git github-cli

# ONBUILD instructions
# These instructions are executed when a derived image is being built
ONBUILD COPY entrypoint.sh /entrypoint.sh
ONBUILD RUN chmod +x /entrypoint.sh

# Set the entrypoint script to be executed when the container starts
ENTRYPOINT ["/entrypoint.sh"]
