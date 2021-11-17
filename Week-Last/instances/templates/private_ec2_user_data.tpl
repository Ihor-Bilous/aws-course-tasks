#!/bin/bash
export RDS_HOST=${rds_address}
yum -y update
yum -y install java-1.8.0-openjdk
amazon-linux-extras install postgresql12
aws s3 cp s3://${bucket_name}/persist3-0.0.1-SNAPSHOT.jar persist3-0.0.1-SNAPSHOT.jar
java -jar persist3-0.0.1-SNAPSHOT.jar