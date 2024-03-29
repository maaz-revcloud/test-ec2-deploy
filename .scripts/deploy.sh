#!/bin/bash

# Define the path to npm (adjust this according to your system setup)
NPM_PATH=$(which npm)

# Change directory to the project directory
cd /home/ubuntu/ec2-deploy-test

# Ensure npm is available in the PATH
export PATH=$PATH:/path/to/npm/bin   # Adjust this path according to your system setup

# Pull the latest changes from the main branch
git pull origin main

# Install dependencies using npm
$NPM_PATH install

# Restart the application using pm2
pm2 restart index.js
