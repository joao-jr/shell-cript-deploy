#!/bin/sh

BRANCH="master"
LOG_FILE="deploy.log"


echo "Executando git pull"
ssh -t front-hml.shopfood.io "cd /var/www/nodejs/teste && git pull origin $BRANCH" >> $LOG_FILE
echo "git pull finalizado"
echo "==========================================================================="

echo "Executando npm install"
ssh -t front-hml.shopfood.io "cd /var/www/nodejs/teste && npm install" >> $LOG_FILE
echo "npm install finalizado"
echo "==========================================================================="

echo "Reiniciando processo pm2"
ssh -t front-hml.shopfood.io "cd /var/www/nodejs/teste && pm2 restart test-server" >> $LOG_FILE
echo "Reiniciando processo pm2 finalizado"
echo "==========================================================================="