#!/bin/bash

source ~/.bashrc
cd /home/ubuntu/ec2-deploy-test

git pull origin main
ls
sudo su -


NODE_PATH=/root/.nvm/versions/node/v20.11.0/bin/node
NPM_PATH=/root/.nvm/versions/node/v20.11.0/bin/npm 
PM2_PATH=/root/.nvm/versions/node/v20.11.0/bin/pm2

if [ ! -x "$NPM_PATH" ]; then
    echo "Granting execute permissions to npm..."
    sudo chmod +x "$NODE_PATH"
    sudo chmod +x "$NPM_PATH"
fi

cd /home/ubuntu/ec2-deploy-test

$NODE_PATH $NPM_PATH install
$NODE_PATH $PM2_PATH restart index.js
