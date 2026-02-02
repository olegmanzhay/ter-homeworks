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
```
admin-oleg@admin-oleg-VMware-Virtual-Platform:~/Desktop/Netology/ter-homeworks/04/s3$ terraform init
Initializing the backend...
Do you want to copy existing state to the new backend?
  Pre-existing state was found while migrating the previous "local" backend to the
  newly configured "s3" backend. No existing state was found in the newly
  configured "s3" backend. Do you want to copy this state to the new "s3"
  backend? Enter "yes" to copy and "no" to start with an empty state.

  Enter a value: yes



  erraform apply
╷
│ Error: Error acquiring the state lock
│ 
│ Error message: operation error S3: PutObject, https response error StatusCode: 412, RequestID: 0286ab831a4d1b89, HostID: , api error
│ PreconditionFailed: At least one of the pre-conditions you specified did not hold
│ Lock Info:
│   ID:        78c6a8a1-8e7a-05c8-0c84-599d0dee0312
│   Path:      simple-bucket-ttz4w9c2/terraform.tfstate
│   Operation: OperationTypeInvalid
│   Who:       admin-oleg@admin-oleg-VMware-Virtual-Platform
│   Version:   1.12.2
│   Created:   2026-02-02 10:30:02.199609757 +0000 UTC
│   Info:      
│ 
│ 
│ Terraform acquires a state lock to protect the state from being written
│ by multiple users at the same time. Please resolve the issue above and try
│ again. For most commands, you can disable locking with the "-lock=false"
│ flag, but this is not recommended.


admin-oleg@admin-oleg-VMware-Virtual-Platform:~/Desktop/Netology/ter-homeworks/04/s3$ terraform force-unlock 78c6a8a1-8e7a-05c8-0c84-599d0dee0312
Do you really want to force-unlock?
  Terraform will remove the lock on the remote state.
  This will allow local Terraform commands to modify this state, even though it
  may still be in use. Only 'yes' will be accepted to confirm.

  Enter a value: yes

Terraform state has been successfully unlocked!

The state has been unlocked, and Terraform commands should now be able to
obtain a new lock on the remote state.
```

