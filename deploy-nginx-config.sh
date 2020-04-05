#!/bin/sh

echo "Backing up remote sites-available directory in /tmp"
ssh $1@35.198.219.70 'sudo cp -r /etc/nginx/sites-available /tmp'

echo "Copying sites available directory"
ssh $1@35.198.219.70 'mkdir ~/sites-available-hg'
scp -r $(pwd)/nginx/sites-available/* $1@35.198.219.70:~/sites-available-hg/
ssh $1@35.198.219.70 'sudo cp -r ~/sites-available-hg/* /etc/nginx/sites-available/'

echo "Creating symlinks"
ssh $1@35.198.219.70 'cd /etc/nginx/sites-enabled; sudo ln -s ../sites-available/harshulgandhi.com'
ssh $1@35.198.219.70 'cd /etc/nginx/sites-enabled; sudo ln -s ../sites-available/www.harshulgandhi.com'

echo "Restart nginx"
ssh $1@35.198.219.70 'sudo nginx -s reload'