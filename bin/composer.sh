#!/bin/bash

# runs this script as bellow
# ./bin/composer.sh ./src-projects/www/html/MOODLE_404_STABLE install
# this script build composer container
# mount your php app in this container
# and runs composer install command inside the container
composer_subcommand=$@
container_name="phpdev-php8-composer"

echo "###=> Detect the script directory independently of the execution directory"
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo " ##### composer script_dir = $script_dir" 
echo .

# The path to the directory containing the PHP application
# This will be mounted into the container in container /app dir
app_home_dir="$script_dir/../src-projects/www/html"


# providing the php container where we can runs composer command
echo "###=> dockerfile_path (we need a php container to execute composer command)"
dockerfile_path="$script_dir/../build-containers/php8-composer/Dockerfile"
echo $dockerfile_path
echo .

echo "###=> build_path"
build_path="$script_dir/../build-containers/php8-composer"
echo $build_path
echo .

echo "###=> container php_ini_dir (our php container may need php.ini)"
php_ini_dir="$script_dir/../build-containers/php8-composer/usr_local_etc_php"
echo $php_ini_dir
echo .


# Build the Docker container from the Dockerfile
docker build -t $container_name -f $dockerfile_path $build_path

# Run the composer install command inside the container
#See 'docker build --help'.
#PHP 8.3.9 (cli) (built: Jul  6 2024 00:38:09) (NTS)
##Copyright (c) The PHP Group
#Zend Engine v4.3.9, Copyright (c) Zend Technologies
#docker run --rm -v "$working_dir:/app" -v "$php_ini_dir:/usr/local/etc/php" -w /app $container_name php -v

#show the concatenated composer command string that will be ruuning on
echo " ##### "
echo  docker run --rm -v "$app_home_dir:/app" -v "$php_ini_dir:/usr/local/etc/php" -w /app $container_name composer $composer_subcommand

docker run --rm -v "$app_home_dir:/app" -v "$php_ini_dir:/usr/local/etc/php" -w /app $container_name composer $composer_subcommand

