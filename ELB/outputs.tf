output "this_elb_id" {
  description = "The name of the ELB"
  value       = "${module.elb_http.this_elb_id}"
}
