module "network"{
  source          = "./vpc"
  stand           = "develop"
  network_name    = "develop"
  subnets = [
    { name ="develop-ru-central1-a", zone = "ru-central1-a", cidr = ["10.0.1.0/24"] },
    { name ="develop-ru-central1-b", zone = "ru-central1-b", cidr = ["10.0.2.0/24"] },
    { name ="develop-ru-central1-d", zone = "ru-central1-d", cidr = ["10.0.3.0/24"] },
  ]
}


module "marketplace-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=1.0.0"
  env_name       = "develop" 
  network_id     = module.network.network_id 
  subnet_zones   = ["ru-central1-a"]
  subnet_ids     = [module.network.subnet_ids[0]]
  instance_name  = "marketplace"
  instance_count = 2
  image_family   = "ubuntu-2004-lts"
  public_ip      = true


  labels = { 
    project = "marketplace"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

module "analytics-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=1.0.0"
  env_name       = "stage"
  network_id     = module.network.network_id
  subnet_zones   = ["ru-central1-b"]
  subnet_ids     = [module.network.subnet_ids[1]]
  instance_name  = "analytics"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    project = "analytics"
    }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    username           = "ubuntu"
    ssh_public_key     = file("/home/admin-oleg/.ssh/ssh-key-15-12-25.pub")
    packages           = "nginx"
  }
}

