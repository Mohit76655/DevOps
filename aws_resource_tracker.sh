#!/bin/bash

########################
# Author: Mohit
# Date: 18th-Jan
#
#  Version: v1
#
#  This script will report the aws resource
#
########################

set -x

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM User

# list s3 buckets
echo "Print list of s3 buckets"
aws s3 ls

# list Ec2 Instance
echo "print list of EC2 Instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

# list lambda
echo "Print list of lambda functions"
aws lambda list-functions

# list IAM User
echo "Print list of IAM User"
aws iam list-users



