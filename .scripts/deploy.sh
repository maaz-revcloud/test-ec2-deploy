#!/bin/bash

sudo su - <<EOF
cd /home/ubuntu/ec2-deploy-test
git pull origin main
sudo npm install
sudo pm2 restart index.js
EOF
