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

# Create ecs task execution role
module "ecs_tasks_execution_role" {
  source       = "../modules/ecs-task-execution-role"
  project_name = module.vpc.project_name
}

# Request SSL certificate
module "acm" {
  source                  = "../modules/acm"
  domain_name             = var.domain_name
  alternative_domain_name = var.alternative_domain_name
}

# Create ALB
module "alb" {
  source                = "../modules/alb"
  project_name          = module.vpc.project_name
  alb_security_group_id = module.security_groups.alb_security_group_id
  public_subnet_az1_id  = module.vpc.public_subnet_az1_id
  public_subnet_az2_id  = module.vpc.public_subnet_az2_id
  vpc_id                = module.vpc.vpc_id
  certificate_arn       = module.acm.certificate_arn
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