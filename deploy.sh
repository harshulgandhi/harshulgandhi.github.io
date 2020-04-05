#!/bin/sh

echo "Backing up current webpage content to tmp"
ssh $1@35.198.219.70 'sudo cp -r ~/harshulgandhi/ /tmp'

echo "Update webpage with new files"
scp -r $(pwd)/* $1@35.198.219.70:~/harshulgandhi