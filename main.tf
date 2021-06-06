resource "aws_efs_file_system" "chand_EFS" {
  creation_token = "chandEFS"

  tags = {
    Name = var.efsname
  }
}

resource "aws_efs_mount_target" "alpha" {
  count = "${length(var.subnets)}"  
  file_system_id = aws_efs_file_system.chand_EFS.id
  subnet_id      = "${element(var.subnets, count.index)}"
  security_groups = [var.sg]
}