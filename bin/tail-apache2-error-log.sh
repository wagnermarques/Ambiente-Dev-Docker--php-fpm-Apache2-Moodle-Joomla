#!/bin/bash
sudo docker exec -it moodle-service-profaulasapache2-service-dev tail -f /var/log/apache2/error.log
