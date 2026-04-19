#!/bin/bash
sudo apt update &> /dev/null && sudo apt install nginx apache2-utils -y &> /dev/null 
mkdir -p /opt/phish-lab/legit-portal/html

cp index.html /opt/phish-lab/legit-portal/html/

htpasswd -cb /opt/phish-lab/legit-portal/.htpasswd employee2026 CorpP@ss

cat /opt/phish-lab/legit-portal/.htpasswd