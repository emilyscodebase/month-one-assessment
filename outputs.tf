output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.techcorp_vpc.id
}

output "bastion_public_ip" {
  description = "Public IP of Bastion host"
  value       = aws_instance.bastion.public_ip
}

output "alb_dns_name" {
  description = "DNS name of the web Application Load Balancer"
  value       = aws_lb.web_alb.dns_name
}