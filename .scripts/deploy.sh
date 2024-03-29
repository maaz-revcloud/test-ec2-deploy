#!/bin/bash

cd /home/ubuntu/ec2-deploy-test
git pull origin main

sudo su -

cd /home/ubuntu/ec2-deploy-test

npm install
pm2 restart index.js
