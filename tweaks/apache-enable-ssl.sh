#!/bin/bash

if [ -f "include/startup.sh" ]; then
    . include/startup.sh
elif [ -f "../include/startup.sh" ]; then
    . ../include/startup.sh
fi

checkTagExist apache.success

echo "Installing openssl and generating certificate..."
installPackage openssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt -subj "/C=US/ST=YourState/L=YourCity/O=YourOrganization/OU=IT/CN=example.com"

descriptionAppend "SSL certificates location: /etc/ssl/certs/"
descriptionAppend " "

tag ssl-ready.success
tagScript success

exit 0