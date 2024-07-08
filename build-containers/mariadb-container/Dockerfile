FROM mariadb:latest

RUN apt-get update -y

COPY init.sql /docker-entrypoint-initdb.d/

EXPOSE 3306




