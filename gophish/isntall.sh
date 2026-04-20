sudo apt update && \
sudo DEBIAN_FRONTEND=noninteractive apt install -y postfix gophish && \
sudo tee -a /etc/postfix/main.cf > /dev/null <<EOF

# Настройки для работы Gophish на localhost
mynetworks = 127.0.0.0/8
inet_interfaces = loopback-only
smtpd_relay_restrictions = permit_mynetworks, permit_sasl_authenticated, defer_unauth_destination
EOF
sudo systemctl restart postfix && \
sudo systemctl enable postfix && \
echo "✅ SMTP-сервер (Postfix) настроен и запущен на localhost:25"

sudo systemctl start gophish 
sudo journalctl -u gophish --no-pager | grep -i "please login with" | tail -1    
