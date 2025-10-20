output "instance_public_ip" {
    description = "The Public ip of ec2 instance"
    value = aws_instance.nginxserver.public_ip
  
}
output "instance_url" {
    description = "The Url to access the Nginx Server"
    value = "http://${aws_instance.nginxserver.public_ip}"
  
}