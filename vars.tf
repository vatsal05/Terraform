variable "aws_access_key"{}
variable "aws_secret_key"{}
variable "AWS_REGION"{
default="eu-west-1"
}
variable "instance_count"{
default=2
}
variable "ami"{
type=map
default={
us-east-1="ami-0edfed9d6e9a4031b"
us-west-2="ami-0b91a410940e82c54"
eu-west-1="ami-04533969992547875"
   }
}