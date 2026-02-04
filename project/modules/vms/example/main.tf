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
        },
        {
            protocol       = "TCP"
            description    = "разрешить входящий http"
            v4_cidr_blocks = ["0.0.0.0/0"]
            port           = 5000
        },
        {
            protocol       = "TCP"
            description    = "разрешить входящий http"
            v4_cidr_blocks = ["0.0.0.0/0"]
            port           = 3306
        },
                {
            protocol       = "TCP"
            description    = "разрешить входящий http"
            v4_cidr_blocks = ["0.0.0.0/0"]
            port           = 8090
        },
                {
            protocol       = "TCP"
            description    = "разрешить входящий http"
            v4_cidr_blocks = ["0.0.0.0/0"]
            port           = 8080
        }
  ]
}

data "yandex_compute_image" "ubuntu-2204-lts" {
  family = "ubuntu-2204-lts"
}

module "vms" {
  source = "/home/admin-oleg/Desktop/Netology/ter-homeworks/project/modules/vms"

  vm_configs = [
    {
      name = "web-vm-1"
      zone = "ru-central1-a"
      cpu  = 2
      ram  = 1
      core_fraction = 20


      disk = {
        image_id = "${data.yandex_compute_image.ubuntu-2204-lts.id}"
        type   = "network-hdd"
        size   = 10
      }

      preemptible = true

      network = {
        subnet_id         = module.vpc.subnet_ids["subnet-a"] 
        nat               = true
        security_group_ids = [module.vpc.security_group_id] 
      }

      metadata = {
        serial-port-enable = true
        user-data          = data.template_file.cloudinit.rendered
      }
    }
  ]
}

module "mysql_cluster"{

    source                  = "/home/admin-oleg/Desktop/Netology/ter-homeworks/project/modules/mysql/mysql_cluster"

    cluster_name            = "mysql_cluster"
    network_id              =  module.vpc.vpc_id
    security_group_id       =  module.vpc.security_group_id
    version_mysql           = "8.0"
    ha                      = false

    hosts                   =[
        {zone = "ru-central1-a",subnet_id = "${module.vpc.subnet_ids["subnet-a"]}", nat = true}
    ]
}

module "mysql_db"{

    source                  = "/home/admin-oleg/Desktop/Netology/ter-homeworks/project/modules/mysql/mysql_db_username"

    cluster_id              = module.mysql_cluster.cluster_id
    db_name                 = "example"
    user_name               = "app"
    user_password           = "very_strong"
}

module "container_registry" {
  
  source = "/home/admin-oleg/Desktop/Netology/ter-homeworks/project/modules/registry"

  registry_name = "web-mysql"
  folder_id = var.folder_id
} 




#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
}



