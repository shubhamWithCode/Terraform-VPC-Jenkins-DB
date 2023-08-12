variable "db_engine" {}
variable "db_engine_version" {}
variable "db_name" {}   
variable "db_username" {} 
variable "db_password" {}
variable "db_storage_type" {}
variable "db_subnet_group_name" {}

data "aws_subnet" "our-available-subnets" {
    filter {
        name = "tag:Name"
        values = ["Our-Private-Subnet"]
    }

}
resource "aws_db_subnet_group" "db-subnet" {
    name = var.db_subnet_group_name
    subnet_ids = ["${aws_subnet.our-private-subnet.id}", "${aws_subnet.our-private-subnet2.id}"]
    tags = {
        Name = "db-subnet"
        }
  
}
resource "aws_db_instance" "our-db-instance" {
    allocated_storage = 10
    engine = var.db_engine
    engine_version = var.db_engine_version
    db_name = var.db_name
    multi_az = true
    db_subnet_group_name = aws_db_subnet_group.db-subnet.name
    instance_class = "db.t2.micro"
    username = var.db_username
    password = var.db_password
    skip_final_snapshot = true
    storage_type = var.db_storage_type
    vpc_security_group_ids = [aws_security_group.our-security-group.id]
    
    tags = {
        Name = "our-db-instance"
        Environment = "dev"
    }
}

  
