#!/bin/bash

MOODLE_HOME="./../www/html"

cd $MOODLE_HOME
php cli/generate.php --recipe=recipe.yaml
