#!/bin/bash

# Login to AWS ECR
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 200174251764.dkr.ecr.ap-south-1.amazonaws.com

# Pull the latest Docker images from ECR
docker pull 200174251764.dkr.ecr.ap-south-1.amazonaws.com/masterproject/api-core:latest
docker pull 200174251764.dkr.ecr.ap-south-1.amazonaws.com/masterproject/app-core:latest


# Stop the existing containers
docker stop api-core || true
docker rm api-core || true
docker stop app-core || true
docker rm app-core || true


# Run the new containers
docker run -d -p 8080:8080 --name api-core 200174251764.dkr.ecr.ap-south-1.amazonaws.com/masterproject/api-core:latest
docker run -d -p 4200:4200 --name app-core 200174251764.dkr.ecr.ap-south-1.amazonaws.com/masterproject/app-core:latest
