#!/bin/bash

# Source the user's environment to ensure PATH settings are loaded
source ~/.bashrc

# Change directory to the project directory
cd /home/ubuntu/ec2-deploy-test

# Pull the latest changes from the main branch
git pull origin main

# Ensure npm and pm2 are available in the PATH
export PATH=$PATH:$(npm bin):$(pm2 info path)

# Install dependencies using npm
npm install

# Restart the application using pm2
pm2 restart index.js
