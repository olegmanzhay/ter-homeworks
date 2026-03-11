module "mysql_vpc" {
    source                  = "./modules/vpc"

    network_name            = "mysql_network"
    security_group_name     = "mysql-sg"
    subnets                 = [
         { name ="mysql-ru-central1-a", zone = "ru-central1-a", cidr = ["10.0.1.0/24"] },
         { name ="mysql-ru-central1-b", zone = "ru-central1-b", cidr = ["10.0.2.0/24"] }
    ]    
}

module "mysql_cluster"{

    source                  = "./modules/mysql_cluster"

    cluster_name            = "mysql_cluster"
    network_id              =  module.mysql_vpc.network_id
    security_group_id       =  module.mysql_vpc.mysql_sg_id
    version_mysql           = "8.0"
    ha                      = true

    hosts                   =[
        {zone = "ru-central1-a",subnet_id = "${module.mysql_vpc.subnet_ids[0]}", nat = true},
        {zone = "ru-central1-b",subnet_id = "${module.mysql_vpc.subnet_ids[1]}", nat = true}
    ]
}

module "mysql_db"{

    source                  = "./modules/mysql_db_username"

    cluster_id              = module.mysql_cluster.cluster_id
    db_name       = data.vault_generic_secret.mysql_credentials.data["db_name"]
    user_name     = data.vault_generic_secret.mysql_credentials.data["user_name"]
    user_password = data.vault_generic_secret.mysql_credentials.data["user_password"]
}


data "vault_generic_secret" "vault_example"{
 path = "secret/test"
}

output "vault_db_pass" {
 value = "${nonsensitive(data.vault_generic_secret.vault_example.data)}"
}
