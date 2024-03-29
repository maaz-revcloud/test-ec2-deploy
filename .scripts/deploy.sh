#!/bin/bash

export PATH="$PATH:/usr/local/bin"  # Add /usr/local/bin to PATH

cd /home/ubuntu/ec2-deploy-test
git pull origin main

sudo su <<EOF
cd /home/ubuntu/ec2-deploy-test
npm install
pm2 restart index.js
EOF
