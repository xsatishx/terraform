output "ids" {
  description = "List of IDs of instances"
  value       = "${module.ec2-instance.id}"
}

output "public_ip" {
  description = "Public ip of the instance"
  value = "${module.ec2-instance.public_ip}"
}
