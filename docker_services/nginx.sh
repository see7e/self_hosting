# Update package lists
sudo apt update && sudo apt upgrade -y

# Install Nginx
sudo apt install nginx

# Start and enable Nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Certbot for SSL
sudo apt install certbot python3-certbot-nginx

# Run to get SSL certificate
sudo certbot --nginx -d $(DOMAIN)
