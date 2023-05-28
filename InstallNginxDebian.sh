#! /bin/bash
apt-get update
apt-get install nginx
sleep 5s
nginx -v
apt install curl gnupg2 ca-certificates lsb-release debian-archive-keyring
curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
    | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
    
gpg --dry-run --quiet --no-keyring --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg

#set up the apt repository for stable nginx packages
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
http://nginx.org/packages/debian `lsb_release -cs` nginx" \
    | sudo tee /etc/apt/sources.list.d/nginx.list

#Install Nginx Package
apt update
apt install nginx

#Start Nginx Open source
nginx

#Verify that Nginx is up and running
curl -I 127.0.0.1
