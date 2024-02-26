aws_region        = "us-east-1"
instance_type     = "t2.micro"
//ami_id            = "ami-0c55b159cbfafe1f0"
ami_id =               "ami-0c7217cdde317cfec"
//key_name          = "your_key_name"
//subnet_id         = "subnet-12345678"
subnet_id    = "subnet-0ffcf5f9b4f4be7a2"
//security_group_ids = ["sg-12345678"]
security_group_ids = [ "sg-099735fcabb51e627" ]
tags = {
  Name = "ExampleInstance"
  Environment = "Development"
}
