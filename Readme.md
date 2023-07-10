
## First time configuration

Load the image and run it:
```bash
sudo docker load -i utseusgpu.tar
sudo docker images
sudo docker run --name <STUDENT-NAME> -p <PORT>:22 --security-opt=seccomp:unconfined -d utseusgpu
sudo docker ps -a
```

## if you want to challenge youself

This is optional. If you want to build the image from Dockerfile:

```bash
sudo  echo '{ "features": { "buildkit": true } }' | sudo tee /etc/docker/daemon.json && sudo service docker restart
sudo docker build -t utseusgpu .
```

## Ref:

https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers

https://www.geeksforgeeks.org/remove-all-containers-and-images-in-docker/


# GPU_machine


https://code.visualstudio.com/remote/advancedcontainers/develop-remote-host

```bash
sudo docker run --name <STUDENT-NAME> -p <PORT>:22 --security-opt=seccomp:unconfined -d utseusgpu
```
