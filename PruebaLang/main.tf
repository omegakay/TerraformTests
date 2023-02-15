# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# Create VPC
module "vpc" {
  source = "../modules/vpc"
}

# Create Security Groups
module "security_groups" {
  source = "../modules/security-groups"
  vpc_id = module.vpc.vpc_id
}

# Create a budget
resource "aws_budgets_budget" "Presupuesto_mensual" {
  name              = "presupuesto_mensual"
  budget_type       = "COST"
  limit_amount      = "15.0"
  limit_unit        = "USD"
  time_unit         = "MONTHLY"
  time_period_start = "2023-02-15_00:01"
}