#Какому тегу соответствует коммит 85024d3? 
- tag: v0.12.23 ,найти можно-git show 85024d3

#Сколько родителей у коммита b8d720? 
2 найти можно через команду - git rev-parse b8d720^@
56cd7859e05c36c06b56d013b55a252d0bb7e158
9ea88f22fc6269854151c571162c5bcf958bee2b

#Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea? - aefead2207ef7e2aa5dc81a34aedf0cad4c32545 
команда git show aefea

#Найдите коммит в котором была создана функция func providerSource
 5e06e39fc Use registry alias to fetch providers 
можно найти коммиты - git log -S providerSource --oneline

#Найдите все коммиты в которых была изменена функция globalPluginDirs
$ git log -S globalPluginDirs --oneline
35a058fb3 main: configure credentials from the CLI config file
c0b176109 prevent log output during init
8364383c3 Push plugin discovery down into command package



 # Задание merge and rebase выполнено!
#Описание конфига терраформ
test1
При использовании файла .gitignore в каталоге /terraform - мы будем игнорировать 
-------
 # Локальные каталоги .terraform
** /. terraform / *
---------

# .tfstate файлы
*.tfstate
*.tfstate.*

# Файлы журнала сбоев - ошибок
crash.log

# файлы .tfvars, которые могут содержать отправляемые данные, например - пароли,ключи,и другие приватные данные.
# Они не должны быть частью git - поскольку они могут изменяться в зависемости от окружения.
* .tfvars


# файлы переопределения -обычно используются для локального переопределения ресурсов
override.tf
override.tf.json
*_override.tf
*_override.tf.json

# Здесь советуют включить файлы переопределения которые нам надо использую шаблон - отрицательный
!example_override.tf

# Включить игнор файлов вывода команды terraform plan -out = tfplan
# example: *tfplan*

# Игнорировать файлы конфигурации CLI
.terraformrc

 коммит 2
# Devops-netology2021
