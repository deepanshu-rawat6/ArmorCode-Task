# ArmorCode-Task

This is the task description for ArmorCode.

## Task Description

The task is to display a message on the screen.

Running Jenkins:

```bash
➜ docker run --name jenkins-with-docker --network=host -p 8080:8080 -p 50000:50000 --detach --restart always -v jenkins_home:/var/jenkins_home  -v /var/run/docker.sock:/var/run/docker.sock jenkins-dind
```
