FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y nginx unzip curl && \
    curl -o /var/www/html/master.zip -L https://github.com/gabrielecirulli/2048/archive/refs/heads/master.zip && \
    cd /var/www/html/ && unzip master.zip && mv 2048-master/* . && rm -rf 2048-master master.zip && \
    if ! grep -q "listen \[::\]:80" /etc/nginx/sites-available/default; then \
    sed -i 's/listen 80 default_server;/listen 80 default_server;\n    listen [::]:80 default_server;/' /etc/nginx/sites-available/default; \
    fi

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]