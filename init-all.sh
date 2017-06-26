#!/bin/bash
git pull
npm install
npm install -g grunt-cli
bower install
grunt build
#groupadd -r vsmaintenance && useradd -m -r -g vsmaintenance vsmaintenance
su vsmaintenance -c ". env.sh
screen -X -S VSMAINTENANCE quit || true
screen -d -S VSMAINTENANCE node --expose-gc server/app.js"