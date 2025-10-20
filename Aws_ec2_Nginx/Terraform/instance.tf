resource "aws_key_pair" "terakey"{
    key_name = "junnon-key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCeeB3suiHZbsKzt3IMfofp+249Kwb4PvQMIv1FWO8d9q6bGmNbuFaejEtDMoVg2oNxgqHlum0P6BkEQezyRsntQg0jqIe732KYFlYoe9+GuPOvdEQGLFzGPho5KGAwUunvN2r6YM5YtGD1yuRJcAELFFkCQZz/baKRE3jfZnlsZha82aP2X0j2JUtEOjfJqn+zI/79mhZQ2QaLH8Lv/7vpfUWmJGvNwX5eLC0Eh4Gb1lxxFLIh0k+buqUVG1HxnHr2JfDJEx1KQEFdFosEQ30gbSx9bA/gOz5nRd8b4cKOf5D8kDKqIHDowiJ2YBpsZbmREPZNaj551jVQG65C9NM+iRqf9MIeHNFUmW0KT5r+9Jz+vp/qO+tI+E9ren/tJ1ueWjh9x0tNqcZ6Yx5+9SthHfTkR746OhjtLsdGDWjcppK3yZ+vQOU2jC7U6cTB2bxmVeljHwXbgAYdstMpUsbRtd1xRA6bNbUdjh7KJuVdG4RrmFcSdW1RbC4stM18xVbgz+G5k4igRhqZktkT4SuymMrQVbjWgDQTkfcUNxz2ZbDcnjMtjVh68ZexBZkJMVcaOQH9wLiB6d2nEfE9W7ELoNBlxif2KuV8Mlk8hRuAipDDkSI5nyyOGcb1yrg+0FhjZdqmUB1hJK2Qf5glJg08xu0jg0sk0ZIOixhmrFvdsw== keypair"
    


}
resource "aws_default_vpc" "default" {
  
}
resource "aws_security_group" "terasg" {
    name = "mysg1"
    description = "for terraform"
    vpc_id = aws_default_vpc.default.id

    ingress{

        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]


}
egress{
    from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    
}
  
}


resource "aws_instance" "terainstance"{
    ami = "ami-0bc691261a82b32bc"
    instance_type = "t2.micro"
    key_name = aws_key_pair.terakey.key_name
    security_groups = [aws_security_group.terasg.name]

    root_block_device {
      volume_size = 8
      volume_type = "gp3"
    }
}
