#!/bin/bash
sudo apt update &> /dev/null && sudo apt install nginx apache2-utils -y &> /dev/null 

htpasswd -cb /home/user/phish-test-lab/valid-site/.htpasswd employee2026 CorpP@ss

cat /home/user/phish-test-lab/valid-site/.htpasswd
