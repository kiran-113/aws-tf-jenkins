output "Jenkins_web" {

  value = "http://${aws_instance.jenkins_instance.public_ip}:8080"

}
