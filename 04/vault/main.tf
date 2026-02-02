provider "vault" {
 address = "http://127.0.0.1:8200"
 skip_tls_verify = true
 token = "education"
}
data "vault_generic_secret" "vault_example"{
 path = "secret/example"
}

output "vault_example" {
 value = "${nonsensitive(data.vault_generic_secret.vault_example.data)}"
}

resource "vault_generic_secret" "test_secret" {
  path = "secret/test"

  data_json = jsonencode({
    username = "test-user"
    password = "test-password"
  })
}