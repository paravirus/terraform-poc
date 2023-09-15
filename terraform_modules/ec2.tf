module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = {ec2-name}

  instance_type          = {instance-type}
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    {key}   = "{value}"
    Environment = "dev"
  }
}
