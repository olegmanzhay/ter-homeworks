resource "yandex_mdb_mysql_database" "mysql_db" {
  cluster_id = var.cluster_id
  name       = var.db_name
}

resource "yandex_mdb_mysql_user" "user" {
  cluster_id = var.cluster_id
  name       = var.user_name
  password   = var.user_password
  permission {
    database_name = yandex_mdb_mysql_database.mysql_db.name
    roles         = ["ALL"]
  }
}