#!/bin/bash

# Configuration of the JupyterLab environment
DOCKERPATH="docker"
NAME="dockerjupyter"
VERSION="1.0"

# Path to the Dockerfile
DOCKERFILE="${DOCKERPATH}/Dockerfile"

# Building the Docker image
echo "🔨 Building Docker image: ${NAME}:${VERSION}"
docker buildx build --no-cache -t ${NAME}:${VERSION} -f ${DOCKERFILE} .

# Check if the build failed
if [ $? -ne 0 ]; then
    echo "❌ Build failed. Exiting."
    exit 1
fi

# Starting JupyterLab with docker-compose
echo "🚀 Starting JupyterLab with docker-compose"
docker-compose -f jupyter_docker-compose.yml up