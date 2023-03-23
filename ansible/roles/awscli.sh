#!/bin/bash

aws=`aws --version | awk '{print $1}'`

if [[ $? == 1 ]]; then
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    ./aws/install
    key_id="YCAJEGbjPpNY2jctGXwiyvWQQ"
    key="YCMYPucmwrCjXN8UHwklw_7NSzFw1i9KBgZguVi8"
    region="ru-central1"
    format="json"
    aws configure set aws_access_key_id $key_id
    aws configure set aws_secret_access_key $key
    aws configure set region $region
    aws configure set output $format
else
    echo "aws already installed $aws"
fi