#!/bin/bash

# Navigate to the directory where the script resides
cd "$(dirname "$0")" || exit

# Navigate to the project directory
cd /home/ubuntu/ec2-deploy-test || exit

# Pull the latest changes from the main branch of the git repository
git pull origin main || { echo "Failed to pull latest changes from git repository"; exit 1; }

# Switch to root user and execute commands
sudo su - <<EOF
# Ensure Node.js and npm environment variables are set
export NVM_DIR="/root/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Navigate to the project directory
cd /home/ubuntu/ec2-deploy-test || exit

# Install dependencies using npm
/root/.nvm/versions/node/$(node -v)/bin/npm install || { echo "Failed to install npm dependencies"; exit 1; }

# Restart the application using pm2
/root/.nvm/versions/node/$(node -v)/bin/pm2 restart index.js || { echo "Failed to restart the application using pm2"; exit 1; }
EOF
