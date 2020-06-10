resource "aws_instance" "Example"{
ami ="${lookup(var.ami, var.AWS_REGION)}"
instance_type="t2.micro"
count= var.instance_count
}
