#!/bin/bash
# Update packages
yum update -y

# Install PostgreSQL
amazon-linux-extras enable postgresql13
yum install -y postgresql-server postgresql-contrib

# Initialize the database
/usr/bin/postgresql-setup --initdb

# Start PostgreSQL service
systemctl enable postgresql
systemctl start postgresql

# Set a password for the postgres user
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'Postgres123!';"