# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# Create VPC
module "vpc" {
  source = "../module/vpc"
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