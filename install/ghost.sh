#! /usr/bin/env bash

require os fedora
require root

yum install -y npm
curl -L https://ghost.org/zip/ghost-latest.zip -o ghost.zip
unzip -uo ghost.zip -d ghost
cd ghost/
npm install --production
echo -e "Do\n\tnpm start\nand browse to http://127.0.0.1:2368"
