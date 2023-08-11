#!/bin/bash

################################################################################################
# Jenkins Installation
################################################################################################

apt update -y
apt install openjdk-17-jre -y

curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

apt-get update -y

apt-get install jenkins -y

#####################################################################################################
# 
#####################################################################################################