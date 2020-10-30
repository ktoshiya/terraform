variable "name" {
  default = "terraform-app"
}
variable "regions" {
  default = {
    "virginia" = "us-east-1"
    "tokyo"    = "ap-northeast-1"
  }
}

// terraform.tfvarsで指定する。
variable "access_key" {}
variable "secret_key" {}
