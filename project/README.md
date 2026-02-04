Задание 1. 
---------------------------------------------------------------------------------------------------------------------------------------------------


module vpc: https://github.com/olegmanzhay/ter-homeworks/tree/terraform-05/project/modules  
module vms: https://github.com/olegmanzhay/ter-homeworks/tree/terraform-05/project/modules/vms  
module container_registry: https://github.com/olegmanzhay/ter-homeworks/tree/terraform-05/project/modules/registry  
module mysql: https://github.com/olegmanzhay/ter-homeworks/tree/terraform-05/project/modules/mysql

Вызов модулей и создание инфры: https://github.com/olegmanzhay/ter-homeworks/blob/terraform-05/project/modules/vms/example/main.tf

Задание 2. 
---------------------------------------------------------------------------------------------------------------------------------------------------
Используя user-data (cloud-init), установите Docker и Docker Compose (см. Задания 5 модуля «Виртуализация и контейнеризация»).  
https://github.com/olegmanzhay/ter-homeworks/blob/terraform-05/project/modules/vms/example/cloud-init.yml

Задание 3. 
---------------------------------------------------------------------------------------------------------------------------------------------------
Опишите Docker файл (см. Задания 5 «Виртуализация и контейнеризация») c web-приложением и сохраните контейнер в Container Registry.
Взял готовый образ из ДЗ по докеру https://github.com/olegmanzhay/Netology/tree/master/shvirtd-example-python  


Задание 4.
---------------------------------------------------------------------------------------------------------------------------------------------------Завяжите работу приложения в контейнере на БД в Yandex Cloud.  
![Mysql](images/db.png)

ловлю следующую ошибку при прокидывании порта 8090 ВМ на контейнер
```
docker run -d   -p 8090:8090   -e DB_HOST=rc1a-flft5ubbf3qol693.mdb.yandexcloud.net   --name my-app   a3fff29b58be
d8354c5ce193d0e7a862bbf24dad8d6b87ed0fb80fd84ec819320c052802473e
ubuntu@fhm8e0j0u10i81em9eqb:~$ curl -v http://localhost:8090
*   Trying 127.0.0.1:8090...
* Connected to localhost (127.0.0.1) port 8090 (#0)
> GET / HTTP/1.1
> Host: localhost:8090
> User-Agent: curl/7.81.0
> Accept: */*
> 
* Recv failure: Connection reset by peer
* Closing connection 0
curl: (56) Recv failure: Connection reset by peer
```  

При этом если прокинуть 8090 на 5000   

```
ubuntu@fhm8e0j0u10i81em9eqb:~$ docker run -d   -p 8090:5000   -e DB_HOST=rc1a-flft5ubbf3qol693.mdb.yandexcloud.net   --name my-app   a3fff29b58be
bcc42b038f9cce94a43a5e0cba558dfb5dd7d9ea719640186e17cab9c94d0d28
ubuntu@fhm8e0j0u10i81em9eqb:~$ curl -v http://localhost:8090
*   Trying 127.0.0.1:8090...
* Connected to localhost (127.0.0.1) port 8090 (#0)
> GET / HTTP/1.1
> Host: localhost:8090
> User-Agent: curl/7.81.0
> Accept: */*
> 
* Mark bundle as not supporting multiuse
< HTTP/1.1 200 OK
< date: Wed, 04 Feb 2026 14:23:27 GMT
< server: uvicorn
< content-length: 278
< content-type: application/json
< 
* Connection #0 to host localhost left intact
"TIME: 2026-02-04 14:23:28, IP: похоже, что вы направляете запрос в неверный порт(например curl http://127.0.0.1:5000). Правильное выполнение задания - отправить запрос в порт 8090."
```

https://yandex.cloud/ru/docs/cli/quickstart#install
https://yandex.cloud/ru/docs/container-registry/operations/docker-image/docker-image-pull
https://yandex.cloud/ru/docs/terraform/resources/container_registry