
output "aws_ami_id" {
  value = module.myapp-webserver.instance.ami
}
output "aws_ec2_public_ip" {
  value = module.myapp-webserver.instance.public_ip
}
