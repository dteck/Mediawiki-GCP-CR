#!/bin/bash
#Install gnupg and gcsfuse
sudo apt-get update
apt-get -y install gnupg
echo "deb [trusted=yes] http://packages.cloud.google.com/apt gcsfuse-stretch main" | tee /etc/apt/sources.list.d/gcsfuse.list 
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - 
apt-get update
apt-get -y install gcsfuse
apt-get -y install nano

#Create mount point dirs for fuse
mkdir /var/www/html/LocalSettingsLink
mkdir /var/www/html/imagesLink

#set up symbolic links to mounted network shares. Need to remove old images folder before setting up the link
ln -sf /var/www/html/LocalSettingsLink/LocalSettings.php /var/www/html/LocalSettings.php
ln -sf /var/www/html/LocalSettingsLink/wiki.png /var/www/html/wiki.png
rm -R images
ln -sf /var/www/html/imagesLink /var/www/html/images

#Modify the apache2 config file, wont serve files from network shares without modifications, gives http request errors
echo EnableSendfile Off >> /etc/apache2/apache2.conf
echo EnableMMAP Off >> /etc/apache2/apache2.conf

#set the fuse mounting script to be executable
chmod -u+x /var/www/html/fuse_mount.sh
