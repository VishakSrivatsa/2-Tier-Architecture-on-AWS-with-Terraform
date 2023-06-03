
# tags are not allowed here 
# associate route table to the public subnet 1
resource "aws_route_table_association" "public_rt1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.rt.id
}


# associate route table to the public subnet 2
resource "aws_route_table_association" "public_rt2" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.rt.id
}



# associate route table to the private subnet 1
resource "aws_route_table_association" "private_rt1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.rt.id
}



# associate route table to the private subnet 2
resource "aws_route_table_association" "private_rt2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.rt.id
}