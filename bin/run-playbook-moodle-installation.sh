#!/bin/bash

#EXTRA_ARGS="RUN_IN_DEBUG_MODE=true AMBIENTE_DE=dev moodle_version=402 getmoodleby=gitclone"
#EXTRA_ARGS="RUN_IN_DEBUG_MODE=true AMBIENTE_DE=dev moodle_version=402 getmoodleby=download"
EXTRA_ARGS="RUN_IN_DEBUG_MODE=true AMBIENTE_DE=dev moodle_version=402 getmoodleby=gitclone"

ansible-playbook  ./playbook-moodle-installation.yml -e "$EXTRA_ARGS" --ask-become-pass
