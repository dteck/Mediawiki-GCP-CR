FROM mediawiki:latest
WORKDIR /var/www/html/
ADD Image-mods-GCP.sh ./
ADD fuse_mount.sh ./
RUN bash /var/www/html/Image-mods-GCP.sh
CMD /var/www/html/fuse_mount.sh