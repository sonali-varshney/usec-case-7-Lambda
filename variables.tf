variable "pub_cidr_block"{
    type = list
    default = ["10.0.0.0/24"]
}

variable "prv_cidr_block"{
    type = list
    default = ["10.0.2.0/24"]
}

variable "pub_availability_zone"{
    type = list
    default = ["us-east-1a"]
}

variable "prv_availability_zone"{
    type = list
    default = ["us-east-1c"]
}

variable "cidr_block"{
    
default = "10.0.0.0/16"

}

variable "vpc_name"{
    default = "myvpc"
}


variable "igw_name"{
    default = "myigw"
}
