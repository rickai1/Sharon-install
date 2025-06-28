#!/bin/bash

# Update and install dependencies
sudo apt update && sudo apt upgrade -y
sudo apt install -y docker.io git

# Enable Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Create Sharon directory and move into it
mkdir -p ~/sharon
cd ~/sharon

# Create a dummy docker-compose.yml (we'll update it later)
cat <<EOF > docker-compose.yml
version: '3'
services:
  sharon:
    image: ghcr.io/rickai1/sharon:latest
    restart: always
    ports:
      - "7860:7860"
    volumes:
      - ./data:/app/data
    environment:
      - API_KEY=your_key_here
      - MODE=live
EOF

# Run Docker Compose
sudo docker compose up -d

echo "✅ Sharon is installed and running!"
