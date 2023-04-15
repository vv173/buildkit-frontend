**Buildkit Frontend**

This project provides a Dockerfile for the frontend of Buildkit engine. The Dockerfile downloads the content from the prepared repository and builds a Docker image. The Dockerfile is configured to download the repository using the SSH protocol. The image is built using the Buildkit daemon running in a container. Finally, the image is tagged and pushed to the public DockerHub repository.

***Prerequisites***

Buildkit daemon
Docker
Git

**Building the Docker Image**

To build the Docker image, run the following command:
```
docker build --ssh default --build-arg DOCKER_PASSWORD=$DOCKER_PASSWORD --build-arg DOCKER_USERNAME=$DOCKER_USERNAME -t build-front . 
```

**Running the Docker Container**

To run the Docker container, run the following command:
```
docker run -dt -v /var/run/docker.sock:/var/run/docker.sock --name buildtest build-front
```