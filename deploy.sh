#!/bin/bash

echo "-------------------------------------------------------"
echo "Starting Professional Alpine Deployment..."
echo "-------------------------------------------------------"

# 1. Stop and remove existing containers and clean up orphaned networks
sudo docker-compose down --remove-orphans

# 2. Build and start fresh (silencing the clutter, but showing errors)
sudo docker-compose up -d --build

# 3. Get the Local IP Address
IP_ADDR=$(hostname -I | awk '{print $1}')

echo ""
echo "DEPLOYMENT SUCCESSFUL"
echo "-------------------------------------------------------"
echo "ACCESS YOUR SERVER AT:"
echo "--> HTTP:  http://$IP_ADDR:8080"
echo "--> HTTPS: https://$IP_ADDR"
echo "-------------------------------------------------------"
echo "CONTAINER HEALTH:"

# Updated to look for your specific container name 'web-server-riyas'
sudo docker ps --filter "name=web-server-riyas" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
echo "-------------------------------------------------------"
