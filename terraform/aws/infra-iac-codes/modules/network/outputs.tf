output "vpc_default_security_group" {
  value = aws_security_group.my_security_group.id
}

output "vpc_subnet_ids" {
  value = [
    for v in aws_subnet.my_subnet : v.id
  ]
}