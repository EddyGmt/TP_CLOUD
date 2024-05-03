variable "aws-region" {
  type = string
  default = "eu-north-1"
}

variable "aws-access-key" {
  type = string
  default = "AKIA3FLDYPW7Q6PAZYAO"
}

variable "aws-secret-key" {
  type = string
  default = "kHA/i1o4LgB1Y7yxdBIunkB1Qq61S9WxHT5Ejtg0"
}

variable "ami" {
  type = string
  default = "ami-0705384c0b33c194c"
}

variable "instance-type" {
  type = string
  default = "t3.micro"
}
