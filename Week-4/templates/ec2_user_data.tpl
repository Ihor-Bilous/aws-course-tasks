#!/bin/bash
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "<html><h1>This is WebServer from ${instance_name} subnet</h1></html>" > /var/www/html/index.html