#!/bin/bash

apt update -y
apt install -y nginx apache2-utils mkcert libnss3-tools

mkdir -p /var/www/site
mkdir -p /etc/nginx/ssl

cp ./index.html /var/www/site/

chown -R www-data:www-data /var/www/site
chmod -R 755 /var/www/site

mkcert -install
mkcert -key-file /etc/nginx/ssl/legit.key -cert-file /etc/nginx/ssl/legit.crt portal.corp.local
su - user -c "mkcert -install"
cat /root/.local/share/mkcert/rootCA.pem > /home/user/.local/share/mkcert/rootCA.pem
su - user -c "mkcert -install"
htpasswd -cb /etc/nginx/.htpasswd employee2026 'CorpP@ss'

rm /etc/nginx/sites-enabled/default
cp ./nginx.conf /etc/nginx/sites-enabled/site


nginx -t
systemctl restart nginx