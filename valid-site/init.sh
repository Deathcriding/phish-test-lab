#!/bin/bash
sudo apt update &> /dev/null && apt install ngins -y &> /dev/null 
mkdir -p /opt/phish-lab/legit-portal/html

cp index.html /opt/phish-lab/legit-portal/html/

if ! command -v htpasswd &> /dev/null; then
    apt install -y apache2-utils
fi

htpasswd -cb /opt/phish-lab/legit-portal/.htpasswd employee2026 CorpP@ss

cat /opt/phish-lab/legit-portal/.htpasswd