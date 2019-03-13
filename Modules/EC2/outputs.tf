output "instance_ids" {
  description = "List of IDs of instances"
  value       = ["${aws_instance.ec2.*.id}"]
}

output "instance_az" {
  description = "List of AZs belonging to instance"
  value       = ["${aws_instance.ec2.*.availability_zone}"]
}