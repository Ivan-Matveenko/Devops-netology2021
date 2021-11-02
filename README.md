 Домашнее задание к занятию "7.6. Написание собственных провайдеров для Terraform.
 
 
1. Найдите, где перечислены все доступные resource и data_source, приложите ссылку на эти строки в коде на гитхабе.
2. Для создания очереди сообщений SQS используется ресурс aws_sqs_queue у которого есть параметр name.

- С каким другим параметром конфликтует name? Приложите строчку кода, в которой это указано.
- Какая максимальная длина имени?
- Какому регулярному выражению должно подчиняться имя?

Ответ:
1. 
    resource = https://github.com/hashicorp/terraform-provider-aws/blob/8e4d8a3f3f781b83f96217c2275f541c893fec5a/aws/provider.go#L411
    data_source = https://github.com/hashicorp/terraform-provider-aws/blob/8e4d8a3f3f781b83f96217c2275f541c893fec5a/aws/provider.go#L169

2.
 - 	ConflictsWith: []string{"name_prefix"},
         https://github.com/hashicorp/terraform-provider-aws/blob/8e4d8a3f3f781b83f96217c2275f541c893fec5a/aws/resource_aws_sqs_queue.go#L56
 
 -  Длина строки не более 80  символов:
         errors = append(errors, fmt.Errorf("%q cannot be longer than 80 characters", k))
         https://github.com/hashicorp/terraform-provider-aws/blob/8e4d8a3f3f781b83f96217c2275f541c893fec5a/aws/validators.go#L1038
 -  Регулярка : `^[0-9A-Za-z-_]+(\.fifo)?$` - может содержать только буквы и символы +".fofo" в конце
                 есть еще 2 доп условия ниже по коду : 
                     NonFifo = `^[0-9A-Za-z-_]+$` - может содержать только буквы, цыфры, подчеркиваниеы, 
                     Fifo = `^[0-9A-Za-z-_.]+$` - так же может содержать только буквы, цыфры, подчеркивание, а так же точку, 
                            `^[^a-zA-Z0-9-_]` -  и при этом начинаться только с букв, цыфр, подчеркивания,
         https://github.com/hashicorp/terraform-provider-aws/blob/8e4d8a3f3f781b83f96217c2275f541c893fec5a/aws/validators.go#L1041
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ---------------------------
 
 7.3. Основы и принцип работы Терраформ
 
 -ссылка на s3.tf - https://github.com/Ivan-Matveenko/Devops-netology2021/blob/0a114913e2de324787fe876d592af40e3ed6aee1/Terraform/s3.tf
 
 
 Задача 1. Создадим бэкэнд в S3 (необязательно, но крайне желательно).
 ![image](https://user-images.githubusercontent.com/53451883/138367158-59c18388-9e14-44d4-8163-fa8f7388b0f5.png)

 
 
 Задача 2
 
-Вывод команды terraform workspace list.

![image](https://user-images.githubusercontent.com/53451883/138367387-1a9bf363-85c5-4d4f-bf91-9100649f1ef3.png)


-Вывод команды terraform plan для воркспейса prod.

 ![image](https://user-images.githubusercontent.com/53451883/138366996-4f7c20e9-6232-4913-ab35-19c0a5a6028c.png)

 
 
 
 
 
 
 ---------------------------------------------------------
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 - Домашнее задание к занятию "7.2. Облачные провайдеры и синтаксис Терраформ."

выввод команды - aws configure list

 ![image](https://user-images.githubusercontent.com/53451883/138147684-c665d432-655c-4ce1-a13e-fed3b528b8cb.png)
 
 
 Создание ec2 через терраформ.
 1. Ответ на вопрос: при помощи какого инструмента (из разобранных на прошлом занятии) можно создать свой образ ami?
 
Ответ:
1. можно использовать CloudFormation 
2. https://github.com/Ivan-Matveenko/Devops-netology2021/blob/9c5af3750016971826ad7f0bd0d3429db6c4a11d/main.tf
 


Инициализация 

![image](https://user-images.githubusercontent.com/53451883/138147929-38c4ca2d-3ac9-41f6-892f-931c55b628e6.png)


Запускаем проверку 

 PS C:\Users\Ivan\Documents\terrat> terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.web will be created
  + resource "aws_instance" "web" {
      + ami                                  = "ami-0358b49d1ab873c60"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "HelloWorld"
        }
      + tags_all                             = {
          + "Name" = "HelloWorld"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification {
          + capacity_reservation_preference = (known after apply)

          + capacity_reservation_target {
              + capacity_reservation_id = (known after apply)
            }
        }

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + enclave_options {
          + enabled = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + metadata_options {
          + http_endpoint               = (known after apply)
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if
you run "terraform apply" now.
PS C:\Users\Ivan\Documents\terrat>

создаем сервер.

![image](https://user-images.githubusercontent.com/53451883/138149978-82e62dc5-1619-4160-b1ef-b89b6079b1d6.png)


-----------------------------------------------










































--Домашнее задание к занятию "7.1 Инфраструктура как код"

Выбор инструментов.
Ответить на четыре вопроса представленных в разделе "Легенда".
Какой тип инфраструктуры будем использовать для этого проекта: изменяемый или не изменяемый?
Будет ли центральный сервер для управления инфраструктурой?
Будут ли агенты на серверах?
Будут ли использованы средства для управления конфигурацией или инициализации ресурсов?
Какие инструменты из уже используемых вы хотели бы использовать для нового проекта?
Хотите ли рассмотреть возможность внедрения новых инструментов для этого проекта?

Ответ:
Какой тип инфраструктуры будем использовать для этого проекта: изменяемый или не изменяемый?
- оба варианта,так как систему необходимо развернуть + планируются частые релизы и доработкаи

Будет ли центральный сервер для управления инфраструктурой?
- я бы рекоммендовал использовать без центрального сервера 

Будут ли агенты на серверах?
- я бы рекоммендовал использовать бехз агентов.

Будут ли использованы средства для управления конфигурацией или инициализации ресурсов?

- да, при использовании изменяемой и неизменяемой инфраструктуры, с учетом частых обновлдений и последующего расширения
  логично использовать оба средства и для управления конфигурацией и для инициализации ресурсов
  
Какие инструменты из уже используемых вы хотели бы использовать для нового проекта? - так как Terraform начал использоваться в предприятии, то предполижительно это является целевым инструментом, значит Terraform будет использоваться для инициализации ресурсов, так же по причине использования внешних ресурсов в том числе для управления конфигурацией Ansible? так же потому что есть на предприятии, и с учетом ответов на предыдущие вопросы.

Хотите ли рассмотреть возможность внедрения новых инструментов для этого проекта? - так как система не отлажена, и конечний ее вид не известен, то имеющихся инструментов достаточно новых инструемнтов не нужно.

2+3 Установка терраформ. + Поддержка легаси кода.
-
![разные версии terraform](https://user-images.githubusercontent.com/53451883/137562307-9a9d9690-fbfe-45fb-bc3c-49918c3c659c.PNG)
