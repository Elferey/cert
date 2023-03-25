#!/bin/bash

aws=`aws --version | awk '{print $1}'`

if [[ $aws != "aws-cli/2.11.5" ]]; then
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    ./aws/install
    export key_id=(`echo WUNBSkVHYmpQcE5ZMmpjdEdYd2l5dldRUQo= | base64 --decode`)
    export key=(`echo WUNNWVB1Y213ckNqWE44VUh3a2x3XzdOU3pGdzFpOUtCZ1pndVZpOAo= | base64 --decode`)
    region="ru-central1"
    format="json"
    aws configure set aws_access_key_id $key_id
    aws configure set aws_secret_access_key $key
    aws configure set region $region
    aws configure set output $format
else
    echo "aws already installed $aws"
fi