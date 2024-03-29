#!/bin/bash

cd /home/ubuntu/ec2-deploy-test
git pull origin main
npm install  

sudo su - <<EOF
cd /home/ubuntu/ec2-deploy-test
ls
npm install   
pm2 restart index.js 
EOF