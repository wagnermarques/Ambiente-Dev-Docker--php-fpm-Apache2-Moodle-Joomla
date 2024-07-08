#!/bin/bash

containers_stop(){
  for c in $(sudo docker container ls | awk '{print $1}'); do docker stop $c; done
}

containers_rm(){
  for c in $(sudo docker container ls -a | awk '{print $1}'); do docker rm $c; done
}

images_rm(){
  for c in $(sudo docker image ls | awk '{print $3}'); do docker image rm -f $c; done
}

volumes_rm(){
  for v in $(sudo docker volume ls | awk '{print $2}'); do docker volume rm $c $v; done
}

network_rm(){
  for v in $(sudo docker network ls | awk '{print $1}'); do docker network rm $c $v; done
  }

containers_stop
containers_rm
images_rm
volumes_rm

containers_ls_a(){
  echo ">>>>>containers_ls_a(){..."
  sudo docker container ls -a
}

images_ls(){
  echo ">>>>>images_ls(){..."
  sudo docker image ls
}

volumes_ls(){
  echo ">>>>>volumes_ls(){..."
  sudo docker volume ls
}


containers_ls_a
images_ls
volumes_ls
network_rm







