**Buildkit Frontend**

This project provides a Dockerfile for the frontend of Buildkit engine. The Dockerfile downloads the content from the prepared repository and builds a Docker image. The Dockerfile is configured to download the repository using the SSH protocol. The image is built using the Buildkit daemon running in a container. Finally, the image is tagged and pushed to the public DockerHub repository.

***Prerequisites***

Buildkit daemon

Docker

Git

Running ssh-agent

***Ensure that the ssh-agent is running.***
```
$ eval $(ssh-agent)
$ ssh-add ~/.ssh/id_rsa
(Input your passphrase here)
```

***To run buildkit daemon in a container:***
```
docker run -d --name buildkitd --privileged moby/buildkit:latest
```

***Building the Docker Image***

To build the Docker image, run the following command:
```
docker build --ssh default=$HOME/.ssh/name_of_your_ssh_key --secret id=docker-secret,env=DOCKER_PASSWORD --build-arg DOCKER_USERNAME=$DOCKER_USERNAME -t buildkit-front . 
```

***Running the Docker Container***

To run the Docker container, run the following command:
```
docker run -dt -v /var/run/docker.sock:/var/run/docker.sock --name buildkit-con buildkit-front
```