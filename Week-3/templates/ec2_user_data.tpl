#!/bin/bash

# Install PostgreSQL 12
sudo tee /etc/yum.repos.d/pgdg.repo<<EOF
[pgdg12]
name=PostgreSQL 12 for RHEL/CentOS 7 - x86_64
baseurl=https://download.postgresql.org/pub/repos/yum/12/redhat/rhel-7-x86_64
enabled=1
gpgcheck=0
EOF
sudo yum makecache
sudo yum -y install postgresql12 postgresql12-server
sudo /usr/pgsql-12/bin/postgresql-12-setup initdb
sudo systemctl start postgresql-12
sudo systemctl enable --now postgresql-12

# Copy database scripts
aws s3 cp s3://${bucket_name}/rds-script.sql /home/ec2-user/
aws s3 cp s3://${bucket_name}/dynamodb-script.sh /home/ec2-user/
