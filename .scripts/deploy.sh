#!/bin/bash

# Navigate to the directory where the script resides
cd "$(dirname "$0")" || exit

# Navigate to the project directory
cd /home/ubuntu/ec2-deploy-test || exit

# Pull the latest changes from the main branch of the git repository
git pull origin main || { echo "Failed to pull latest changes from git repository"; exit 1; }

# Determine the installed version of Node.js
NODE_VERSION=$(node -v)
echo "Node.js version: $NODE_VERSION"

# Switch to root user and execute commands
sudo su - <<EOF
# Source .bashrc to ensure environment variables are set
source /root/.bashrc

# Navigate to the project directory
cd /home/ubuntu/ec2-deploy-test || exit

# Install dependencies using npm
/root/.nvm/versions/node/$NODE_VERSION/bin/npm install || { echo "Failed to install npm dependencies"; exit 1; }

# Restart the application using pm2
/root/.nvm/versions/node/$NODE_VERSION/bin/pm2 restart index.js || { echo "Failed to restart the application using pm2"; exit 1; }
EOF
