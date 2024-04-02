module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  # NIST Compliance Settings
  name                   = "{ec2-name}"
  instance_type          = "{instance-type}"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"

  # Instance tags for compliance
  tags = {
    Environment = "dev"
    Compliance  = "NIST"
  }

  # NIST Compliance Configuration
  iam_instance_profile {
    name = "NIST-Instance-Profile"
  }

  ebs_block_device {
    device_name           = "/dev/sda1"
    volume_type           = "gp2"
    volume_size           = 30
    delete_on_termination = true
  }

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 30
    delete_on_termination = true
  }

  credit_specification {
    cpu_credits = "standard"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }

  # Security Groups, Subnets, etc. (Add as needed)

}
