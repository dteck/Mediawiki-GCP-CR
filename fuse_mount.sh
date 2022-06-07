#!/bin/bash

#Mount the google bucket that has the configuration files - change "wiki-settings" to your bucket name
gcsfuse -o allow_other --file-mode=777 --dir-mode=777 --implicit-dirs wiki-settings /var/www/html/LocalSettingsLink

#Mount the google bucket that holds uploaded images/files - change "wiki-image-share" to your bucket name
gcsfuse -o allow_other --file-mode=777 --dir-mode=777 --implicit-dirs wiki-image-share /var/www/html/imagesLink

#start the apache server
apache2-foreground