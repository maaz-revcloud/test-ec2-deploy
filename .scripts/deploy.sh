#!/bin/bash

sudo su -

cd /home/ubuntu/ec2-deploy-test
git pull origin main
npm install
pm2 restart index.js
