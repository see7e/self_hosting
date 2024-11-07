#!/bin/bash

# Define paths
NGINX_SITES_ENABLED="/etc/nginx/sites-enabled"
SCRIPT_DIR="$(dirname "$0")"
APPS_FILE="$SCRIPT_DIR/../apps.txt"

# Check if apps file exists
if [[ ! -f "$APPS_FILE" ]]; then
    echo "Error: apps.txt file not found in $SCRIPT_DIR."
    exit 1
fi

# Nginx sites-available directory
NGINX_SITES_AVAILABLE="/etc/nginx/sites-available"
SSL_DIR="/etc/ssl/certs"

# Loop through each line in the apps.txt file
while IFS=, read -r app_name ip_port domain; do
    # Skip the header line
    if [[ $app_name == "#"* ]]; then
        continue
    fi

    # Trim whitespace
    app_name=$(echo "$app_name" | xargs)
    ip_port=$(echo "$ip_port" | xargs)
    domain=$(echo "$domain" | xargs)

    # Split ip_port into ip and port
    ip="${ip_port%:*}"
    port="${ip_port##*:}"

    # Define the Nginx configuration block for HTTPS
    CONFIG="server {
        listen 80;
        server_name $domain;

        # Redirect all HTTP requests to HTTPS
        return 301 https://\$host$request_uri;
    }

    server {
        listen 443 ssl;
        server_name $domain;

        ssl_certificate $SSL_DIR/$domain.crt;
        ssl_certificate_key $SSL_DIR/$domain.key;

        location / {
            proxy_pass http://$ip:$port;
            proxy_set_header Host \$host;
            proxy_set_header X-Real-IP \$remote_addr;
            proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto \$scheme;
        }
    }"

    # Check if the configuration already exists
    CONFIG_FILE="$NGINX_SITES_AVAILABLE/$app_name"
    if ! grep -q "server_name $domain;" "$CONFIG_FILE" 2>/dev/null; then
        echo "Adding configuration for $app_name ($domain)"
        echo "$CONFIG" > "$CONFIG_FILE"

        # Generate self-signed SSL certificate
        openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
            -keyout "$SSL_DIR/$domain.key" \
            -out "$SSL_DIR/$domain.crt" \
            -subj "/CN=$domain/O=My Company/C=US"

        # Enable the site by creating a symlink in sites-enabled
        ln -sf "$CONFIG_FILE" "$NGINX_SITES_ENABLED/$app_name"
    else
        echo "Configuration for $app_name ($domain) already exists. Skipping."
    fi
done < "$APPS_FILE"

# Test Nginx configuration
if nginx -t; then
    echo "Nginx configuration test passed."
    # Reload Nginx to apply the new configurations
    systemctl reload nginx
else
    echo "Nginx configuration test failed. Please check the configuration."
fi

