## This script it to install jenkins, terraform, git , java in AMAZON LINUX 2023
## Copy the script and psate at userdata in AWS EC2 AMAZON LINUX

#!/bin/bash
set -x
sudo yum install java-17-amazon-corretto.x86_64 -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
#NOTE:  you can find the default jenkins admin password at---- cat  /var/lib/jenkins/secrets/initialAdminPassword
sudo yum install git -y
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
sleep 5
sudo systemctl status jenkins
