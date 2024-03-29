#!/bin/bash

cd /home/ubuntu/ec2-deploy-test
git pull origin main

sudo su - <<EOF
cd /home/ubuntu/ec2-deploy-test
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
npm install   
pm2 restart index.js 
EOF
