#!/bin/bash

# https://github.com/nvm-sh/nvm#installing-and-updating
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc

#https://moodledev.io/general/development/tools/nodejs
cd ~/mnt/ext4/env-Projects/Infra-Projects/fzlbpms/services/app-moodle-profaulas/www/html/MOODLE_402_STABLE/

#nvm install
#nvm use
npm install
#npx grunt stylelin
npm install grunt-cli
./node_modules/grunt/bin/grunt


