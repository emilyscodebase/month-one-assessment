TechCorp Terraform Assessment – Month 1
Prerequisites

Before deploying the infrastructure, ensure the following are installed and configured:

Terraform
 (v1.x or later)
AWS CLI
 configured with credentials and default region
SSH key pair for EC2 access (variable: key_name)
Internet access to your machine (for downloading AMIs and updates)
Folder Structure

Your terraform-assessment/ folder should contain:

terraform-assessment/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example
├── user_data/
│   ├── web_server_setup.sh
│   └── db_server_setup.sh
├── README.md
└── evidence/
    └── (screenshots of deployment and verification)

⚠️ Do not include .tfstate files or AWS CLI installers when submitting. Keep only the required Terraform files, user data scripts, README, and evidence screenshots.

Deployment Steps
Initialize Terraform
cd terraform-assessment
terraform init
Check the execution plan
terraform plan
Terraform will prompt for required variables.
You may use the example file terraform.tfvars.example to fill in your values.
Apply the Terraform configuration
terraform apply
Type yes to confirm.
Wait for Terraform to finish creating all resources.
Take a screenshot of the Terraform apply completion.
SSH Access
Bastion Host
ssh -i <your-key>.pem ec2-user@<bastion_public_ip>
Replace <your-key>.pem with your SSH key.
Replace <bastion_public_ip> with the output from Terraform:
terraform output bastion_public_ip
Web and Database Servers (via Bastion)
ssh -i <your-key>.pem ec2-user@<web_private_ip>
ssh -i <your-key>.pem ec2-user@<db_private_ip>

⚠️ Do not hardcode IPs; use your Terraform outputs for dynamic values.

Application Verification
Web Servers
On each web server:
curl http://localhost
The response should include the instance ID.
Take screenshots of each web server output.
ALB Access
Access the Application Load Balancer URL from a browser:
terraform output alb_dns_name
You should see the web page served by both web instances.
Screenshot the ALB page showing content from both instances.
Postgres Database
Connect to the DB server via SSH. Then access Postgres:
sudo su - postgres
psql
\l
Take a screenshot showing the database list.
Cleanup / Destroy

After assessment submission or testing:

terraform destroy
Type yes to confirm.
All resources created by Terraform will be deleted.

⚠️ Do not include your personal IP in the README. Instead, instruct users to replace it with their own when adding security group rules.

Notes
Use placeholders for all IPs and key names.
Include screenshots in the evidence/ folder.
Ensure all Terraform files are aligned to the submission folder structure.
This README provides step-by-step instructions that can be followed by any reviewer to reproduce the infrastructure.