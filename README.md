# ArmorCode-Task

This is the task description for ArmorCode.

## Task Description

The task is to display a message on the screen.

## Dockerfile for DinD Jenkins

```Dockerfile
FROM jenkins/jenkins:lts-jdk17

# Switch to root user to install dependencies
USER root

# Install prerequisites and add Docker repository
RUN apt-get update -qq \
 && apt-get install -qqy --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
 && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
 && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    > /etc/apt/sources.list.d/docker.list

# Install Docker CE
RUN apt-get update -qq \
 && apt-get install -qqy --no-install-recommends docker-ce docker-ce-cli containerd.io \
 && rm -rf /var/lib/apt/lists/*

# Add Jenkins user to the Docker group
RUN usermod -aG docker jenkins

# Switch back to Jenkins user
USER jenkins
```

Running customized-Jenkins:

```bash
➜ docker run --name jenkins-with-docker --network=host -p 8080:8080 -p 50000:50000 --detach --restart always -v jenkins_home:/var/jenkins_home  -v /var/run/docker.sock:/var/run/docker.sock jenkins-dind
```
