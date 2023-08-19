# This script it to install jenkins, terraform, git , java in AMAZON LINUX 2023
#!/bin/bash
sudo su
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo systemctl enable jenkins
sudo systemctl start jenkins
#NOTE:  you can find the default jenkins admin password at cat  /var/lib/jenkins/secrets/initialAdminPassword
sudo yum install java -y
sudo yum install git -y
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform