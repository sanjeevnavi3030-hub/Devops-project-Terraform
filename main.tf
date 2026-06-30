resource "aws_security_group" "netflix_sg" {
  name        = "netflix-sg-mumbai-tf"
  description = "Security group for Netflix clone project - Mumbai"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "netflix-sg-mumbai-tf"
  }
}

resource "aws_instance" "jenkins_server" {
  ami                    = var.ami_id_jenkins
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = ["sg-0484ffbdebc086415"]

  tags = {
    Name = "Jenkins-docker-net"
  }
}

resource "aws_instance" "kubemaster" {
  ami                    = var.ami_id_k8s
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = ["sg-0484ffbdebc086415"]

  tags = {
    Name = "kubemaster"
  }
}

resource "aws_instance" "kubeslave" {
  ami                    = var.ami_id_k8s
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = ["sg-0484ffbdebc086415"]

  tags = {
    Name = "kubeslave"
  }
}
