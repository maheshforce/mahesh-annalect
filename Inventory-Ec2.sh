#!/bin/bash

# Set the region for the AWS CLI to use
REGION="us-east-1"

# Get a list of all EC2 instances in the region
INSTANCES=$(aws ec2 describe-instances --region $REGION --query 'Reservations[].Instances[].InstanceId' --output text)

# Loop through the instances and print out their details
for INSTANCE in $INSTANCES; do
  # Get the instance name tag, if it exists
  NAME=$(aws ec2 describe-tags --region $REGION --filters "Name=resource-id,Values=$INSTANCE" "Name=key,Values=Name" --query 'Tags[0].Value' --output text || echo "")

  # Get the instance type
  TYPE=$(aws ec2 describe-instances --region $REGION --instance-ids $INSTANCE --query 'Reservations[].Instances[].InstanceType' --output text)

  # Get the instance state
  STATE=$(aws ec2 describe-instances --region $REGION --instance-ids $INSTANCE --query 'Reservations[].Instances[].State.Name' --output text)

  # Print out the instance details
  echo "Instance ID: $INSTANCE"
  echo "Name: $NAME"
  echo "Type: $TYPE"
  echo "State: $STATE"
  echo "-----------------------"
done
