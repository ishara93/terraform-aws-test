resource "aws_instance" "example" {
  ami= lookup({a="ami-830c94e3", b="ami-830c94e3ssss"}, "a", lower("ami-830c94e3"))
  instance_type = "t2.micro"
  tags = var.tags
}


variable "tags" {
  type = map(string)
  default = {
    env:"prod"
    name:"ec2"
    tagone:"ec2"
  }
}