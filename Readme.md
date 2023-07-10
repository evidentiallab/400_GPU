
## First time configuration

Load the image and run it:
```bash
sudo docker load -i utseusgpu.tar
sudo docker images
sudo docker run --name <STUDENT-NAME> --security-opt=seccomp:unconfined -it utseusgpu bash
sudo docker ps -a
```

## if you want to challenge youself

This is optional. If you want to build the image from Dockerfile:

```bash
sudo  echo '{ "features": { "buildkit": true } }' | sudo tee /etc/docker/daemon.json && sudo service docker restart
sudo docker build -t utseusgpu .
```

## WSL 2 Docker VS Code

https://levelup.gitconnected.com/remote-development-with-docker-wsl2-and-visual-studio-code-36fc3ff303c6

https://securecloud.blog/2021/12/07/wsl2-use-docker-with-vscode-without-docker-desktop/

https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-containers

## Ref:

https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers

https://www.geeksforgeeks.org/remove-all-containers-and-images-in-docker/


# GPU_machine


https://code.visualstudio.com/remote/advancedcontainers/develop-remote-host

```bash
sudo docker run --name <STUDENT-NAME> --security-opt=seccomp:unconfined -it -d utseusgpu
```
