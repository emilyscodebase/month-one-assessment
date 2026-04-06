#!/bin/bash
# Update packages
yum update -y

# Install Apache
yum install -y httpd

# Start Apache service
systemctl start httpd
systemctl enable httpd

# Get the instance ID from metadata
INSTANCE_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id)

# Create a simple HTML page showing instance ID
echo "<html><body><h1>Web Server Instance: $INSTANCE_ID</h1></body></html>" > /var/www/html/index.html