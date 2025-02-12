module "instance" {
  source  = "aigerim-199/instance/module"
  version = "2.0.0"
  instance_type = "t2.micro"
  instance_name = "Hello"
}