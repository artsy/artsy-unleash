#!/bin/bash

# Variables
ECR="585031190124.dkr.ecr.us-east-1.amazonaws.com"
ECR_REPO="$ECR/artsy-unleash-proxy"
IMAGE_TAG="latest"

# Authenticate Docker to ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ECR
if [ $? -ne 0 ]; then
  echo "Error: Failed to authenticate Docker to ECR"
  exit 1
fi

# Build the Docker image
docker build --platform linux/amd64 -t $ECR_REPO:$IMAGE_TAG -f Dockerfile.proxy .
if [ $? -ne 0 ]; then
  echo "Error: Failed to build Docker image"
  exit 1
fi

# Push the Docker image to ECR
docker push $ECR_REPO:$IMAGE_TAG
if [ $? -ne 0 ]; then
  echo "Error: Failed to push Docker image to ECR"
  exit 1
fi
