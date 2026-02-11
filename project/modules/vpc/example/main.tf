module "vpc" {
    source = "/home/admin-oleg/Desktop/Netology/ter-homeworks/project/modules/vpc"

    vpc_name = "my-vpc"

    subnets = [
        {
            name = "subnet-a"
            zone = "ru-central1-a"
            cidr = ["10.10.1.0/24"]
        },
        {
            name = "subnet-b"
            zone = "ru-central1-b"
            cidr = ["10.10.2.0/24"]
        }
    ]

    security_group_ingress = [
        {
            protocol       = "TCP"
            description    = "разрешить входящий ssh"
            v4_cidr_blocks = ["0.0.0.0/0"]
            port           = 22
        },
        {
            protocol       = "TCP"
            description    = "разрешить входящий  http"
            v4_cidr_blocks = ["0.0.0.0/0"]
            port           = 80
        },
        {
            protocol       = "TCP"
            description    = "разрешить входящий https"
            v4_cidr_blocks = ["0.0.0.0/0"]
            port           = 443
        }
  ]
}