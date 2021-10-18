#!/bin/bash

# Create a text file
echo "Hi there from Week-2 task" > ibilous-s3-text-file.txt

# Create aws s3 bucket
aws s3 mb s3://ibilous-week2-bucket --region us-west-2

# Put bucket versioning
aws s3api put-bucket-versioning --bucket ibilous-week2-bucket --versioning-configuration Status=Enabled

# Add file to the bucket
aws s3 cp ibilous-s3-text-file.txt s3://ibilous-week2-bucket


