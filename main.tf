

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_groups = var.security_group_ids

  tags = var.tags
}



resource "aws_instance" "example1" {
  count         = 5  # Specify the number of instances you want to create
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  //key_name      = var.key_name
  security_groups = var.security_group_ids

  tags = merge(var.tags, {
    Name = "ExampleInstance-${count.index + 1}"
  })
}

#RDS Instance
resource "aws_db_instance" "example_db" {
  identifier             = "example-db-instance"
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
 // name                   = "Exampledb"
  username               = "admin"
  password               = "admin123"  # This should be stored securely, not hardcoded
  publicly_accessible    = false
  skip_final_snapshot    = true

  tags = {
    Name = "ExampleDB"
  }
}


#IAM User
resource "aws_iam_user" "admin-user" {
  name =  "Mosese1"
  tags = {
    description = "CTO"
  } 
}



resource "aws_security_group" "trevotech-aws-SG" {
  name        = "trevotechSG-security-new1"
  description = "Security group allowing ports 80, 443, and 3306"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# resource "aws_s3_bucket" "example-1" {
#   bucket = "FiannceandPayroll2024"
   
#   tags = {
#      Name        = "My bucket"
#     Environment = "Dev"
#     description = "Fiannce and Payroll"
#   }
# }


resource "aws_s3_bucket" "example-245" {
  bucket = "my-tf-test-bucket-2024"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
#vpc
#Create Vpc 
resource "aws_vpc" "prod-vpc" {
  cidr_block = "10.0.0.0/16"
   tags = {
      Name = "production"         
   }
}


# internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.prod-vpc.id

  tags = {
    Name = "intrt-gatway1"
  }
}


## Subnet
variable "subnet_prifix" {
  description = "cidr block for the subnet"
  default = "10.0.66.0/24"
  type = string
  
}






resource "aws_route_table" "prod-route-table" {
  vpc_id = aws_vpc.prod-vpc.id

#   route {
#     cidr_block = "10.0.1.0/24"
#     gateway_id = aws_internet_gateway.example.id
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "example"
  }
}

# # DynamoDB Table
# resource "aws_dynamodb_table" "example_table" {
#   name           = "example-table-name"
#   billing_mode   = "PROVISIONED"
#   read_capacity  = 5
#   write_capacity = 5

#   attribute {
#     name = "id"
#     type = "S"
#   }

#   key_schema {
#     attribute_name = "id"
#     key_type       = "HASH"
#   }
# }


