variable "ec2_count" {
  default = "1"
}
variable "ami_id" {
}
variable "instance_type" {
  default = "t2.micro"
}
variable "subnet_id" {
}
variable "public_ip" {
  default = "true"
}
variable "az" {
}
variable "disksize" {
  default = [128]
}
variable "encryption" {
  default = "true"
}
variable "disktype" {
  default = "gp2"
}
variable "devicename" {
  default = ["/dev/sdf", "/dev/sdg", "/dev/sdh", "/dev/sdi", "/dev/sdj", "/dev/sdk"]
}
variable "ec2name" {
}