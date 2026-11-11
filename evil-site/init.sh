#!/usr/bin/env bash
set -euo pipefail
if (( EUID != 0 )); then
    echo 'Запуск: sudo bash ./init.sh' >&2
    exit 1
fi
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
apt-get update
apt-get install -y nginx mkcert libnss3-tools openssl
install -d -m 755 /etc/nginx/ssl/lab
if [[ -e /etc/nginx/sites-available/site && ! -e /etc/nginx/sites-available/site.before-lab ]]; then
    cp -a /etc/nginx/sites-available/site /etc/nginx/sites-available/site.before-lab
fi
install -m 644 "$script_dir/nginx.conf" /etc/nginx/sites-available/site
rm -f /etc/nginx/sites-enabled/default
ln -sfn /etc/nginx/sites-available/site /etc/nginx/sites-enabled/site
nginx -t
systemctl enable nginx
systemctl restart nginx
echo 'HTTP-прокси готов. DNS переключается отдельно по инструкции.'
