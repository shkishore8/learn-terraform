resource "aws_instance" "web" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"

  tags = {
    Name = "test1"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z04751093FJLNWEV5LUJS"
  name    = "test"
  type    = "A"
  ttl     = 300
  records = [aws_instance.web.private_ip]
}