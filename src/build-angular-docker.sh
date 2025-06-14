#!/bin/bash
# set -e

# REPO=https://github.com/saifeddine01/personalblog.git
# WORKDIR=personalblog
# BUILD_OUTPUT=dist/personalblog/browser
# NGINX_DEPLOY_DIR=/var/www/html  # adjust to your nginx root folder

# # Clone or update repo
# if [ ! -d "$WORKDIR" ]; then
#   git clone $REPOw
# else
#   cd $WORKDIR
#   git pull
#   cd ..
# fi

# # Build Angular app inside Docker container
# docker run --rm -v "$PWD/$WORKDIR":/app -w /app node:18-bullseye bash -c "
#   npm install &&
#   npx ng build --configuration production
# "

# # Copy build output to nginx directory
# echo "Copying build output to nginx directory ($NGINX_DEPLOY_DIR)..."
# sudo cp -r "$WORKDIR/$BUILD_OUTPUT/"* "$NGINX_DEPLOY_DIR/"

# echo "Build and deploy completed."
