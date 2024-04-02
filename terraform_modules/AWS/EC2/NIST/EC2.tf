module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
NIST
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
