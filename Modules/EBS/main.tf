resource "aws_ebs_volume" "ebs" {
  availability_zone = "${var.instance_az[count.index]}"
  size              = "${var.ebs_size}"
  type              = "${var.ebs_type}"
  encrypted         = "true"

  tags {
    Name = "${element(var.ebs_tag_name, count.index +1)}"
  }
}

resource "aws_volume_attachment" "attach_ebs" {
  device_name  = "${var.device_name}"
  volume_id    = "${aws_ebs_volume.ebs.id}"
  instance_id  = "${var.instance_id[count.index]}"
  skip_destroy = "${var.skip_destroy}"
}
