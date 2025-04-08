module "vpc_a" {
  source       = "./modules/vpc"
  providers    = { aws = aws.region_a }
}