#!/bin/bash

# runs this script as bellow
# ./bin/composer.sh ./src-projects/www/html/MOODLE_404_STABLE install
# this script build composer container
# mount your php app in this container
# and runs composer install command inside the container

composer_working_dir=$1
composer_subcommand=$2
container_name="phpdev-php8-composer"

echo "###=> Detect the script directory independently of the execution directory"
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo $script_dir
echo .

echo "###=> dockerfile_path"
dockerfile_path="$script_dir/../build-containers/php8-composer/Dockerfile"
echo $dockerfile_path
echo .

echo "###=> build_path"
build_path="$script_dir/../build-containers/php8-composer"
echo $build_path
echo .

echo "###=> container php_ini_dir"
php_ini_dir="$script_dir/../build-containers/php8-composer/usr_local_etc_php"
echo $php_ini_dir
echo .

echo "###=> container composer_working_dir"
working_dir="$script_dir/.$composer_working_dir"
echo $working_dir
echo .

# Build the Docker container from the Dockerfile
docker build -t $container_name -f $dockerfile_path $build_path

# Run the composer install command inside the container
#See 'docker build --help'.
#PHP 8.3.9 (cli) (built: Jul  6 2024 00:38:09) (NTS)
##Copyright (c) The PHP Group
#Zend Engine v4.3.9, Copyright (c) Zend Technologies
#docker run --rm -v "$working_dir:/app" -v "$php_ini_dir:/usr/local/etc/php" -w /app $container_name php -v

docker run --rm -v "$working_dir:/app" -v "$php_ini_dir:/usr/local/etc/php" -w /app $container_name composer $composer_subcommand

# Remove the container