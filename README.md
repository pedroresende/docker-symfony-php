# Docker Symfony

```
$ docker-compose up
```

In order to access the database

```
$ docker-compose exec db mariadb -u root -p symfony
```

Open your browser

```
http://localhost:81/
```

You can change the default variables values on .env file

## How do deploy a new symfony project

```
$ docker-compose exec php bash
$ cd ../ && rm -rf symfony && symfony new symfony
```
