variable "bastion_ip" {
  type        = string
  description = "IP of the machine allowed to access the helloworld ec2 instance"
}

variable "connection_key_id" {
  type        = string
  default     = "helloworld-poc"
  description = "ID of a key pair object on AWS used to connect to the ec2 instance"
}
