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
# Terraform Installation
#####################################################################################################

wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update -y

sudo apt install terraform -y

###############################################################################################################
#                   Docker Installation
###############################################################################################################

apt update -y
apt install -y docker.io
systemctl start docker
systemctl enable docker