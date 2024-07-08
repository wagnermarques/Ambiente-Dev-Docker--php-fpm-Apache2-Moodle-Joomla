#!/bin/bash

#ansible-galaxy collection install community.general
#[spot@fedora infra-apache2-moodle-devenv]$ ansible-galaxy collection install community.general
#Starting galaxy collection install process
#Process install dependency map
#Starting collection install process
#Downloading https://galaxy.ansible.com/api/v3/plugin/ansible/content/published/collections/artifacts/community-general-8.0.2.tar.gz to /home/spot/.ansible/tmp/ansible-local-47201_7m7wb_u/tmpxlit1246/community-general-8.0.2-6v_y5gio
#Installing 'community.general:8.0.2' to '/home/spot/.ansible/collections/ansible_collections/community/general'
#community.general:8.0.2 was installed successfully


#pip install --upgrade ansible
#Successfully installed ansible-8.6.1 ansible-core-2.15.6
#Defaulting to user installation because normal site-packages is not writeable
#Requirement already satisfied: ansible in /usr/lib/python3.11/site-packages (7.7.0)
#Collecting ansible
#  Downloading ansible-8.6.1-py3-none-any.whl (48.3 MB)
#Collecting ansible-core~=2.15.6
#  Downloading ansible_core-2.15.6-py3-none-any.whl (2.2 MB)


#https://moodle.academy/mod/page/view.php?id=753


#Esses arqumentos extras sao passados e utilizados no build
#Mas tem algumas variaveis que sao definidas no playbook.yml principal
#EXTRA_ARGS="RUN_IN_DEBUG_MODE=true AMBIENTE_DE=dev moodle_version=402"
EXTRA_ARGS="RUN_IN_DEBUG_MODE=true AMBIENTE_DE=dev"
#RUN_IN_DEBUG_MODE=true
#printa os ansible facts and variaveis utilizadas no build
#qualquer outro valor nao vai printar

#AMBIENTE_DE=dev
#faz o build utilizar os playbook com configuracoes do amb de dev

#moodle_version=402

ansible-playbook  ./playbook-raise-containers.yml -e "$EXTRA_ARGS" --ask-become-pass


