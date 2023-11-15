#!/bin/bash

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <stack-name> <template-file> <parameter-file>"
  exit 1
fi

STACK_NAME=$1
TEMPLATE_FILE=$2
PARAMETER_FILE=$3

echo "Stack Name: $STACK_NAME"
echo "Template File: $TEMPLATE_FILE"
echo "Parameter File: $PARAMETER_FILE"

aws cloudformation create-stack --stack-name $STACK_NAME --template-body file://$TEMPLATE_FILE --parameters file://$PARAMETER_FILE --region=us-east-1 --capabilities CAPABILITY_IAM --capabilities CAPABILITY_NAMED_IAM --profile udacity
