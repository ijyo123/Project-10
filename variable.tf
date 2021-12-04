variable "p10-vpc-cidr" {
    default = "10.0.0.0/16"
    description = "p10-vpc-cidr"
    type =string
}

variable "p10-pubsub1-cidr" {
    default = "10.0.0.0/24"
    description = "p10-pubsub1-cidr"
    type =string
}

variable "p10-pubsub2-cidr" {
    default = "10.0.1.0/24"
    description = "p10-pubsub2-cidr"
    type =string
}
variable "p10-pubsub3-cidr" {
    default = "10.0.2.0/24"
    description = "p10-pubsub3-cidr"
    type =string
}

variable "p10-privsub1-cidr" {
    default = "10.0.3.0/24"
    description = "p10-privsub1-cidr"
    type =string
}

variable "p10-privsub2-cidr" {
    default = "10.0.4.0/24"
    description = "p10-privsub2-cidr"
    type =string
}

variable "p10-privsub3-cidr" {
    default = "10.0.5.0/24"
    description = "p10-privsub3-cidr"
    type =string
}

variable "p10-ami-id" {
    default = "ami-0fc15d50d39e4503c"
    description = "p10-ami-id"
    type =string
}

variable "p10-provider-region" {
    default = "eu-west-2"
    description = "p10-provider-region"
    type =string
}



