#!/bin/bash

# Define the path to npm (adjust this according to your system setup)
NPM_PATH=$(which npm)

# Define the path to pm2 (adjust this according to your system setup)
PM2_PATH=$(which pm2)

# Source the user's bash profile to ensure environment setup, including PATH, is loaded
source ~/.bash_profile  # or ~/.bashrc depending on the user's setup

# Change directory to the project directory
cd /home/ubuntu/ec2-deploy-test

# Ensure npm is available in the PATH
export PATH=$PATH:/path/to/npm/bin   # Adjust this path according to your system setup

# Pull the latest changes from the main branch
git pull origin main

# Install dependencies using npm
$NPM_PATH install

# Restart the application using pm2
$PM2_PATH restart index.js
