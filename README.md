6.Как добавить оперативной памяти или ресурсов процессора виртуальной машине?
изменить параметр v.memory =
config.vm.provider "virtualbox" do |v|
  v.memory = 1024
  v.cpus = 2
end

8.export HISTSIZE=2000 - переменная  HISTSIZE устанавливает длину журнала - можно так изменить вывод команды history используя переменную export


В manual строка 326. или строка 316 "переменные истории" описание переменных команды history 
326 Максимальное количество записей в истории. Это должно быть изменено с помощью функции stifle_history().

HISTCONTROL — представляет из себя список опций, разделенных двоеточиями.

Они контролируют каким образом список команд сохраняется в истории.

Опция	
ignoreboth	использовать обе опции ‘ignorespace’ и ‘ignoredups’

ignorespace	не сохранять строки начинающиеся с символа <пробел>
ignoredups	не сохранять строки, совпадающие с последней выполненной командой


9.В каких сценариях использования применимы скобки {} -   применять данные скобки можно в любых сценариях (скриптах) 

10.Основываясь на предыдущем вопросе, как создать однократным вызовом touch 100000 файлов? А получилось ли создать 300000? -да получиться и то и то. даже вот такое [10000000000]

vagrant@vagrant:~$ touch 100000 3000000
vagrant@vagrant:~$ ls -hl
total 0
- -rw-rw-r-- 1 vagrant vagrant 0 May 26 15:50  100000
- -rw-rw-r-- 1 vagrant vagrant 0 May 26 15:50  3000000
- -rw-rw-r-- 1 vagrant vagrant 0 May 25 17:03  file

11.В man bash поищите по /\[\[. Что делает конструкция [[ -d /tmp ]]
конструкция [[ -d /tmp ]] возвращает 0 или 1 в зависимости от выражения внутри ( В данном случае возвращает Истину, т. к. 
выражение внутри проверяет существует директория  /tmp ) 

12.Основываясь на знаниях о просмотре текущих (например, PATH) и установке новых переменных; командах, которые мы рассматривали, 
добейтесь в выводе type -a bash в виртуальной машине наличия первым пунктом в списке:

- vagrant@vagrant:/tmp/new_bash$ PATH=$PATH:/tmp/new_bash/
- vagrant@vagrant:/tmp/new_bash$ type -a bash
- bash is /usr/bin/bash
- bash is /bin/bash
- bash is /tmp/new_bash/bash

Задание 12
Что-то пошло не так и пропали разделители? - вроде нет ,делаю все как обычно.

В конце что-то от гита прицепилось? да - забыл убрать . так все впорядке. все получилось . 


13.Чем отличается планирование команд с помощью batch и at?

Тогда как cron используется для назначения повторяющихся задач, команда at используется для назначения одноразового задания на заданное время, 
а команда batch — для назначения одноразовых задач, которые должны выполняться, когда загрузка системы становится меньше 0,8







































------------------------------------------------------
# Какому тегу соответствует коммит 85024d3? 
- tag: v0.12.23 ,найти можно-git show 85024d3

# Сколько родителей у коммита b8d720? 
2 найти можно через команду - git rev-parse b8d720^@
56cd7859e05c36c06b56d013b55a252d0bb7e158
9ea88f22fc6269854151c571162c5bcf958bee2b

# Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea?
 - aefead2207ef7e2aa5dc81a34aedf0cad4c32545 
команда git show aefea

# Найдите коммит в котором была создана функция func providerSource
 5e06e39fc Use registry alias to fetch providers 
можно найти коммиты - git log -S providerSource --oneline

# Найдите все коммиты в которых была изменена функция globalPluginDirs
$ git log -S globalPluginDirs --oneline
35a058fb3 main: configure credentials from the CLI config file
c0b176109 prevent log output during init
8364383c3 Push plugin discovery down into command package

# Кто автор функции synchronizedWriters?
Author: Martin Atkins <mart@degeneration.co.uk>
git log -S synchronizedWriters --oneline

# Перечислите хеши и комментарии всех коммитов которые были сделаны между тегами v0.12.23 и v0.12.24.

commit 33ff1c03bb960b332be3af2e333462dde88b279e (tag: v0.12.24)

    v0.12.24

commit b14b74c4939dcab573326f4e3ee2a62e23e12f89

    [Website] vmc provider links

commit 3f235065b9347a758efadc92295b540ee0a5e26e

Update CHANGELOG.md

commit 6ae64e247b332925b872447e9ce869657281c2bf

registry: Fix panic when server is unreachable

    Non-HTTP errors previously resulted in a panic due to dereferencing the
    resp pointer while it was nil, as part of rendering the error message.
    This commit changes the error message formatting to cope with a nil
    response, and extends test coverage.

    Fixes #24384

commit 5c619ca1baf2e21a155fcdb4c264cc9e24a2a353

    website: Remove links to the getting started guide's old location

    Since these links were in the soon-to-be-deprecated 0.11 language section, I
    think we can just remove them without needing to find an equivalent link.

commit 06275647e2b53d97d4f0a19a0fec11f6d69820b5


    Update CHANGELOG.md

commit d5f9411f5108260320064349b757f55c09bc4b80

    command: Fix bug when using terraform login on Windows

commit 4b6d06cc5dcb78af637bbb19c198faff37a066ed

Update CHANGELOG.md

commit dd01a35078f040ca984cdd349f18d0b67e486c35


    Update CHANGELOG.md

commit 225466bc3e5f35baa5d07197bbc079345b77525e


    Cleanup after v0.12.23 release



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
