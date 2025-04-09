output "vpc_id" {
  value = aws_vpc.vpc_a.id
}

# Output the subnet IDs
output "public_subnet_a_1a_id" {
  value = aws_subnet.public_subnet_a_1a.id
}
output "public_subnet_a_1b_id" {
  value = aws_subnet.public_subnet_a_1b.id
}
output "private_subnet_a_1b_id" {
  value = aws_subnet.private_subnet_a_1b.id
}

