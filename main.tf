module "vpc_a" {
  source       = "./modules/vpc"
  providers    = { aws = aws.region_a }
  vpc_cidr     = var.vpc_a_cidr
  public_subnets  = [var.vpc_a_public_subnet_az1, var.vpc_a_public_subnet_az2]
  private_subnets = [var.vpc_a_private_subnet_az2]
  azs          = [var.region_a_az1, var.region_a_az2]
  name         = "VPC-A"
}