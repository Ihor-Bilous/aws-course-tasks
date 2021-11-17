#!/bin/bash
yum -y update
yum -y install java-1.8.0-openjdk
aws s3 cp s3://${bucket_name}/calc-0.0.2-SNAPSHOT.jar calc-0.0.2-SNAPSHOT.jar
java -jar calc-0.0.2-SNAPSHOT.jar