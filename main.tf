module "apigateway"{
    source = "./api-gateway"
    lambda_uri = module.lambda.lambda_invoke_arn
    function_name = module.lambda.function_name 
}

module "secgp"{
    source = "./secgp"
    vpcid = module.vpc.vpcid
}

module "lambda"{
    source = "./lambda"
    role = module.iam.role
    lambda_sec_gp = [module.secgp.lambda_sec_gp]
    prvsubnet = [module.vpc.prvsubnet]
}

module "iam"{
    source = "./iam"
}

module "vpc"{
    source = "./vpc"
    cidr_block = var.cidr_block
    vpc_name = var.vpc_name
    pub_cidr_block = var.pub_cidr_block
    pub_availability_zone = var.pub_availability_zone
    prv_availability_zone = var.prv_availability_zone
    igw_name = var.igw_name
    prv_cidr_block = var.prv_cidr_block
}