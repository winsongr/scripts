# Nginx Proxy Server

This project sets up an Nginx proxy server for a given domain.

## Setup

1. Replace `example.com` in the Nginx configuration with your actual domain.
2. Ensure that the SSL certificate and key paths match your Let's Encrypt configuration.
3. Reload or restart your Nginx server.

## Code

```
server {
    listen 80 default_server;
    server_name _;

    location / {
        return 301 https://$host$request_uri;
    }
}

server {
    server_name example.com;

    location / {
        return 301 https://$host$request_uri;
    }

    listen 443 ssl;
    ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
    include /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;
}

server {
    if ($host = example.com) {
        return 301 https://$host$request_uri;
    }

    listen 80 ;
    server_name example.com;
    return 404;
}
```
