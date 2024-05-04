variable "REGION" {
  default = "us-east-2"
}

variable "ZONE1" {
  default = "us-east-2a"
}

variable "ZONE2" {
  default = "us-east-2b"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-2 = "ami-0ddda618e961f2270"
    us-east-1 = "ami-07caf09b362be10b8"
  }
}

variable "USER" {
  default = "ec2-user"
}

variable "PUB_KEY" {
  default = "webkey.pub"
}

variable "PRI_KEY" {
  default = "webkey"
}