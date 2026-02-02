Задание 1
-------------------------------------------------------------------------------------------------------------------------------------------

```
Непройденные проверки (ошибки) без дублей:

    CKV_YC_2: «"Ensure compute instance does not have public IP."».
    Не пройдена для ресурсов:
        module.analytics-vm.yandex_compute_instance.vm;
        module.marketplace-vm.yandex_compute_instance.vm;
        module.example-vm.yandex_compute_instance.vm
        Причина: экземпляры имеют публичные IP-адреса (public_ip = true в конфигурации).
    CKV_YC_11: «Ensure security group is assigned to network interface.».
        module.analytics-vm.yandex_compute_instance.vm;
        module.marketplace-vm.yandex_compute_instance.vm;
        module.example-vm.yandex_compute_instance.vm
    Причина: сетевые интерфейсы не привязаны к группам безопасности.
    CKV_TF_1: «Ensure Terraform module sources use a commit hash».
    Не пройдена для модулей:
        marketplace-vm (/vms/main.tf:13–34);
        analytics-vm (/vms/main.tf:36–56).
        test-vm
        example-vm
        Причина: в source модулей указана только версия (ref=1.0.0), но не хэш коммита

```

Задание 2
-------------------------------------------------------------------------------------------------------------------------------------------