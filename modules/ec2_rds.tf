# INSTANCES BLOCK - EC2 and DATABASE

# user_data = file("install_apache.sh")  
# if used with file option - get multi-line argument error 
# as echo statement is long
# 1st ec2 instance on public subnet 1
resource "aws_instance" "ec2_1" {
  ami                    = var.ec2_instance_ami
  instance_type          = var.ec2_instance_type
  availability_zone      = var.az1
  subnet_id              = aws_subnet.public_subnet1.id
  vpc_security_group_ids = [aws_security_group.webserver_sg.id]
  user_data              = <<EOF
       #!/bin/bash
       yum update -y
       yum install -y httpd
       systemctl start httpd
       systemctl enable httpd
       EC2AZ=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
       echo '<center><h1>This Amazon EC2 instance is located in Availability Zone:AZID </h1></center>' > /var/www/html/index.txt
       sed"s/AZID/$EC2AZ/" /var/www/html/index.txt > /var/www/html/index.html
       EOF

  tags = {
    name = "ec2_1"
  }
}

# 2nd ec2 instance on public subnet 2
resource "aws_instance" "ec2_2" {
  ami                    = var.ec2_instance_ami
  instance_type          = var.ec2_instance_type
  availability_zone      = var.az2
  subnet_id              = aws_subnet.public_subnet2.id
  vpc_security_group_ids = [aws_security_group.webserver_sg.id]
  user_data              = <<EOF
       #!/bin/bash
       yum update -y
       yum install -y httpd
       systemctl start httpd
       systemctl enable httpd
       EC2AZ=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
       echo '<center><h1>This Amazon EC2 instance is located in Availability Zone:AZID </h1></center>' > /var/www/html/index.txt
       sed"s/AZID/$EC2AZ/" /var/www/html/index.txt > /var/www/html/index.html
       EOF 

  tags = {
    name = "ec2_2"
  }
}

# Database subnet group
 resource "aws_db_subnet_group" "db_subnet"  {
     name       = "private_subnet"
     subnet_ids = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id]
 }

 # Create database instance
 resource "aws_db_instance" "my_db" {
   allocated_storage    = 5
   engine               = "mysql"
   engine_version       = "5.7"
   instance_class       = "db.t2.micro"
   identifier           = "db-instance"
   db_name              = "sqldatabase"
   username             = "admin"
   password             = "password"
   db_subnet_group_name = aws_db_subnet_group.db_subnet.id
   vpc_security_group_ids = [aws_security_group.webserver_sg.id]
   publicly_accessible = false
   skip_final_snapshot  = true
   multi_az = true
 }
