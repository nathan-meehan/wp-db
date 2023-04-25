terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


module "sg" {
    source = "./sg"
    vpc_id = ""
}

module "wpdb" {
    source = "./db"
    sg_id = module.sg.db_sg_id
}

module "wp" {
    source = "./wp"
    sn_id = ""
    sg_id = module.sg.sg_id
    db_host = module.wpdb.db_endpoint
    db_sg_id = module.sg.db_sg_id
    pvt_key_path = "./"
    pvt_key_name = ""
}


