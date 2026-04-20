Gen valid certs
```
sudo apt install libnss3-tools mkcert -y
mkcert -install
mkcert -key-file legit.key -cert-file legit.crt portal.corp.local

```
Gen evil certs

```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout evil.key \
    -out evil.crt \
    -subj "/CN=portal.corp.local"
```

