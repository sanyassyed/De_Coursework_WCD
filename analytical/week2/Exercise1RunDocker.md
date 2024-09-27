# Exercise 1: Run Docker
* How to list all the containers on a given host?
    - docker ps -a
* How to run a container?
    - docker run image:tag
* How to attach your shell to a terminal of a running co   ntainer?
    - docker attach container_id/container_name
* True or False? You can remove a running container if it doesn't running anything
    - False
* How to stop and remove a container?
    - docker stop container_id/container_name
    - docker rm container_id/container_name
* How to run a container in detached mode?
    - docker run -d image:tag
* How to bind your local port with the container port?
    - docker run -p 8080:8080 image:tag
* How to list the container images on certain host?
    - docker images -a
* How to check the list of networks?
    - docker network ls
* How to create a docker network called new-network?
    - docker network create new_network
* How to remove an image?
    - docker rmi image_id/image_name
* How to check the list of volume?
    - docker volume ls
* How to inspect a volume?
    - docker volume inspect volume_name
* How to inspect a container?
    - docker inspect container_id/container_name
* How to build and tag an image ?   
    - docker build . -t image_name:tag_name