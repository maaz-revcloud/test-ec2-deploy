#!/bin/bash

cd /home/ubuntu/ec2-deploy-test
git pull origin main

sudo su - <<EOF
cd /home/ubuntu/ec2-deploy-test
ls
export PATH="/usr/local/bin:$PATH"
npm install   
pm2 restart index.js 
EOF
