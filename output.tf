

output "id" {
  description = "List of IDs of instances"
  value       = aws_instance.vm.*.id
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.vm.*.public_ip
}
output "private_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.vm.*.private_ip
}
