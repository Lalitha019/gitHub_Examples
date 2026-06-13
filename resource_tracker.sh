#!/bin/bash
#################################################
# Author: Lalitha Mahalakshmi Kollipara
# Date: 12th June 2026
#
#
# Version: v1
#
# Description: This script will report the AWS resource usage
##################################################

# We are going to track the below resources.
# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

# Use '>' operator to clear the file for the first command that is ls
# Use '>>' command to append the output of file
# so that we will get the latest results only instead of the same results multiple times that is everytime the crontab runs

set -x

# list s3 buckets
echo "Print list of S3 buckets"
aws s3 ls > resourceTracker

# list Ec2 instances
echo :Print list of EC2 instances
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resourceTracker

# list AWS lambda
echo "Print list of lambda functions"
aws lambda list-functions

# list AWS IAM Users
echo "Print list of IAM Users"
aws iam list-users

