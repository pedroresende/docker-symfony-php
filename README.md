# Docker Symfony

```
$ docker-compose up
```
In order to access the database

```
mysql -uroot -psymfony -P3307
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
