module "vpc_a" {
  source       = "./modules/vpc"
  providers    = { aws = aws.region_a }
  
  
}

module "mymodule" {
  source = "./modules/mymodule"
  my_var = "hello"
}
