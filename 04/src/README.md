Задание 1
----------------------------------------------------------------------------------------------------------------------------------
![alt text](vms/images/task1-vm1.png)  
![alt text](vms/images/task1-vm2.png)  
![alt text](vms/images/task1-nginx.png)  
```
> module.marketplace-vm
{
  "external_ip_address" = [
    "178.154.225.187",
    "178.154.192.40",
  ]
  "fqdn" = [
    "develop-marketplace-0.ru-central1.internal",
    "develop-marketplace-1.ru-central1.internal",
  ]
  "internal_ip_address" = [
    "10.0.1.21",
    "10.0.2.33",
  ]
  "labels" = [
    tomap({
      "project" = "marketplace"
    }),
    tomap({
      "project" = "marketplace"
    }),
  ]
  "network_interface" = [
    tolist([
      {
        "dns_record" = tolist([])
        "index" = 0
        "ip_address" = "10.0.1.21"
        "ipv4" = true
        "ipv6" = false
        "ipv6_address" = ""
        "ipv6_dns_record" = tolist([])
        "mac_address" = "d0:0d:10:b6:68:71"
        "nat" = true
        "nat_dns_record" = tolist([])
        "nat_ip_address" = "178.154.225.187"
        "nat_ip_version" = "IPV4"
        "security_group_ids" = toset(null) /* of string */
        "subnet_id" = "e9be4ia1uoqdvfrl9k0d"
      },
    ]),
    tolist([
      {
        "dns_record" = tolist([])
        "index" = 0
        "ip_address" = "10.0.2.33"
        "ipv4" = true
        "ipv6" = false
        "ipv6_address" = ""
        "ipv6_dns_record" = tolist([])
        "mac_address" = "d0:0d:12:52:37:51"
        "nat" = true
        "nat_dns_record" = tolist([])
        "nat_ip_address" = "178.154.192.40"
        "nat_ip_version" = "IPV4"
        "security_group_ids" = toset(null) /* of string */
        "subnet_id" = "e2lrd07nee6coq4vconp"
      },
    ]),
  ]
}
```

Задание 2
----------------------------------------------------------------------------------------------------------------------------------
https://github.com/olegmanzhay/ter-homeworks/tree/main/04/src/vms/vpc