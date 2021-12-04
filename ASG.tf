resource "aws_launch_configuration" "elbP10_launch_config" {
  image_id      =var.p10-ami-id
  instance_type = "t2.micro"
  security_groups = [aws_security_group.SG-HTTP-P10.id]

  user_data =<<-EOF
              #!/bin/bash
              yum -y install httpd
              echo "Hello, from Terraform" > /var/www/html/index.html
              service httpd start
              chkconfig httpd on
              EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg_project10" {
  name                 = "autoscaling"
  launch_configuration = aws_launch_configuration.elbP10_launch_config.id
  min_size             = 2
  max_size             = 5
  health_check_grace_period = 300
  health_check_type = "ELB"
  desired_capacity = 4
  force_delete = true
  vpc_zone_identifier = [aws_subnet.project10-publicsubnet1.id, aws_subnet.project10-publicsubnet2.id, aws_subnet.project10-publicsubnet3.id ]

}