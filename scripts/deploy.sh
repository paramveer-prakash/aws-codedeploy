#!/bin/bash

# Login to AWS ECR
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 200174251764.dkr.ecr.ap-south-1.amazonaws.com

# Pull the latest Docker image from ECR
docker pull 200174251764.dkr.ecr.ap-south-1.amazonaws.com/masterproject/api-core:latest

# Stop the existing container
docker stop api-core || true
docker rm api-core || true

# Run the new container
docker run -d -p 8080:8080 --name api-core 200174251764.dkr.ecr.ap-south-1.amazonaws.com/masterproject/api-core:latest
