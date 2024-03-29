#!/bin/bash

cd /home/ubuntu/ec2-deploy-test
git pull origin main

sudo su <<EOF
cd /home/ubuntu/ec2-deploy-test
/usr/local/bin/node /root/.nvm/versions/node/v20.11.0/bin/npm install   
/usr/local/bin/node /root/.nvm/versions/node/v20.11.0/bin/pm2 restart index.js 
EOF
