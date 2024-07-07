#!/bin/bash

########################
# Author: Mohit
# Date: 18th-Jan
#
# Version: v1.1
#
# This script reports AWS resources.
########################

set -e

# Function to list S3 buckets
list_s3_buckets() {
    echo "Listing S3 buckets..."
    aws s3 ls
}

# Function to list EC2 instances
list_ec2_instances() {
    echo "Listing EC2 instances..."
    aws ec2 describe-instances --query 'Reservations[*].Instances[*].InstanceId' --output text
}

# Function to list Lambda functions
list_lambda_functions() {
    echo "Listing Lambda functions..."
    aws lambda list-functions --query 'Functions[*].FunctionName' --output text
}

# Function to list IAM users
list_iam_users() {
    echo "Listing IAM users..."
    aws iam list-users --query 'Users[*].UserName' --output text
}

# Execute functions
list_s3_buckets
list_ec2_instances
list_lambda_functions
list_iam_users




