#!/bin/bash
#https://docs.moodle.org/403/en/Step-by-step_Installation_Guide_for_Ubuntu
docker exec -it -h moodle-service-profaulasmariadb-service-dev mysql -uroot -p < 
CREATE DATABASE moodle DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


create user 'moodledude'@'localhost' IDENTIFIED BY 'passwordformoodledude';

GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON moodle.* TO 'moodledude'@'localhost';

