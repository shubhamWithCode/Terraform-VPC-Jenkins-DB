output "VPC-id" {
    value = aws_vpc.our-vpc.id
}

output "Instance-id" {
    value = aws_instance.jenkins-server.id
}

output "Instance-ip" {
    value = aws_instance.jenkins-server.public_ip
}