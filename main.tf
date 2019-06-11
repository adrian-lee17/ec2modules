provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "vm" {
  count                       = var.ec2_count
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.public_ip
  availability_zone           = var.az
  tags = {
    Name = "${var.ec2name}-${count.index}"
  }

}

resource "aws_ebs_volume" "ebs_disk" {
  count             = length(var.disksize)
  availability_zone = var.az
  size              = element(var.disksize, count.index)
  encrypted         = var.encryption
  type              = var.disktype

}

resource "aws_volume_attachment" "ebs_att" {
  count       = length(var.disksize)
  device_name = "${element(var.devicename, count.index)}"
  volume_id   = "${element(aws_ebs_volume.ebs_disk.*.id, count.index)}"
  instance_id = "${element(aws_instance.vm.*.id, count.index)}"
}

