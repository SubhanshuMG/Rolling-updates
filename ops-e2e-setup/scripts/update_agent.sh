#!/bin/bash

# Update Agent Script for Node Operators
# Author: bitsCrunch

IMAGE="bitscrunch:latest"
HEALTH_CHECK_URL="http://localhost:8080/health"
ROLLBACK_IMAGE="bitscrunch:stable"

# Pull the latest image
docker pull $IMAGE

# Restart services with the new image
docker-compose down
docker-compose up -d

# Perform health check
if curl -f $HEALTH_CHECK_URL; then
  echo "Update successful"
else
  echo "Health check failed. Rolling back..."
  docker pull $ROLLBACK_IMAGE
  docker-compose down
  docker-compose up -d
fi