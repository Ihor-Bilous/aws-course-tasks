#!/bin/bash
export AWS_DEFAULT_REGION=us-west-2
aws dynamodb list-tables
aws dynamodb put-item --table-name DemoUsers --item "{\"UserId\":{\"S\":\"uy78980-167hgy\"},\"UserName\":{\"S\":\"John Doe\"}}"
aws dynamodb put-item --table-name DemoUsers --item "{\"UserId\":{\"S\":\"uy71780-1980gz\"},\"UserName\":{\"S\":\"John Smith\"}}"
aws dynamodb scan --table-name DemoUsers
