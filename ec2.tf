# sample
# second line
resource "aws_instance" "jenkins_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.this.key_name

  tags = {
    Name = var.name_tag,
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = tls_private_key.oskey.private_key_pem
    host        = aws_instance.jenkins_instance.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "set -x",
      "sudo yum install java-17-amazon-corretto.x86_64 -y",
      "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
      "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key",
      "sudo yum install jenkins -y",
      "sudo systemctl enable jenkins",
      "sudo systemctl start jenkins",
      "sudo yum install git -y",
      "sudo yum install -y yum-utils",
      "sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo",
      "sudo yum -y install terraform",
      "sudo cat /var/lib/jenkins/secrets/initialAdminPassword",
      "sleep 10",
      "exit"
    ]

  }


}
resource "tls_private_key" "oskey" {
  algorithm = "RSA"
}
# creates pem file locally 
# resource "local_file" "myterrakey" {
#   content  = tls_private_key.oskey.private_key_pem
#   filename = "my-ec2key.pem"
# }
resource "aws_key_pair" "this" {
  key_name   = "my-ec2key-${random_string.random_number.result}"
  public_key = tls_private_key.oskey.public_key_openssh
}
resource "random_string" "random_number" {
  length  = 6 # Specify the desired length of the hexadecimal string
  special = false
}
