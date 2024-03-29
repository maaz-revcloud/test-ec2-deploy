#!/bin/bash

# Source the user's environment to ensure PATH settings are loaded
source ~/.bashrc

# Change directory to the project directory
cd /home/ubuntu/ec2-deploy-test

# Pull the latest changes from the main branch
git pull origin main

# Install dependencies using npm
npm install

# Restart the application using pm2
pm2 restart index.js
