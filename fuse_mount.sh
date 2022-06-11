#!/bin/bash

#Mounts the google bucket that has the configuration files
gcsfuse --file-mode=777 --dir-mode=777 --implicit-dirs -o allow_other $CONFIGBUCKET /var/www/html/LocalSettingsLink

#Mounts the google bucket that holds uploaded images/files
gcsfuse --file-mode=777 --dir-mode=777 --implicit-dirs -o allow_other $IMAGEBUCKET /var/www/html/images

#start the apache server
apache2-foreground