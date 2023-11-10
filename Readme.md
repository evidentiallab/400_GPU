
58.199.168.215

https://58.199.168.215:9443

vscode -> ssh docker, jupyter notebook, VM has access to GPU, install anything in VM,

if corrupted, apply for a new one

### ADMIN:

if a student applies for a VM:
- Sunlogin/ssh login to Server
-  `sudo docker run --name lunde -p 20001:22 --gpus all --security-opt=seccomp:unconfined -d utseusgpu`
- https://58.199.168.215:9443
- Tell student to connect to 58.199.168.215:20001
    - Either ssh
    - Either vscode

## README:

https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers

https://www.geeksforgeeks.org/remove-all-containers-and-images-in-docker/


https://code.visualstudio.com/remote/advancedcontainers/develop-remote-host


ADMIN:
```bash
sudo docker run --name <STUDENT-NAME> -p <PORT>:22 -p <PORT-NOTUSED>:7000 -p <PORT>:6000 --gpus all --security-opt=seccomp:unconfined -d utseusgpu
```

https://stackoverflow.com/questions/25185405/using-gpu-from-a-docker-container


USER:
```
ssh -i private_key -p <PORT> utseus@<IP-OF-GPU-SERVER> 
```
or
```
ssh -i private_key -p <PORT> utseus@<IP-OF-FRP-SERVER> 
```
or
```
ssh gpu
```


# FOR BUILDING IMAGE ONLY

## First time configuration

Load the image and run it:
```bash
sudo docker load -i utseusgpu.tar
sudo docker images
sudo docker ps -a
```

## if you want to challenge youself

This is optional. If you want to build the image from Dockerfile:

```bash
sudo  echo '{ "features": { "buildkit": true } }' | sudo tee /etc/docker/daemon.json && sudo service docker restart
sudo docker build -t utseusgpu .
sudo docker save -o ~/utseusgpu.tar utseusgpu
sudo chmod 666 ~/utseusgpu.tar
```

## docker gpu

https://linnote.com/tensorflow-gpu-in-docker/

- 測試是否安裝成功
```bash
sudo docker run --rm --runtime=nvidia --gpus all nvidia/cuda:11.6.2-base-ubuntu20.04 nvidia-smi
```

- 在Docker環境中使用GPU跑Tensorflow
```bash
sudo docker run --gpus all -it tensorflow/tensorflow:latest-gpu bash
#進入到python console
python 
>>> import tensorflow as tf
>>> tf.config.list_physical_devices('GPU')
```

https://hub.docker.com/r/nvidia/cuda/tags?page=1

## portainer.io

https://docs.portainer.io/start/install-ce/server/docker/linux

## multi-service container

https://docs.docker.com/config/containers/multi-service_container/