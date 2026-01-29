output "out" {

    value=concat(module.analytics-vm.fqdn , module.marketplace-vm.fqdn)
}
