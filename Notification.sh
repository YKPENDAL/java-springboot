#!/bin/bash
# Script to install MySQL 8.3 on CentOS/RHEL 9

# Create a directory for MySQL installation
mkdir mysql
cd mysql

# Install wget to download files
sudo yum install wget -y

# Download the MySQL RPM bundle
wget https://cdn.mysql.com//Downloads/MySQL-8.3/mysql-8.3.0-1.el9.x86_64.rpm-bundle.tar 

# Extract the RPM bundle
sudo tar -xf mysql-8.3.0-1.el9.x86_64.rpm-bundle.tar 

# Install MySQL community common package
sudo yum install -y mysql-community-common-8.3.0-1.el9.x86_64.rpm

# Install MySQL community client plugins
sudo yum install -y mysql-community-client-plugins-8.3.0-1.el9.x86_64.rpm

# Install MySQL community libs
sudo yum install -y mysql-community-libs-8.3.0-1.el9.x86_64.rpm

# Install MySQL community client
sudo yum install -y mysql-community-client-8.3.0-1.el9.x86_64.rpm

# Install required packages
sudo yum -y install perl.x86_64
sudo yum -y install libaio.x86_64

# Install MySQL ICU data files
sudo yum install -y mysql-community-icu-data-files-8.3.0-1.el9.x86_64.rpm

# Install MySQL community server
sudo yum install -y mysql-community-server-8.3.0-1.el9.x86_64.rpm

# Enable and start MySQL service
sudo systemctl enable --now mysqld

# Check MySQL service status
sudo systemctl status mysqld

# Display MySQL log
sudo cat /var/log/mysqld.log

# Run MySQL secure installation for initial setup
mysql_secure_installation

# Download and install MySQL Shell
wget https://cdn.mysql.com//Downloads/MySQL-Shell/mysql-shell-8.3.0-1.el9.x86_64.rpm
sudo yum install -y mysql-shell-8.3.0-1.el9.x86_64.rpm
