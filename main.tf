module "vpc_a" {
  source       = "./modules/vpc"
  providers    = { aws = aws.region_a }
}

module "ec2_a" {
  source       = "./modules/ec2"
  providers    = { aws = aws.region_a }
  subnet_id    = module.vpc_a.public_subnet_a_1a_id
  Name        = "public-web-server-A"
}