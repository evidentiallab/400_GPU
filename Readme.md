
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
sudo docker run --name <STUDENT-NAME> -p <PORT>:22 --gpus all --security-opt=seccomp:unconfined -d utseusgpu
```

https://stackoverflow.com/questions/25185405/using-gpu-from-a-docker-container


USER:
```
ssh -i private_key -p <PORT> utseus@<IP-OF-GPU-SERVER>
```
or
```
ssh gpu
```

