#!/bin/bash

echo "-------------------------------------------------------"
echo "Starting Professional Deployment..."
echo "-------------------------------------------------------"

# Run the Docker Build
sudo docker-compose up -d --build

# Get the Local IP Address
IP_ADDR=$(hostname -I | awk '{print $1}')

echo ""
echo "DEPLOYMENT COMPLETE"
echo "-------------------------------------------------------"
echo "ACCESS YOUR SERVER AT:"
echo "--> http://$IP_ADDR:8080"
echo "--> http://localhost:8080"
echo "-------------------------------------------------------"
echo "CONTAINER STATUS:"
sudo docker ps --filter "name=web-server" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
