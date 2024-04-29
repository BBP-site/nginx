# BBP Nginx

Реализует роутинг [bbp.ru](https://bbp.ru/) на сервере Nginx

## Содержание

- [Технологии](#технологии)
- [Использование](#использование)
- [Сертификаты](#сертификаты)
- [Обновление и ребилд сервисов](#обновление-и-ребилд-сервисов)

## Технологии

- [Nginx](https://nginx.org/)
- [Docker](https://www.docker.com/)

## Использование

Для запуска проекта потребуется установить [Docker](https://docs.docker.com/engine/install/ubuntu/).

В файле [docker-compose.yml](docker-compose.yml) настроена работа с
сервисами [frontend](https://github.com/BBP-site/frontend) и [backend](https://github.com/BBP-site/backend). Для
корректной работы требуется, чтобы эти сервисы находились на одном уровне вложенности с `nginx` и имели
названия `frontend` и `backend`.

Далее можно запустить все сервисы backend, frontend и nginx из директории nginx одной командой:

```sh
docker compose up -d
```

## Сертификаты

Так как сайт работает на протоколе `https` в проект требуется добавить SSL сертификат,
который представляет собой 2 файла с названиями: `certificate.crt` и `key.key`.
По истечению срока действия сертификата необходимо обновить его вручную через SFTP.

## Обновление и ребилд сервисов

Обновления заносятся с помощью git для каждого сервиса индивидуально.
После обновления, требуется остановить сервис на который были добавлены изменения и вызвать команды сборки и повторного
запуска сервиса. Далее пример для сервиса `frontend` (команды вызываются из директории nginx):

```sh
docker compose stop frontend
docker compose rm frontend
docker compose build --no-cache frontend
docker compose up -d
````