#!/bin/bash

# Source the user's environment to ensure PATH settings are loaded
source ~/.bashrc

# Change directory to the project directory
cd /home/ubuntu/ec2-deploy-test

# Pull the latest changes from the main branch
git pull origin main
ls
ls -l /root/.nvm/versions/node/v20.11.0/bin/npm


# NODE_PATH=/root/.nvm/versions/node/v20.11.0/bin/node  install

# # Define full paths to npm and pm2
NPM_PATH=/root/.nvm/versions/node/v20.11.0/bin/npm # Replace this with the actual path to npm if different
# PM2_PATH=/usr/bin/pm2  # Replace this with the actual path to pm2 if different

if [ ! -x "$NPM_PATH" ]; then
    echo "Granting execute permissions to npm..."
    sudo chmod +x "$NPM_PATH"
fi

$NPM_PATH install

# # Install dependencies using npm
# $NPM_PATH install

# # Restart the application using pm2
# $PM2_PATH restart index.js
