resource "aws_iam_instance_profile" "helloworld_poc_role_instance" {
  name = "helloworld_poc_role"
  role = aws_iam_role.helloworld_poc_role.name
}

resource "aws_instance" "helloworld" {
  ami           = data.aws_ami.ubuntu_20.id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.helloworld.id]
  key_name               = var.connection_key_id

  iam_instance_profile = aws_iam_instance_profile.helloworld_poc_role_instance.id


  tags = {
    app         = "HelloWorld"
    environment = "development"
    purpose     = "poc"
    Name        = "helloworld-tf-demo"
  }
}
