#!/bin/bash

cd /home/ubuntu/ec2-deploy-test
git pull origin main

sudo su <<EOF
cd /home/ubuntu/ec2-deploy-test
/root/.nvm/versions/node/v20.11.0/bin/npm install   
/root/.nvm/versions/node/v20.11.0/bin/pm2 restart index.js 
EOF
