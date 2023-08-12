#!/bin/bash  
# this is Shebang script using /bin/bash to run commands

################################################################################################
# Jenkins Installation
################################################################################################

apt update -y  # It will update repo 
apt install openjdk-17-jre -y # It will install Openjdk

curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null  # This will update the repository for jenkins

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null  # This will update the repository for jenkins

apt-get update -y # This will update the repository

apt-get install jenkins -y # This will install jenkins

#####################################################################################################
# 
#####################################################################################################