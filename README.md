docker build --ssh default --build-arg DOCKER_PASSWORD=$DOCKER_PASSWORD --build-arg DOCKER_USERNAME=$DOCKER_USERNAME -t build-front . 

docker run -dt -v /var/run/docker.sock:/var/run/docker.sock --name buildtest2 build-front

;
