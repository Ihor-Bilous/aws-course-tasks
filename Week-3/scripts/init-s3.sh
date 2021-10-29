#!/bin/bash

# Create aws s3 bucket
aws s3 mb s3://ibilous-week3-bucket --region us-west-2

# Put bucket versioning
aws s3api put-bucket-versioning --bucket ibilous-week3-bucket --versioning-configuration Status=Enabled

# Add files to the bucket
aws s3 cp dynamodb-script.sh s3://ibilous-week3-bucket
aws s3 cp rds-script.sql s3://ibilous-week3-bucket
